#include <stdio.h>
#include <stdlib.h>

void msort(int *a, int n); // merge sort array a with n elements in place in C
int* partition(int *a, int left, int right);
void merge(int* a, int* left, int* right, int leftN, int rightN);
void printArray(int* num, int length);

// MergeSort in C
// Time Complexity : O(nlog(n))
// by: Julian Carachure
int main(int argc, char *argv[]) {

	int num1[10] = {10,9,8,7,6,1,2,3,4,5};
	int length1 = sizeof(num1) / sizeof(num1[0]);
	msort(num1, length1);
	printArray(num1, length1);

	int num2[10] = {6,7,8,9,10,1,2,3,5,6};
	int length2 = sizeof(num2) / sizeof(num2[0]);
	msort(num2, length2);
	printArray(num2, length2);

	int num3[10] = {1,2,3,4,5,6,7,8,9,10};
	int length3 = sizeof(num3) / sizeof(num3[0]);
	msort(num3, length3);
	printArray(num3, length3);

	int num4[10] = {1,2,3,4,5,10,9,8,7,6};
	int length4 = sizeof(num4) / sizeof(num4[0]);
	msort(num4, length4);
	printArray(num4, length4);

	int num5[10] = {6,7,8,9,10,1,2,3,4,5};
	int length5 = sizeof(num5) / sizeof(num5[0]);
	msort(num5, length5);
	printArray(num5, length5);
}

void msort(int *a, int n) {
	if (n <= 1) {
		return;
	}
	int* left = partition(a, 0, n/2 + 1);
	// printf("left: ");
	// printArray(left, n/2);
	
	int* right = partition(a, n/2, n);
	// printf("right: ");
	// printArray(right, n - (n/2));
	
	msort(left, n/2);
	msort(right, n - (n/2));
	merge(a, left, right, n/2, n - (n/2));
}

int* partition(int* a, int left, int right) {
	int* result = (int*) malloc((right - left) * sizeof(int));
	for (int i = left; i < right; i++) {
		result[i - left] = a[i];
	}
	return result;
}

void merge(int* a, int* left, int* right, int leftN, int rightN) {
	int i = 0;
	int j = 0;
	while (i < leftN && j < rightN) {
		if (left[i] < right[j]) {
			int next = i + j;
			a[next] = left[i++];
		} else {
			int next = i + j;
			a[next] = right[j++];
		}
	}
	
	while (i < leftN) {
		int next = i + j;
		a[next] = left[i++];
	}
		
	while (j < rightN) {
		int next = i + j;
		a[next] =right[j++];
	}
	
	// printf("### merge up: ");
	// printArray(a, leftN + rightN);
	free(left);
	free(right);
}

void printArray(int* num, int length) {
	for (int i = 0; i < length; i++) {
		printf("%d ", num[i]);
	}
	printf("\n");
}