#include <iostream>

#define MAX_SIZE 100

using namespace std;

int checkSumPossibility(int num, int arr[], int size) {
  if (num == 0)
    return 1;
  if (num < 0)
    return 0;
  if (size <= 0)
    return 0;
	if (num == *arr) {
    cout << *arr << ' ';
		return 1;
	}
	if (checkSumPossibility(num, arr + 1, size - 1) == 1) 
		return 1;
  if (checkSumPossibility(num - *arr, arr + 1, size - 1) == 1) {
    cout << *arr << ' ';
    return 1;
	}
  return 0;
}

int main() {
  int arraySize;
  int arr[MAX_SIZE];
  int num;
  int returnVal;

  cin >> arraySize;
  cin >> num;

  for (int i = 0; i < arraySize; ++i) {
    cin >> arr[i];
  }

  returnVal = checkSumPossibility(num, arr, arraySize);

  if (returnVal == 1) {
    cout << "Possible!" << endl;
  } else {
    cout << "Not Possible!" << endl;
  }

  return 0;
}

// 8 129
// 41 67 34 0 69 24 78 58
// Not possible!
// 8 129
// 62 64 5 45 81 27 61 91
// Not possible!
// 8 129
// 95 42 27 36 91 4 2 53
// Possible! (36 91 2)
// 8 129
// 92 82 21 16 18 95 47 26
// Possible! (92 21 16)
// 8 129
// 71 38 69 12 67 99 35 94
// Possible! (35 94)
// 8 129
// 3 11 22 33 73 64 41 11
