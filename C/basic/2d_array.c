#include<stdio.h>
/*
 size need declare starting of program --disadvantage
*/
// 2D ARRAY
int main(){
    int arr[10]; // 1D 10elements

    int arr[3][3]; // 9 elements 3*3 --> 2D
    for (int i = 0; i < 3; i++)  // for row
    {
        for(int j;j<3;j++) {  //in 0 row there is three column so this used 
            printf("%d",arr[i][j]);
        }
        printf("\n");
    }

}