#include<stdio.h>

float oblicz_kat(float v, float hmax);

int main() {

	float v = 10;
	float hmax = 3.823;
	float kat;
	kat = oblicz_kat(v, hmax);
	printf("%f", kat);

	return 0;
}