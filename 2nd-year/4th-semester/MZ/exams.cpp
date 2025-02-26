#include <iostream>

using std::endl;
using std::cin;
using std::cout;

class date{
    int day, month, year;
public:
    date(int day, int month, int year): day(day), month(month), year(year) {}
    void get_date() const {
        cout << day << '.' << month << '.' << year << endl;
    }
};

class event{
protected: //!!!!!!!
    date date_of; 
    char surname[20]; 
public:
    event(date date_of, const char *surname): date_of(date_of){
        strcpy(this->surname, surname);
    }
    virtual ~event() {}
    virtual void res() const = 0; //чисто виртуальная функция
};

class test: public event{
    char subject[20];
public:
    test(date date_of, const char *surname, const char *subject): event(date_of, surname){
        strcpy(this->subject, subject);
    }
    void res() const {
        cout << "зачет: ";
        date_of.get_date();
        cout << '/' << surname << '/' << subject << endl; 
    }
};

class exam: public event{
    char subject[20];
    int grade;
public:
    exam(date date_of, const char *surname, const char *subject, int grade): event(date_of, surname), grade(grade) {
        strcpy(this->subject, subject);
    }
    void res() const {
        cout << "экзамен: ";
        date_of.get_date();
        cout << '/' << surname << '/' << subject << '/' << grade << endl; 
    }
};

int main(){
    event *session[10];

    session[0] = new test(date(2, 3, 2025), "Petrov", "OOP");
    session[1] = new exam(date(5, 1, 2025), "Popov", "OOP", 2);

    session[0]->res();
    session[1]->res();

    delete session[0];
    delete session[1];

    return 0;
}