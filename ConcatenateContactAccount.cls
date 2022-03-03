public class ConcatenateContactAccount {
    public static void concatenateCA(){
        Integer Count = 0;
        Account acc = [select Name from Account limit 1]; 
        List<Contact> conList = [select id, FirstName, LastName from Contact];
		
		List<Contact> contacts = [select id from Contact where  AccountId = :acc.Id];        
    
        for(Contact con : contacts){
            count++;
        }
        List<Account> accounts = [select Name from Account where Name like '%Deepak%'];
        for(Account ac : accounts){
            ac.Name = ac.name + count;
        }
        update accounts;
    }
}