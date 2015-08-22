/* PROGRAM: FizzBuzz.cpp
 * AUTHOR: PHILIP TAN
 * DATE: Apr 15, 2015
 * DESCRIPTION: Print values from 1 to 100, but for multiples of 3 print fizz, multiples of 5 print buzz,
 * multiples of 3 and 5 print fizzbuzz
 * NOTES: This is a classic interview problem
 *
 */

#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>

using namespace std;

int main() {
	int i;
	for (i=1; i<=100; i++) {
		if ((i%15) == 0) {
			cout << "fizzbuzz" << endl;
		}
		else if ((i%3) == 0) {
			cout << "fizz" << endl;
		}
		else if ((i%5) == 0) {
			cout << "buzz" << endl;
		}
		else {
			cout << i << endl;
		}
	}
}



