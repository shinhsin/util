#include <stdio.h>

int main()
{
int n = 1;
short i=0;
// little endian if true
    if(*(char *)&n == 1)
    {
        printf("\nLittle endian.\n");
    }
    else
    {
        printf("\nLittle endian.\n");
    }

    printf("[%d] 在記憶體中的儲存順序：\n", n);

    for (i = 0; i < sizeof(int); i++)
    {
        printf("%p : 0x%02X\n", (char *)&n+i, *((char *)&n+i) );
    }
    return 0;
}
