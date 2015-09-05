/* PROGRAM: StringReverse.cpp
 * AUTHOR: PHILIP TAN
 * DATE: Apr 15, 2015
 * DESCRIPTION: Take a string and reverse it.
 * NOTES: This is a classic interview problem
 *
 */

#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>

using namespace std;

int main() {

	string aWord;

	cout << "Please enter a string to be reversed:";
	getline(cin, aWord);

	int i;
	string newWord;

	for (i=aWord.length(); i>=0; i--) {
		newWord += aWord[i];
	}
	cout << newWord;
}

