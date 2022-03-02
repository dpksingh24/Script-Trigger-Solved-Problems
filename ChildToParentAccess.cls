public class ChildToParentAccess {
    public static void getparent(){
        
    //delete a 
    List<Account> accountList = new List<Account>();
    accountList = [Select Id, Name From Account Where Name Like '%a%' LIMIT 10];
    
    set<Id> accIdSet = new set<Id>();
    for(Account acc : accountList){
        accIdSet.add(acc.Id);
    }
    
    List<Contact> conList = new List<Contact>();
    /*conList = [select Id, Name, AccountId from contact where AccountId IN: accIdSet limit 50000];
*/
    //or
    
    //child to parent
    conList = [select Id, Name, AccountId, Account.Name from Contact where Account.Name Like '%a%' limit 50000];
	delete conList;

    }
    
    public static void get(){
        List<Contact> contacts = new List<Contact>();
        contacts= [select Account.Name, Account.Rating,(select CaseNumber, Subject From Cases) from Contact];
        for(Contact con: contacts){
            System.debug('con name'+ con.Account.Name + 'con department'+ con.Account.Rating);
        }
    }
}