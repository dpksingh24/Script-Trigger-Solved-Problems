//Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'

public class RevString {
    public static void getreverse(){
        
        List<Account> AccountList = [SELECT Name from Account LIMIT 1];
        
        List<string> revlist = new List<string>();
        String revstr ='';
        
        for(Account acc: AccountList){
            String test = acc.Name;
            //print the account name
            System.debug(acc.Name);
            
            for(integer i=test.length(); i>=0; i--)
            {
                if(test.substring(i).length()>1)
                {
                    revstr += test.substring(i).substring(0,1);
                }
                else{
                    revstr += test.substring(i);
                }
			}
            //print the rev account name
            System.debug(revstr);
        }
    }
}