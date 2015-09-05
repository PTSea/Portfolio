/* PROGRAM: PEMult3&5.cpp
 * AUTHOR: PHILIP TAN
 * DATE: Apr 15, 2015
 * DESCRIPTION: If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
 * NOTES: This is a problem from projecteuler.net
 *
 */

#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>

using namespace std;

int main() {
	int i;
	int valSum=0;
	for (i=0; i<1000; i++) {
		if ((i%15) == 0) {
			valSum += i;
		}
		else if ((i%3) == 0) {
			valSum += i;
		}
		else if ((i%5) == 0) {
			valSum += i;
		}
	}
	cout << valSum << endl;
}





