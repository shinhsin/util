#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

//child function
void* child(void* data)
{
    //obtain input data
    char *str = (char*) data;
    for(int i = 0;i < 10;++i)
    {
        //output string every second
        printf("%s\n", str);
        sleep(1);
    }
    //exit child thread
    pthread_exit(NULL);
}

//main function
int main() {
    //pthread
    pthread_t child_thread;
    //create child thread
    pthread_create(&child_thread, NULL, child, "Child");

    //main thread
    for(int i = 0;i < 3;++i)
    {
        //output string every second
        printf("Master iteration[%d]\n", i);
        sleep(1);
    }

    //wait for child thread to finish its job
    pthread_join(child_thread, NULL);
    return 0;
}
