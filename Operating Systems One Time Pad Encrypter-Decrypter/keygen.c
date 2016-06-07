/*-------------------------------------------------------
 * Philip Tan
 * CS 344 Program 4
 * OTP - 5 small programs for encrpytion & decryption
 * File name: keygen
 * -----------------------------------------------------*/

/*--------------------------------------------------------------------------
 * DESCRIPTION:
 * Program creates a key file of specified length. Characters in the file
 * genereated will be any of the 27 allowed characters. Generate using
 * standard UNIX randomization methods. Do no create spaces every 5 characters.
 * We don't have to do any fancy random number feneration.
 *
 * Use: keygen keylength
 * keylength is the length of the key file in characters. keygen outputs to 
 * stdout
 *
 ----------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/types.h>
#include <ctype.h>

//function to generate random strings
void ranStringGen(char *aString, int length); 

int main (int argc, char *argv[]) {
	//seed random number
	srand(time(NULL));	
	//A variable to hold the randomized string
	char *ranString;
	//Length of the key
	int ranLength;
	//check for teh correct amount of variables passed in
	if (argc != 2) {
		printf("Usage: keygen keylength\n");
		exit(1);
	}
	//if there is a correct amount of parameters passed in
	else if (argc == 2) {
		int ranLength = atoi(argv[1]); //change key length to an integer
		ranString = (char*)malloc(sizeof(char)*(ranLength+1)); //allocate memory for the string
		//call the ranstring generator function to get a random string
		ranStringGen(ranString, ranLength);
		printf("%s\n", ranString); //output as specified
	}
	//free up the memory
	free(ranString);
	return 0;
	
}

void ranStringGen(char *aString, int length) {
	int i;
	//loop through and generate randomly generate
	//from the possible characetrs
	for (i = 0; i < length; i++) {
		char currentLet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ "[rand() % 27];
		aString[i] = currentLet;
	}
	//null terminate the end
	aString[length] = '\0';
}


































