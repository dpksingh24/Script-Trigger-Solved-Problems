//Print the fibonacci series. 1, 1, 2, 3, 5, 8, 13..
public class Fibonacci {
    public static void fib(){
        integer num1,num2,temp;
		num1=num2=1;
		for(integer i=1;i<=7;i++){
			system.debug(num1);
			temp=num1+num2;
            num1=num2;
            num2=temp;
        }
    }
}