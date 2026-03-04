#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void thank_you() {
    execl("/bin/sh", "sh", NULL);
}

void print(char * message) {
    char buffer[64];
    strcpy(buffer, message);
    printf("%s\n", buffer);
}

int main(int argc, char ** argv) {
    // Set UID to 0 (root) - more on that later
    setresuid(0, 0, 0);
    if (argc != 2) {
        printf("Usage: %s <name>\n", argv[0]);
        return 1;
    }
    print(argv[1]);
    return 0;
}