/*
 * Philip Tan
 * CS 362 Summer 2015
 * Created on: Jul 21, 2015
 * RANDOM tests for Adventurer card
 */

#include "dominion.h"
#include "dominion_helpers.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <assert.h>
#include "rngs.h"

#define MAX_TEST_ITER 15000
#define numPlayers 4

//void assertNB(int val);

int testAdventurer() {
	int iterCount = 0;
	int player = 0;
	int handPos;
	int i; //NEWLY ADDED

	int coinErrorCount = 0;
	int handErrorCount = 0;
	int comparisonErrorCount = 0;
	int treasureEC = 0; //NEWLY ADDED

	struct gameState G;
	struct gameState oldG;

	int k[10] = {adventurer, council_room, feast, gardens, mine
				   , remodel, smithy, village, baron, great_hall};

	printf("-------RANDOM TESTING ADVENTURER CARD-------\n");

	while (iterCount != MAX_TEST_ITER) {
		//NEWLY MOVED
		int ogHandCount = 0;
		int newHandCount = 0;

		int oldGcoins = 0;
		int Gcoins = 0;

	    int ttltreasure = 0; //NEWLY ADDED
	    int ogtreasure = 0; //NEWLY ADDED

		int ogDiscCount = 0;
		int newDiscCount = 0;
		int ogDeckCount = 0;
		int newDeckCount = 0;



		player = rand()%4; //player can be 0 through 3, max_players is 4
		int seed = rand();

		// clear the game state
		memset(&G, 0, sizeof(struct gameState));
		memset(&oldG, 0, sizeof(struct gameState));

		// initialize a new game
		initializeGame(numPlayers, k, seed, &G);

		//set up randomly for current player
		G.deckCount[player] = rand() % MAX_DECK; //deckCount set up randomly
		G.handCount[player] = rand() % MAX_HAND; //set the handCount up randomly
		G.discardCount[player] = rand() % MAX_DECK; //discardCount set up randomly

		for(handPos = 0; handPos < G.handCount[player]; handPos++) {
			G.hand[player][handPos] = rand()%27; //set up hand randomly, 27 because there are 27 cards
			G.discard[player][handPos] = rand()%27; //set up the discard pile randomly, 27 because there are 27 cards
			G.deck[player][handPos] = rand()%27; //set up deck randomly, 27 because there are 27 cards
		}

		//NEWLY ADDED
		//loop to count initial treasure card values
		for (i = 0; i < G.handCount[player]; i++) {
			int cardDrawn = G.hand[player][i];
			if (cardDrawn == copper || cardDrawn == silver || cardDrawn == gold) {
				ogtreasure++;
			}
		}

		memcpy(&oldG, &G, sizeof(struct gameState)); //copy the gamestate for comparison

		//ADJUSTED FUNCTION
		Adventurer_Ref(player, &G); //call the adventurer function

		//NEWLY ADDED
		//loop to count final treasure card values
		for (i = 0; i < G.handCount[player]; i++) {
			int cardDrawn = G.hand[player][i];
			if (cardDrawn == copper || cardDrawn == silver || cardDrawn == gold) {
				ttltreasure++;
			}
		}

		//COIN COUNTING-------------------------------------------------------------------------------
		updateCoins(player, &oldG, 0);
		oldGcoins = oldG.coins; //store the old coin count;
		updateCoins(player, &G, 0);
		Gcoins = G.coins; //store the new coin count;
		//coin card gain should be +2 for adventurer
		//printf ("Iteration %d: Old Coin Ct = %d, New Coin Ct = %d\n", iterCount, oldGcoins, Gcoins);
		//fflush(stdout);
		//assertNB(Gcoins == oldGcoins + 2);

		//HAND COUNTING--------------------------------------------------------------------------------
		ogHandCount = oldG.handCount[player];
		newHandCount = G.handCount[player];
		//printf("Old Hand Ct = %d, New Hand Ct = %d\n", ogHandCount, newHandCount);
		//fflush(stdout);
		//assertNB(newHandCount == ogHandCount + 2);


		//COMPARISON FOR DEALT VS DISCARDED
		ogDiscCount = oldG.discardCount[player];
		newDiscCount = G.discardCount[player];
		ogDeckCount = oldG.deckCount[player];
		newDeckCount = G.deckCount[player];
		int discardDiff = newDiscCount - ogDiscCount;
		//int deltDiff = newDeckCount - ogDeckCount; //MATH HERE WAS FLAWED
		int deltDiff = ogDeckCount - newDeckCount;
		int comparisonVal = deltDiff - discardDiff;
		//printf("The difference between cards dealt and cards discarded should be 2, value is: %d\n", comparisonVal);
		//fflush(stdout);
		//assertNB(comparisonVal == 2);
		//printf("\n");

		//Record number of errors:
		if (Gcoins != oldGcoins + 2) {
			coinErrorCount++;
		}
		if (newHandCount != ogHandCount + 2) {
			handErrorCount++;
		}
		if (ttltreasure != ogtreasure + 2) { //NEWLY ADDED
			treasureEC++;
		}
		if (comparisonVal != 2) {
			comparisonErrorCount++;
		}
		//NEWLY ADDED (show me a sample of first 3 tests)
		if (iterCount < 3) {
			printf("Iteration: %d, Old Hand Ct = %d, New Hand Ct = %d\n", iterCount, ogHandCount, newHandCount);
			printf("Old treasure Ct = %d, New treasure Ct = %d\n", ogtreasure, ttltreasure);
			printf("The difference between cards dealt and cards discarded should be 2, value is: %d\n", comparisonVal);
			printf("ogDiscCount = %d, newDiscCount = %d, ogDeckCount = %d, newDeckCount = %d\n", ogDiscCount, newDiscCount, ogDeckCount, newDeckCount);
			printf("\n");
		}
		iterCount++;
	}

	//printf("Total coin count error cases in 15k iterations: %d\n", coinErrorCount);
	printf("Total hand count error cases in 15k iterations: %d\n", handErrorCount);
	printf("Total Treasure Card error cases in 15k iter's: %d\n", treasureEC); //NEWLY ADDED
	printf("Total comparison error cases in 15k iterations: %d\n", comparisonErrorCount);
	printf("\n");
	printf("Random tests for Adventurer Card complete!\n");

	return 0;

}


int main(int argc, char *argv[]) {
	srand(time(NULL));
	testAdventurer();
	return 0;
}

/*
//'assert' without breaking out
void assertNB(int val) {
	if (!val) {
		//https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
		printf("Assertion FAILED in file %s, line %d\n", __FILE__, __LINE__);
	}
	else {
		printf("Assertion SUCCESS \n");
	}
	return;
}
*/
