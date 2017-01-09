#include <iostream>

#include <math.h>
//#include "bond.h"


using namespace std;

double bond_price(int bondMaturity, double couponAmount, double faceValue, double yield){
	double p; // bond price
	double coeff;   //pow((1+yield),i+1);
	for(int i = 1; i <=bondMaturity; i++){
		coeff = pow((1+yield),i+1);
		p += couponAmount/coeff;
	}   // before last year
	
	
	// the bond price at last year
	coeff = pow((1+yield),bondMaturity);
	p += faceValue/coeff;
	
	return (double)p;
}

double modified_duration(int bondMaturity, double couponAmount, double faceValue, double yield){
	//first get the bond price
	double bondPrice = bond_price(bondMaturity, couponAmount, faceValue,yield);
	
	double Macauley;
    double coeff;
	//Macauley duration = Sum of (PV)(CF) * T / market
	for(int i = 1; i <=bondMaturity; i++){
		
			coeff = pow((1+yield),i+1);
		
			// formula of Macauley duration is 
			Macauley += (i*(couponAmount/coeff))/bondPrice;
	}   // before last year
	
	// last year 
	coeff = pow((1+yield),bondMaturity);
	Macauley += (bondMaturity*(faceValue/coeff))/ bondPrice;
	
	// calculate Modified duration with Macauley duration
	double MD; // MD = Modified Duration
	
	//  Macauley duration and divide it by 1 + (yield-to-maturity / 
	//  number of coupon periods per year)

	MD = Macauley / ((1+yield)/1);
	
	return (double)MD;
}

// approxYTM = (C+ (F-P)/n) / ((F+P)/2);
double estimate_yield( int bondMaturity, double couponAmount, double faceValue, double bondPrice){
	double e = ((couponAmount+ (faceValue-bondPrice)/bondMaturity)/((faceValue+bondPrice)/2));
	return (double)e;
}