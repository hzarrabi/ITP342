#include <iostream>
#include <vector>
#include <math.h>

using namespace std;

double bond_price(int bondMaturity, double couponAmount, double faceValue, double yield);

double modified_duration(int bondMaturity, double couponAmount, double faceValue, double yield);

double estimate_yield(int bondMaturity, double couponAmount, double faceValue, double bondPrice);