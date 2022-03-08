public class createDefaultHandler {
    public static void AfterInsert(List<Account> accList) {
       List<Contact> contactList = new list<Contact>();
            for(Account acc: accList){ 
                if(acc.NumberOfEmployees != NULL && acc.NumberOfEmployees != 0) {
                    for(integer i=0; i<acc.NumberOfEmployees; i++){
                        Contact con = new Contact();
                        con.LastName = acc.Name +' contact';
                        con.AccountId = acc.Id;
                        contactList.add(con);
                    }
                }
            }
            INSERT contactList;
    }  
    
    Public static void afterUpdate(List<Account> accList, Map<Id, Account> accMap) {
           set<Id> accId = new Set<Id>();
            for(Account acc:accList)
                accId.add(acc.Id);
            
            List<Contact> conList = new List<Contact>();
            conList = [Select Id, AccountId from Contact Where AccountId in :accId Limit 500000];
            
            Map<Id, List<Contact>> accId_vs_ContactList = new Map<Id, List<Contact>>();
            
            for(Contact con: conList){
                if(!accId_vs_ContactList.containsKey(con.AccountId)){
                    accId_vs_ContactList.put(con.AccountId,new List<Contact>());
                }
                accId_vs_ContactList.get(con.AccountId).add(con);
            }
            
            List<Contact> conListToCreate = new List<Contact>();
            List<Contact> conListToDelete = new List<Contact>();
            
            for(Account acc: accList){
                if(acc.NumberOfEmployees > accMap.get(acc.Id).NumberOfEmployees){
                    integer diff = acc.NumberOfEmployees - accMap.get(acc.Id).NumberOfEmployees;
                    for(Integer i = 0;i<diff;i++){
                        contact con = new Contact ();
                        con.LastName = 'After Update '+i;
                        con.AccountId = acc.Id;
                        conListToCreate.add(con);
                    }
                }else if(acc.NumberOfEmployees < accMap.get(acc.Id).NumberOfEmployees){
                    integer diff = accMap.get(acc.Id).NumberOfEmployees - acc.NumberOfEmployees;
                    List<Contact> conlist2 = accId_vs_ContactList.get(acc.Id);
                    for(Integer i = 0;i<diff; i++){
                        conListToDelete.add(conlist2[i]);
                    }
                }
                
            }
            Insert conListToCreate;
            Delete conListToDelete;
    }
}
