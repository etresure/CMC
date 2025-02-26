#include <iostream>

using std::cout;
using std::cin;
using std::endl;

int nod(int num, int den){
	while(den != 0){
		int n = den;
		den = num % den;
		num = n;
	}
	
	return num;
}

class rational{
private:
	int num, den;
	void correct_num(){
		int n = nod(num, den);
		num /= n;
		den /= n;
		
		if(den < 0){
			den = -den;
			num = -num;
		}
	}
public:
	rational(int num = 0, int den = 1){
		if(den == 0)
			cout << "invalid input!" << endl;
		this->num = num;
		this->den = den;	
		correct_num();
	}
	void print_rational(){
		if (den == 1)
			cout << num << endl;
		else
			cout << num << "/" << den << endl;
	}
	void get_num(){
		cout << num << endl;
	}
	void get_den(){
		cout << den << endl;
	}	
	rational &operator =(const rational &ob){
		num = ob.num;
		den = ob.den;
		return *this;
	}
	rational operator +(int n) const {
		n *= den;
		return rational(num + n, den);
	}
	rational operator *(int n) const {
		return rational(num * n, den);
	}
	rational operator +(const rational &ob) const {
		int new_num = num * ob.den + den * ob.num;
		int new_den = den * ob.den;
		return rational(new_num, new_den);
	}
	rational operator *(const rational &ob) const {
		return rational(num * ob.num, den * ob.den);
	}	
};

int main(){
	rational r1(8, 6);
	rational r2(3, -2);
	rational r3(5);
	rational r4;
	
	cout << "r1 = ";
	r1.print_rational();
	cout << "r2 = ";
	r2.print_rational();
	cout << "r3 = ";
	r3.print_rational();
	
	cout << "checking..." << endl;
	
	cout << "r4 = ";
	r4 = r3 * 2;
	r4.print_rational();
	r1.print_rational();
	cout << "r2 = ";
	r2.print_rational();
	cout << "r3 = ";
	r3.print_rational();
	
	return 0;
}
