
package arrayAssignment;

public class Traverse {

		public static void main(String[] args) {
			int[][] matrix = { { 1, 2, 3, 4 }, { 5, 6, 7, 8 }, { 9, 10, 11, 12 }, { 13, 14, 15, 16 } };
			int rows=matrix.length;
			int cols=matrix[0].length;
			int top=0,bottom=rows-1;
			int left=0,right=cols-1;
			while (top <= bottom && left <= right) {
		            // 1. Traverse from Left to Right
		            for (int i = left; i <= right; i++) {
		                System.out.print(matrix[top][i] + " ");
		            }
		            top++;

		            // 2. Traverse from Top to Bottom
		            for (int i = top; i <= bottom; i++) {
		                System.out.print(matrix[i][right] + " ");
		            }
		            right--;

		            // 3. Traverse from Right to Left
		            if (top <= bottom) {
		                for (int i = right; i >= left; i--) {
		                    System.out.print(matrix[bottom][i] + " ");
		                }
		                bottom--;
		            }

		            // 4. Traverse from Bottom to Top
		            if (left <= right) {
		                for (int i = bottom; i >= top; i--) {
		                    System.out.print(matrix[i][left] + " ");
		                }
		                left++;
		            }
		        }

		}
	
}
