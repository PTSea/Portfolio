/*
 * Philip Tan
 * CS 362 Summer 2015
 * Created on: Jul 24, 2015
 * RANDOM tests for Smithy card
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

int testSmithy() {
	int iterCount = 0;
	int player = 0;
	int handPos;

	int handErrorCount = 0;
	int discardErrorCount = 0;
	int playedErrorCount = 0; //NEWLY ADDED

	struct gameState G;
	struct gameState oldG;

	int k[10] = {adventurer, council_room, feast, gardens, mine
				   , remodel, smithy, village, baron, great_hall};

	printf("-------RANDOM TESTING SMITHY CARD-------\n");

	while (iterCount != MAX_TEST_ITER) {
		//NEWLY MOVED
		int ogHandCount = 0;
		int newHandCount = 0;

		int ogDiscCount = 0;
		int newDiscCount = 0;

		int ogPlayedCount = 0; //NEWLY ADDED
		int newPlayedCount = 0; //NEWLY ADDED

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
			G.hand[player][handPos] = rand()%27; //set up the player hand randomly
			G.discard[player][handPos] = rand()%27; //set up the discard pile randomly, 27 because there are 27 cards
			G.deck[player][handPos] = rand()%27; //set up deck randomly, 27 because there are 27 cards
		}

		memcpy(&oldG, &G, sizeof(struct gameState)); //copy the gamestate for comparison
		//printf("Memcpy validation: oldG deck count = %d, G deck count = %d", G.deckCount[player], oldG.deckCount[player]);

		//NEWLY ADJUSTED
		Smithy_Ref(0, player, &G); //call the smithy function


		//HAND COUNTING--------------------------------------------------------------------------------
		ogHandCount = oldG.handCount[player];
		newHandCount = G.handCount[player];
		//printf("Iteration %d: Old Hand Ct = %d, New Hand Ct = %d", iterCount, ogHandCount, newHandCount);
		//fflush(stdout);
		//assertNB(newHandCount == ogHandCount + 3);

		//DISCARD COUNTING-----------------------------------------------------------------------------
		ogDiscCount = oldG.discardCount[player];
		newDiscCount = G.discardCount[player];
		//printf("Old Discard Ct = %d, New Discard Ct = %d", ogDiscCount, newDiscCount);
		//fflush(stdout);
		//assertNB(newDiscCount == ogDiscCount + 1);
		//printf("\n");

		ogPlayedCount = oldG.playedCardCount; //NEWLY ADDED
		newPlayedCount = G.playedCardCount;

		//Smithy adds three cards to the hand
		if (newHandCount != ogHandCount + 2) { //MATH HERE WAS FLAWED
			handErrorCount++;
		}

		if (newDiscCount != ogDiscCount + 1) {
			discardErrorCount++;
		}

		if (newPlayedCount != ogPlayedCount + 1) { //NEWLY ADDED
			playedErrorCount++;
		}
		//NEWLY ADDED (show me a sample of first 3 tests)
		if (iterCount < 3) {
			printf("Iteration: %d, Old Hand Ct = %d, New Hand Ct = %d\n", iterCount, ogHandCount, newHandCount);
			printf("ogDiscCount = %d, newDiscCount = %d\n", ogDiscCount, newDiscCount);
			printf("ogPlayedCount = %d, newPlayedCount = %d\n", ogPlayedCount, newPlayedCount);
			printf("\n");
		}
		iterCount++;
	}

	printf("Total hand count error cases in 15k iterations: %d\n", handErrorCount);
	printf("Total discard count error cases in 15k iterations: %d\n", discardErrorCount);
	printf("Total played card count error cases in 15k iter's: %d\n", playedErrorCount); //NEWLY ADDED
	printf("\n");
	printf("Random tests for Smithy Card complete!\n");

	return 0;

}


int main(int argc, char *argv[]) {
	srand(time(NULL));
	testSmithy();
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
