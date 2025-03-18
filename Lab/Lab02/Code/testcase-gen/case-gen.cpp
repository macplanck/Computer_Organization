#include <iostream>
#include <time.h>

// #define S_WORD

#define A_LEN 68
#define S_LEN 38

#define PATTERN 500

using namespace std;

FILE *A_FILE = fopen("test_ALU.txt", "w");
FILE *S_FILE = fopen("test_Shifter.txt", "w");

void randOP() {

    int option = rand() % 7;
    if     (option == 0) fprintf(A_FILE, "0011");
    else if(option == 1) fprintf(A_FILE, "0111");
    else if(option == 2) fprintf(A_FILE, "0000"); 
    else if(option == 3) fprintf(A_FILE, "0010");
    else if(option == 4) fprintf(A_FILE, "1110");
    else if(option == 5) fprintf(A_FILE, "1100");
    else if(option == 6) fprintf(A_FILE, "0101");

}


int main() {

    srand(time(NULL));

    for(int patcount=0; patcount < PATTERN; patcount++) {
        randOP();
        for(int i=0; i<A_LEN-4; i++) fprintf(A_FILE, "%d", rand() % 2); fprintf(A_FILE, "\n");
        for(int i=0; i<S_LEN-0; i++) fprintf(S_FILE, "%d", rand() % 2); fprintf(S_FILE, "\n");
    }

    return 0;

}

