#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>

#define N 10

void stencil_c(int n, double* X, double* Y) {
	for (int i = 3; i < n - 3; i++) {
		Y[i] = X[i - 3] + X[i - 2] + X[i - 1] + X[i] + X[i + 1] + X[i + 2] + X[i + 3];
	}
}

extern void stencil_asm(int n, double* X, double* Y);

double executedtime(clock_t start, clock_t end) {
	return ((double)(end - start)) / CLOCKS_PER_SEC;
}

int main() {
	int i;
	clock_t cstart, cend;
	double ctime;

	int size[] = { 1 << 20, 1 << 24, 1 << 28 };
	int compute = sizeof(size) / sizeof(size[0]);
	int sizes[] = { 20, 24, 28 };

	srand(time(NULL));
	double* X = (double*)malloc(size[compute - 1] * sizeof(double));
	for (i = 0; i < size[compute - 1]; i++) {
		X[i] = (double)(rand() % 100);
	}

	printf("\nRandom values: ");
	for (i = 0; i < N; i++) {
		printf("%.2lf, ", X[i]);
	}
	printf("\n\n");

	for (int j = 0; j < compute; j++) {
		int n = size[j];
		double* Y = (double*)malloc(n * sizeof(double));

		printf("Vector of size n = 2^%d", sizes[j]);
		for (i = 0; i < n; i++) {
			Y[i] = 0.0;
		}

		cstart = clock();
		stencil_c(n, X, Y);
		cend = clock();
		ctime = executedtime(cstart, cend);

		printf("\n(C) Y Output: ");
		for (i = 3; i < N + 3 && i < n; i++) {
			printf("%.2lf, ", Y[i]);
		}
		for (i = 0; i < n; i++) {
			Y[i] = 0.0;
		}
		printf("\n(C) Execution time for vector of size %d in seconds: %lf\n", n, ctime);

		cstart = clock();
		stencil_asm(n, X, Y);
		cend = clock();
		ctime = executedtime(cstart, cend);

		printf("(X86-64) Execution time for vector of size %d in seconds: %lf\n\n", n, ctime);
		free(Y);
	}
	free(X);
	return 0;
}