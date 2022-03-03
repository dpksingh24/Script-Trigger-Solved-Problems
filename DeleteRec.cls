//Delete all contacts belonging to Accounts Name FIELD having 'A' in them.
public class DeleteRec {
    public static void AddContact(){
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
   	
}