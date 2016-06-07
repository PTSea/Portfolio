/*
 * Philip Tan
 * CS 362 Summer 2015
 * Created on: Jul 25, 2015
 * Documentation For Random Testing
 */

/*
randomtestadventurer.c

For this random test, I used a main function to call the test function. In the test function, I used a while loop
to cycle through 15000 iterations.  Each time, a random player was picked, and then for that random player,
a random deckCount, handCount, and discardCount was set. After that, I used a loop to set up the hand, the discard pile,
and the deck with random cards. The current gamestate is then copied into a temporary gamestate for later comparison.
The Adventurer_Ref function that we separated out for the first assignment is then called for the current player and
gamestate. After that, the coin count, hand count, and another comparison is checked. For coin count, we know adventurer
should add 2 extra coins, so we do some math. For the hand, we know we should have 2 more cards, so we do some math. We
then also compare the number of dealt cards and the number of discarded cards. The difference between the number of
cards dealt, and the number of cards discarded should be 2, and we do some math to check that as well. At the bottom,
we have some if statements with counters to count how many errors we get. These are output outside of the while loop,
after the 15k iterations are completed.

For the adventurer card random tests, these were the gcov results:
Lines executed: 22.07% of 580, Branches executed: 19.76% of 415, Taken at least once: 17.83% of 415, Calls executed: 10.53% of 95

These results seem low considering I am random testing. I was not sure if I was supposed to leave the
makefile code in there for the unit and card tests. I only ran the random tests. Not sure if that would have any effect
on coverage percentage. On second thought, this time I am testing only 1 function out of all the functions in the code, and I am
achieving a decent percentage for all the gcov results relative to the unit and card tests we did for assignment 3.

-------------------------------------------------------------------------------------------------------------------------------------------

randomtestcard.c

For this random test, the code is pretty much the same as that of the randomtestadventurer.c code. All the same random
number generations are done. This time though, we use Smithy_Ref for the smithy funciton. We compare the hand count,
and the discard count. Smithy should add 3 cards to the hand. It should also discard 1 smithy card at the end. We use
the same if statements to count errors and then output them once the while loop is complete.

For the smithy card random tests, these were the gcov results:
Lines executed: 24.83% of 580, Branches executed: 21.69% of 415, Taken at least once: 19.04% of 415, Calls executed: 12.63% of 95

These results are also seem low, but they are bit better than that of the adventurer random tests. Again, relative to the unit
and card tests, these percentages are actually quite high considering I am only testing 1 function.
*/
