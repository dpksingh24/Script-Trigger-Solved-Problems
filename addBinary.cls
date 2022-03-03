// WAP to add two binary nos. '100101' & '0101101' which are in text format.

public class addBinary{
    public static void binary() {
        Integer num1 = 100101;
        Integer num2 = 0101101;
        integer i=0;
        integer carry =0;
        List<integer> finalSum = new List<integer>();
        
        while(num1 != 0 || num2 != 0){
            finalSum[i++] = (integer)(carry + (num1 * 10 + num2 * 10) * 2);
            carry = (integer) ((num1 * 10 + num2 * 10 + carry) / 2);
            
            num1  = num1/10;
            num2 = num2/10;
            
            if(carry != 0){
                finalSum[i++] = carry;
            }
            --i;
            System.debug('output: ' );
            
            while(i >= 0){
                System.debug(finalSum[i--]);
            }
        }
        
    }
}