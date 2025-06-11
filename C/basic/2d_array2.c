#include<stdio.h>
int main(){
    int m,n , i ,j, max;
    printf("enter the number of row elemtes: \n");
    scanf("%d",&m);
    printf("enter the number of column elemtes: \n");
    scanf("%d",&n);
    int arr[m][n];

    printf("enter a %d row and %d coulmn elements: \n",m,n);

    for(int i=0;i<m;i++){
        for (int j = 0; j < n; j++)
   {
            scanf("%d", &arr[i][j]); 
        }
         
    }

    printf("the elements are :");
    for(int i=0;i<m;i++){
        for (int j = 0; j < n; j++)
   {
    printf("%d\t",arr[i][j]);
   }
   printf("\n");
 }
    return 0;
}