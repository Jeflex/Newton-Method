package playspace;

//import java.util.Scanner;
//import javax.swing.JOptionPane;
import Jama.Matrix;

public class Extended_Woods {
	
	static int n = 100;
	
	public static void main(String[] args){
        // Space stepsize
		double tol=1E-12;                   // Method's Tolerance

		double[][] x = new double[n][1];  // Array to define the iteration of the Newton's Method

		double[][] FF= new double[n][1];  // Array to define the RHS of the Linear system of Newton's Method
		double[][] JJ= new double[n][n];// Array to define the Jacobian

		Matrix A = new Matrix(JJ);           // Allocating the Jacobian Matrix
		Matrix b = new Matrix(FF);           // Allocating the RHS
		int max_iter = 2000;                  // Defining the maximum number of iterations
		int i;                              // index for the for-loop process

		/* Filling the initial vector up */

		for(i=0; i < n; i++)
		{
			x[i][0]=0.0;
		}

		// FOM process using the Newton Method 

		long startTime = System.currentTimeMillis();

		x= Fom_Newton(x, max_iter, tol, b, A);

		long endTime   = System.currentTimeMillis();

		long totalTime = endTime - startTime;

		System.out.println("");
		System.out.println("FOM Runtime: " +totalTime);

		// End of FOM
	}

	public static double[][] Fom_Newton(double[][] x, int max_iter, double tol, Matrix b, Matrix A){

		Matrix x_m=new Matrix(x);           // Allocating the Iteration of Newton's Method
		Matrix Delta_x = new Matrix(n,1); // Allocating the Newton's Step
		int i;

		// The Newton's Method Process 

		for(i=0; i<max_iter; i++)
		{
			b=F(x);             // b=F(x)
			A=J(x);             // A=J(x)
			double bnorm = b.normInf();

			if(bnorm > tol)
			{
				b=b.uminus();                       // b=-b
				Delta_x=A.solve(b);                 // Solving the system A*Delta_x=-b i.e J* Delta_x=-F
				x_m=x_m.plusEquals(Delta_x);        // x= x + Delta x

				x=x_m.getArrayCopy();               // converting the matrix in an array to repeat the loop
			} else
			{
				System.out.println ("");
				System.out.println ("The Method converged in " +i+ " Iterations");          
				break;
			}
		}
		return x;
	}

	// Defining the function F:R^n --> R^n

	public static Matrix F(double [][] x)
	{
		double[][] FF = new double[n][1];
		
		if(n % 4 == 0){
			int i;
			for(i = 0; i < n; i++){
				if(i%4 == 0)
					FF[i][0] = -200*x[i][0]*(x[i+1][0] - (x[i][0]*x[i][0])) - (1-x[i][0]);
				else if(i%4 == 1)
					FF[i][0]= 200*(x[i][0] - (x[i-1][0]*x[i-1][0])) + 20*(x[i][0]-1) + 19.8*(x[i+2][0]-1);
				else if(i%4 == 2)
					FF[i][0] = -180*x[i][0]*(x[i+1][0] - x[i][0]*x[i][0]) - (1-x[i][0]);
				else if(i%4 == 3)
					FF[i][0]= 180*x[i][0]*(x[i][0] - (x[i-1][0]*x[i-1][0])) + 20.2*(x[i][0]-1) + 19.8*(x[i-2][0]-1);
			}
		}
		else
			System.out.println("Length of x must be multiple of 4");
		
		Matrix b= new Matrix(FF);
		return b;
	}

	/* Defining the Jacobian of the function 
    w[0] is not the initial values of w because it is not needed
    in the Jacobian. The same thing to v[0]                       */

	public static Matrix J(double [][] x) 
	{
		double[][] JJ = new double[n][n];
		int i;
		int j;

		// Filling the Jacobian with zeros 

		for(i=0; i < n; i++)
		{
			for(j=0; j < n; j++)
			{
				JJ[i][j]=0.0;     
			}
		}

		// Defining the values of the Jacobian 
		
		if(n % 4 == 0){
			for(i = 0; i < n; i++){
				if(i%4 == 0){
					JJ[i][i] = 600*(x[i][0]*x[i][0]) - 200*x[i+1][0]-1;
			        JJ[i][i+1] = -200*x[i][0];
				}
				else if(i%4 == 1){
					JJ[i][i-1] = -400*x[i-1][0];
				    JJ[i][i] = 220;
				    JJ[i][i+2] = 19.8;
				}
				else if(i%4 == 2){
					JJ[i][i] = -180*x[i+1][0] + 3*180*(x[i][0]*x[i][0]) + 1;
				    JJ[i][i+1] = -180*x[i][0];
				}
				else if(i%4 == 3){
					JJ[i][i-2] = 19.8;
			        JJ[i][i-1] = -360*x[i][0]*x[i-1][0];
			        JJ[i][i] = 360*x[i][0] - 180*(x[i-1][0]*x[i-1][0]) + 20.2;
				}
			}
		}
		else
			System.out.println("Length of x must be multiple of 4");

		Matrix A= new Matrix(JJ);   
		return A;
		
	}
	
}
