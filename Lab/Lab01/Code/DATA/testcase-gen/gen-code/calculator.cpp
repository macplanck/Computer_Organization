#include <iostream>
#include <time.h>

using namespace std;

int main() {

    srand(time(NULL));

    int op = rand() % 3 + 1;
    int a  = rand() % 100;
    int b  = rand() % 100;

    printf("%d\n%d\n%d", op, a, b);
    // printf("%d", op, a, b);

    return 0;

}