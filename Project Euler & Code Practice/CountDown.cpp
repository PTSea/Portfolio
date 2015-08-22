/* PROGRAM: CountDown.cpp
 * AUTHOR: PHILIP TAN
 * DATE: Apr 15, 2015
 * DESCRIPTION: Count down from 100 to 1 starting with i at 1.
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
	for (i=1; i<101; i++) {
		cout << 101-i << endl;
	}
}

