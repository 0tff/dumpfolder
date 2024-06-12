#include <iostream>

class MyClass {
public:
    void doSomething() {
        std::cout << "Doing something!" << std::endl;
    }
};

MyClass* some_pointer = nullptr; 
MyClass* another_pointer = new MyClass();

void setup() {
    std::cout << "Entering setup()" << std::endl;

    if (some_pointer == nullptr) {
        std::cout << "some_pointer is null" << std::endl;
        return; 
    }
    some_pointer->doSomething() 

    if (another_pointer == nullptr) {
        std::cout << "another_pointer is null" << std::endl;
        return; 
    }
    another_pointer->doSomething();

    std::cout << "Exiting setup()" << std::endl;
}

int main() {
    setup();
    return 0;
}
