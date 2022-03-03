//Print any Integer number in reverse order. Ex: 789234  => 432987
public class ReverseNo {
    public static void rev(){
		Integer num = 789234,reverse = 0,rem;
        while(num>0){
             reverse=(reverse*10)+math.mod(num,10);
             num=num/10;
        }
        	System.debug(reverse);
		}
}