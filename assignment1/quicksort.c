#include <stdio.h>

void qsort2(int* a, int n); // quick sort array a with n elements in place in C
void qsort1(int* num, int start, int end); // quick sort helper function
void printArray(int* num, int length); // print the entire array

// QuickSort in C
// by: Julian Carachure
int main(int argc, char *argv[]) {

	int num[10] = {9,8,7,10,6,5,4,3,2,1};
	int length = sizeof(num) / sizeof(num[0]);
	qsort2(num, length);

	int num1[10] = {10,9,8,7,6,1,2,3,4,5};
	int length1 = sizeof(num1) / sizeof(num1[0]);
	qsort2(num1, length1);

	int num2[10] = {6,7,8,9,10,1,2,3,5,6};
	int length2 = sizeof(num2) / sizeof(num2[0]);
	qsort2(num2, length2);

	int num3[10] = {1,2,3,4,5,6,7,8,9,10};
	int length3 = sizeof(num3) / sizeof(num3[0]);
	qsort2(num3, length3);

	int num4[10] = {1,2,3,4,5,10,9,8,7,6};
	int length4 = sizeof(num4) / sizeof(num4[0]);
	qsort2(num4, length4);

	int num5[10] = {6,7,8,9,10,1,2,3,4,5};
	int length5 = sizeof(num5) / sizeof(num5[0]);
	qsort2(num5, length5);
}

void qsort2(int* a, int n) {
	qsort1(a, 0, n - 1);
	printArray(a, n);
}

void qsort1(int * a, int left, int right){
	if (left >= right)
		return;
	int temp = a[left];
	int i = left, j = right;
	while (i < j){
		while (a[j] >= temp && j > i) {
			j--;
		}
		a[i] = a[j];
		a[j] = temp;
		while (a[i] <= temp && i < j) {
			i++;
		}
		a[j] = a[i];
		a[i] = temp;
	}
	qsort1(a, left, i-1);
	qsort1(a, j+1, right);
}

void printArray(int* num, int length) {
	for (int i = 0; i < length; i++) {
		printf("%d ", num[i]);
	}
	printf("\n");
}