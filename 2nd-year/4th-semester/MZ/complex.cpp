#include <iostream>

using std::cin;
using std::cout;
using std::endl;

struct complex{
	double re, im;
	complex(double re = 0, double im = 0): re(re), im(im){ // !!!!
	}
	void print_complex(){
		if(im == 0)
			cout << re << endl;
		else if(re == 0)
			cout << "i" << im << endl;
		else if(im > 0)
			cout << re << " + " << "i" << im << endl;
		else
			cout << re << " - " << "i" << abs(im) << endl;
	}

	complex &operator +=(const complex &z){
		re += z.re;
		im += z.im;
		return *this;
	}
	complex &operator -=(const complex &z){
		re -= z.re;
		im -= z.im;
		return *this;
	}
	complex &operator *=(const complex &z){
		double tmp_re = re * z.re - im * z.im;
		double tmp_im = re * z.im + im * z.re;
		re = tmp_re;
		im = tmp_im;
		return *this;
	}
	complex &operator /=(const complex &z){
		double tmp_re = (re*z.re + im*z.im) / (z.re*z.re + z.im*z.im);
		double tmp_im = (z.re*im - re*z.im) / (z.re*z.re + z.im*z.im);
		re = tmp_re;
		im = tmp_im;
		return *this;
	}
	complex &operator ++(){
		++re;
		return *this;	
	}
	complex &operator --(){
		--re;
		return *this;	
	}
	complex operator ++(int i){ 
		complex tmp = *this; // complex tmp(*this)
		++re; // неважно ++re или re++
		return tmp;
	}
	complex operator --(int i){ 
		complex tmp = *this; // complex tmp(*this)
		--re;
		return tmp;
	}
	int operator ==(const complex &z) const{
		return (re == z.re && im == z.im);
	}
	int operator !=(const complex &z) const{
		return !(re == z.re && im == z.im);
	}
	complex operator -()const{     // complex tmp(-re, -im); возможно, на коллке будет допустим только такой вариант
		return complex(-re, -im);  // return tmp;            в подобных операторах анологично
	}	
};

complex operator +(const complex &z1, const complex &z2){ // вынести за структуру(реализовать там(или сделать другом)) и добавить второй параметр(точно такой же), 
	complex tmp(z1);										// чтобы срабатывало 4 + z и тд 
	tmp += z2;
	return tmp;
}
complex operator -(const complex &z1, const complex &z2){ // в этих функция не нужен const, так как это не методы класса, а свободные ф-ции
	complex tmp(z1);										// подобные методы внутри класса помеечаются const, чтобы они не изменяли this-объект
	tmp -= z2;											
	return tmp;
}
complex operator *(const complex &z1, const complex &z2){
	complex tmp(z1);
	tmp *= z2;
	return tmp;
}
complex operator /(const complex &z1, const complex &z2){
	complex tmp(z1);
	tmp /= z2;
	return tmp;
}

int main(){
	complex Z(3, -4);
	Z = Z + 1;
	Z = 1 + Z;
	Z.print_complex();

	return 0;
}
