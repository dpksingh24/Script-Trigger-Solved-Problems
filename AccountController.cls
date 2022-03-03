public class AccountController {
	//1 method
	/*public static List<Account> insertAccounts(List<Account> accountToInsert)
    {
        insert accountToInsert;
        return accountToInsert;            
    }
*/
    
    //2nd method
    public static List<Account> getAllAccounts()
    {
        List<Account> accounts = [select Name, Phone FROM Account];
        return accounts;
    }
    
    //3rd method
    public static void printAllAccounts()
    {
        List<Account> accounts = getAllAccounts();
        for(Account account: accounts)
        {
			System.debug('Acc Name: '+account.Name + 'acc Phone: '+ account.Phone);
        }
    }
}