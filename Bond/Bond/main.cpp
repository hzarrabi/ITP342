#include <iostream>
#include "bond.h"

using namespace std;

int main() {
	
	int bondMaturity;
	double couponAmount;
	double faceValue;
	double yield;
	double bondPrice;	
	cout <<"Part a and b" << endl;
	cout <<"Please enter data for the following items by order: "<< endl;
	
	cout <<"BondMaturity (integer)" << endl;
	cout <<"couponAmount" << endl;
	cout<<"faceValue "<< endl;
	cout <<"yield" << endl;
	
	
	cin >> bondMaturity >> couponAmount >> faceValue>> yield;
	
	double BondPrice = bond_price(bondMaturity,  couponAmount, faceValue,  yield);
	double ModifiedDuration = 	modified_duration(bondMaturity, couponAmount, faceValue,  yield);
	
	cout << "part a: the bond price is: " << BondPrice << endl;
	cout << "part b: the modified duration is: " << ModifiedDuration << endl;
	cout << endl;
	cout << endl;
	
	
	cout <<"part c" << endl;
	cout <<"Please enter data for the following items by order: "<< endl;
		
	cout <<"BondMaturity (integer)" << endl;
	cout <<"couponAmount" << endl;
	cout<<"faceValue "<< endl;
	cout <<"bond price" << endl;
	cin >> bondMaturity >> couponAmount >> faceValue>> bondPrice;
		
	double YTM = estimate_yield(bondMaturity, couponAmount, faceValue, bondPrice);
	cout <<"part c: the estimation of yield: " << YTM << endl;
		
		
	return 0;
}