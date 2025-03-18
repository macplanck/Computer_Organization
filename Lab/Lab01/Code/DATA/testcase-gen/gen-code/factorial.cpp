#include <iostream>
#include <time.h>

using namespace std;

int main() {

    srand(time(NULL));

    int n  = rand() % 10;

    printf("%d", n);

    return 0;

}