#include <iostream>
#include <time.h>

using namespace std;

int main() {

    srand(time(NULL));

    int n  = rand() % 500;
    int op = rand() % 2 + 1;

    printf("%d\n%d", op, n);

    return 0;

}