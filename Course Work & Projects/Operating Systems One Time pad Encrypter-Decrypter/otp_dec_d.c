/*---------------------------------------------------
 * Philip Tan
 * CS 344 Program 4
 * OTP - 5 small programs for encryption & decryption
 * File name: otp_enc_d
 * -------------------------------------------------*/
 
/*--------------------------------------------------------------
 * DESCRIPTION:
 * Program runs just like otp_enc_d, in syntax and usage. This 
 * code will decrypt the ciphertext though, using the ciphertext
 * and the given key.
 *
 * It will return plaintext again to otp_dec
 *
 * NOTE: SOURCES THE GIVEN SERVER.C FILE FROM CANVAS, AND SEND & RECEIVE
 * FUNCTIONS AND HANDSHAKE VERIFICATION BASED ON GITHUB USER JUSTIN 
 * HAMMARS CODE https://github.com/justinhammar/
 *-------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <ctype.h>

//Functions
void sendFile(int newsockfd, const char* text, long length);
char *receivedFile(int newsockfd, long length);

//Function for errors
void error(const char *msg) {
	perror(msg);
	exit(1);
}

//Provides a value corresponding to each letter of the 
//alphabet, and provides a number for spaces as well
int charConvert(char c) {
    switch(c) {
        case 'A': {return 0;}
        case 'B': {return 1;}
        case 'C': {return 2;}
        case 'D': {return 3;}
        case 'E': {return 4;}
        case 'F': {return 5;}
        case 'G': {return 6;}
        case 'H': {return 7;}
        case 'I': {return 8;}
        case 'J': {return 9;}
        case 'K': {return 10;}
        case 'L': {return 11;}
        case 'M': {return 12;}
        case 'N': {return 13;}
        case 'O': {return 14;}
        case 'P': {return 15;}
        case 'Q': {return 16;}
        case 'R': {return 17;}
        case 'S': {return 18;}
        case 'T': {return 19;}
        case 'U': {return 20;}
        case 'V': {return 21;}
        case 'W': {return 22;}
        case 'X': {return 23;}
        case 'Y': {return 24;}
        case 'Z': {return 25;}
        case ' ': {return 26;}
    }
}
	

int main(int argc, char *argv[]) {
	int sockfd; //file descriptor
	int newsockfd; //file descriptor for acceptance 
	int portno; //port
	socklen_t clilen; //this is the client address length
	char sendBuffer[1024]; //a buffer for the sending
	char Buffer[1024]; //a general buffer
	struct sockaddr_in serv_addr, cli_addr; //these are the server and client structs
	int n, i, pid, status, t, k, c; //variables for later use
	int text_length; //text length storage
	int key_length; //key length strorage
	char *text; //our text storage
	char *key; //our key storage
	int binder; //our bind value store

	//Make sure args is used properly
	if (argc < 2) {
		fprintf(stderr, "ERROR, no port provided (ENCD TRACER 1).\n");
		exit(1);
	}
	else {
		//printf("Argc value is valid.\n");
	}
	
	//Start the daemon, set socket fd for IP & TCP, check for socket open success
	//Returns an FD referring to the socket
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0) {
		error("ERROR opening socket! (ENCD TRACER 2).\n");
	}
	else {
		//tracer statement
		//printf("Sockfd number is %d.\n", sockfd);
	}
	
	//clear the buffer for the server address
	bzero((char *) &serv_addr, sizeof(serv_addr));
	portno = atoi(argv[1]); //convert the value passed in and save the port number
	//printf("TRACER: Portno is %d.\n", portno);
	serv_addr.sin_family = AF_INET; //Set address family as INTERNET
	serv_addr.sin_addr.s_addr = INADDR_ANY; //Set to accept connections from any machine
	serv_addr.sin_port = htons(portno); //Listen only on the specified port

	//Bind socket to port
	binder = bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)); 
	if (binder < 0) {
		error("ERROR on binding (ENCD TRACER 3).\n");
	}
	else {
		//tracer statement
		//printf("Bind returns value of: %d.\n", binder);
	}
	
	//Listen for connections, set limit to max 5
	listen(sockfd, 5);

	//Start our loop 
	while(1) {
		//set the length of the client address for the accept call
		clilen = sizeof(cli_addr);
		//wait for connection attempts from a client process
		newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
		if (newsockfd < 0) { //return error message if things go wrong
			error("ERROR on accept (ENCD TRACER 4).\n");
		}
		else {
			//tracer statement
			//printf("Newsockfd returns: %d\n", newsockfd);
		}
		
		pid = fork();
		if (pid<0) //check for forking error
		{
			printf("Fork error.\n"); 
			break;
		}
		else if (pid==0)
		{
			//child will handle the connection
			close(sockfd);
			//clear the buffer
			bzero(Buffer, sizeof(Buffer));
			//read incoming messages
			read(newsockfd, Buffer, sizeof(Buffer)-1);
			if (strcmp(Buffer, "dec_authorization") != 0) {
				//printf("ERROR invalid client.\n");
				char invalid[] = "Invalid client.";
				//send error message back to client side
				write(newsockfd, invalid, sizeof(invalid));
				exit(2);
			}
			//otherwise write confirmation of authentication
			else {
				char valid[] = "decd_authorization";
				write(newsockfd, valid, sizeof(valid));
			}			
		
			/*SECTION FOR THE TEXT ------------*/
			//clear the buffer again
			bzero(Buffer, sizeof(Buffer));
			//receive and echo length of coming plaintext
			read(newsockfd, Buffer, sizeof(Buffer));
			write(newsockfd, Buffer, strlen(Buffer));
			//set length to number
			text_length=atoi(Buffer);
			text=receivedFile(newsockfd, text_length);

			/*SECTION FOR THE KEY ------------------------ */
			//clear buffer
			bzero(Buffer, sizeof(Buffer));
			//receive and echo length of coming plaintext
			read(newsockfd, Buffer, sizeof(Buffer));
			write(newsockfd, Buffer, strlen(Buffer));
			//set length to number
			key_length=atoi(Buffer);
			key=receivedFile(newsockfd, key_length);

			//DECRYPTION SECTION:
			char alpha[28] = "ABCDEFGHIJKLMNOPQRSTUVQXYZ ";
            //decryption for loop
            for (i= 0; i<text_length; i++) {
                if (text[i]!='\n') {
                	//here we change the characters to integers in the range of 0-26
					t=charConvert(text[i]);
					k=charConvert(key[i]);
                    c=(t-k+27)%27; //mod 27 to adjust
                    //turn it back into text in decrypted form
                    if (c==26) {
                        text[i]=' ';
                    } 
                    else {
                        text[i]='A'+(char)c; //write it into text
                    }
                }
            }
			
            //send decrypted text
            sendFile(newsockfd, text, text_length);
            //free our stored data
			free(text);
			free(key);	
			exit(0);
			break;
		}
		else
		{
			close(newsockfd); //close parent
			while(pid>0) { //check for children that have finished their chores
				pid = waitpid(-1, &status, WNOHANG);
			}
		}
	}
	close(sockfd);
	return 0;
}


char *receivedFile(int newsockfd, long length) {
	char *aString = (char*)malloc(length); //initialize and allocate
	char aRecv[] = "File received"; //message to send back
	int bytesRd;
	int j;
	for(j=0; j<length; j+=(long int)bytesRd) {
		bytesRd = read(newsockfd, aString + j, length -j);
		if (bytesRd < 0) {
			error("ERROR daemon read.\n");
		}
	}
	//write it back again
	write(newsockfd, aRecv, strlen(aRecv));
	return aString;
}

void sendFile(int newsockfd, const char* text, long length) {
    int bytesRd; //bytes read
    int bytesWr; //bytes written
    long int i;
    //send the ciphertext
    for (i=0; i<length; i+=(long)bytesWr) {
        bytesWr=write(newsockfd, text + i, length - i);
        if (bytesWr<0) {
            perror("Error daemon write.\n");
            exit(1);
        }
    }
}