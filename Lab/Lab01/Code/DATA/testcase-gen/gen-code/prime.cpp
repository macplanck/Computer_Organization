#include <iostream>
#include <time.h>

using namespace std;

int main() {

    srand(time(NULL));

    int in  = rand() % 100;

    printf("%d", in);

    return 0;

}