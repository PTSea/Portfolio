/*---------------------------------------------------
 * Philip Tan
 * CS 344 Program 4
 * OTP - 5 small programs for encryption & decryption
 * File name: otp_enc
 * -------------------------------------------------*/
 
/*--------------------------------------------------------------
 * DESCRIPTION:
 * This program connects to otp_enc_d and asks it to do an OTP
 * encryption. OTP doesn't do the encrypting.
 * 
 * Use: otp_enc plaintext key port
 * Plaintext is the name of a file that contains the plaintext 
 * we want to encrypt. Key is the encryption key we want to use.
 * Port is the port that otp_enc should attempt to connect to otp_enc_d on.
 *
 * otp_enc should receive the ciphertext and output it to stdout.
 *
 * If otp_enc receives key or plaintext files with bad characters,
 * or the key file is shorter than the plaintext, we exit with an error.
 * If otp_enc can't find the port given, it should also return an error.
 * If it successfully runs, it should set the exit value to 0.
 * otp_enc shouldn't be able to connect to otp_dec_d.
 * 
 * NOTE: SOURCES THE GIVEN CLIENT.C FILE. SEND & RECEIVE FUNCTIONS
 * FROM GITHUB USER JUSTIN HAMMAR https://github.com/justinhammar/
 *-------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h> //IP family, socket info
#include <netinet/in.h> //IP family, server info
#include <netdb.h> //network db ops, ports
#include <fcntl.h> //file control stuff

//send and receive functions
void sender(int fd, int sockfd);
void receiver(int sockfd, long length);

//function for error printing
void error(const char *msg) {
	perror(msg);
	exit(1);
}

int main(int argc, char *argv[]) {
	int sockfd; //file descriptor
	int portno; //port
	int n;
	int bytesRd;
	int plaintextfd, keytextfd;
	struct sockaddr_in server; //set up the address struct
	struct hostent *serv_addr;
	char buffer[1024];
	long int text_length;
	int connectVal;

	//Make sure args is used properly
	if (argc < 4) {
		fprintf(stderr, "Usage: %s plaintext key port (ENC TRACER 1).\n");
		exit(1);
	}
	else {
		//tracer statement
		//printf("Argc values valid!\n");
	}
	
	//save the port nombre	
	portno = atoi(argv[3]); 
	//printf("TRACER: The port number is %d.\n", portno);

	//plaintext and keytext open
	plaintextfd = open(argv[1], O_RDONLY);//read only mode
	keytextfd = open(argv[2], O_RDONLY);
	if (plaintextfd < 0 || keytextfd < 0) {
		error("ERROR opening fd's (ENC TRACER 2).\n");
	}
	
	//make sure the plaintext contains valid chars
	while (read(plaintextfd, buffer, 1) != 0) {
		//exclude the space, keep it within range of a to z
		if ((buffer[0] < 'A' || buffer[0] > 'Z') && buffer[0] != ' ') {
			if (buffer[0] != '\n') {
				error("ERROR plaintext has bad characters (ENC TRACER 3).\n");
			}
		}
	}
	
	//make sure the key is long enough
	text_length = lseek(plaintextfd, 0, SEEK_END);
	if (lseek(keytextfd, 0, SEEK_END) < text_length) {
	 	error("ERROR key length too short (ENC TRACER 4).\n");
	}

	//Start the daemon, set socket fd for IP & TCP, check for socket open success
	//Returns an FD referring to the socket
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0) {
		error("Error opening socket! (ENC TRACER 5).\n");
	}
	else {
		//tracer statement
		//printf("Sockfd number is %d.\n", sockfd);
	}

	//clear the buffer for the server address
	bzero((char *) &serv_addr, sizeof(serv_addr));
	serv_addr = gethostbyname("localhost");
	if (serv_addr == NULL) {
		printf("ERROR IP address.\n");
		exit(1);
	}
	server.sin_family = AF_INET; //Set address family as INTERNET
	//server.sin_addr.s_addr = htonl(INADDR_ANY); //Set to accept connections from any machine
	server.sin_port = htons(portno); //Listen only on the specified port
	memcpy(&server.sin_addr, serv_addr->h_addr, serv_addr->h_length);

	//Connect to the port
	//If given port not found in otp_enc_d, report error and port # and exit(2)
	connectVal = connect(sockfd, (struct sockaddr *) &server, sizeof(server));
	if (connectVal < 0) {
		printf("(ENC TRACER 6) ERROR connecting to port %d.\n", portno);
		exit(2);
	}	
	else {
		//tracer statement
		//printf("Connection returns value: %d\n", connectVal);
	}

	//clear mem, prepare for authorization handshake
	bzero(buffer, sizeof(buffer));
	char authorize[] = "enc_authorization";
	//Confirm daemon connection is correct:
	write(sockfd, authorize, sizeof(authorize));
	read(sockfd, buffer, sizeof(buffer));
	if (strcmp(buffer, "encd_authorization") != 0) {
		printf("(ENC TRACER 7) ERROR unable to reach otp_enc_d on port.\n");
		exit(2);
	}	

	//send the plaintext data
	sender(plaintextfd, sockfd);
	//send the key data
	sender(keytextfd, sockfd);
	//receive the ciphertext, print it out
	receiver(sockfd, text_length);
	//close
	close(sockfd);
	//Program ran successfully, so exit(0)
	return 0;

}

void sender(int fd, int sockfd) {
	long int length; //length of fd file passed in
	int stringLen; //length of the string
	char lengEch[16]; //string length for server
	int bytesRd; //num bytes read
	int bytesWr; //num bytes written
	char buffer[1024];
	int i;
	//get length of the input files using lseek
	length=lseek(fd, 0, SEEK_END);
	//set pointers back to beginning
	lseek(fd, 0, SEEK_SET);
	//clear memory
	bzero (lengEch, sizeof(lengEch));
	//tell daemon size of the text file
 	stringLen=sprintf(buffer, "%ld", length);
	write(sockfd, buffer, stringLen);
	read(sockfd, lengEch, sizeof(lengEch));
	if (strcmp(buffer, lengEch)!=0) {
		error("ERROR length discrepancy BUFFER/STRING LENGTH (ENC TRACER 8).\n");
	}
	//use the while loop to send the file
	while (1) {
		//grab pieces from the file
		bytesRd=read(fd, buffer, sizeof(buffer));
		if (bytesRd==0) { //this means we finished reading
			close(fd); //close the fd
			break;
		}
		//send the data in chunks until its all sent
		for (i=0; i<bytesRd; i+=bytesWr) {
			bytesWr=write(sockfd, buffer + i, bytesRd - i);
			if (bytesWr<0) {
				error("Client write error (ENC TRACER 9).\n");
			}
		}
	}
	//clear the memory
	bzero(buffer, sizeof(buffer));
	//read confirmation from daemon
	bytesRd = read(sockfd, buffer, 1024);
	//Error if less than 0 bytes read
	if (bytesRd < 0) {
		error("ERROR client read confirm (ENC TRACER 10).\n");
	}
	//success
	if (strcmp(buffer, "File received") != 0) {
		error("Arrival verification (ENC TRACER 11).\n");
	}
}


void receiver(int sockfd, long length) {
	int bytesRd;
	char holder[1024];
	int i;
	//loop through and receive the chunks
	//output error if bytes too little
	for (i=0; i<length; i+=(long int)bytesRd) {
		bytesRd=read(sockfd, holder, sizeof(holder)-1);
		if (bytesRd<0) {
			error("ERROR client read (ENC TRACER 12).\n");
		}
		holder[bytesRd]='\0';
		printf("%s",holder);
	}

}