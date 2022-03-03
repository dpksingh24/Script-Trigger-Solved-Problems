public class Binaryadd {
    public static void Add()
    {
        String s1 = '0101101', s2 = '100101', str;
        Integer a,b,rem;
        Double n1=0,n2=0;
    
        List<String> Output = new List<String>();
    
        a = integer.valueOf(s1);
        b = integer.valueOf(s2);
    
    //Converting Binary To Integer of S1
    for(Integer i=0;i<s1.length();i++)
    {
	    rem = Math.mod(a, 10);
    	a=a/10;
        if(Rem==1)
            n1 = n1+Math.pow(2, i);
    }
    
    //Converting Binary To Integer of S2
    for(Integer i=0;i<s2.length();i++)
    {
        rem = Math.mod(b, 10);
        b=b/10;
        if(rem==1)
            n2 = n2+Math.pow(2, i);
    }
        
    Double Num = n1+n2;
    
    //Converting Double to Integer
    integer x = Num.intValue();
    
    //Converting Integr To Binary
    for(Integer i=0;x!=0;i++)
    {
        rem=Math.mod(x, 2);
        x=x/2;
        if(rem==1)
            Output.add('1');
        else
            Output.add('0');
    }
        
    str = Output.toString();
    System.debug(str.reverse());
    }
    
}