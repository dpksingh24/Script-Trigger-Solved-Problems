public class countContactAndUpdateAccountField {
    public static void getCon() {
        
        Map<Id, List<Contact>> AcctContactList = new Map<Id, List<Contact>>();
        Set<Id> AcctIds = new Set<Id>();   
        
        List<Account> AcctList = new List<Account>();
        List<Contact> ConList = new List<Contact>();
        
        for(Contact Con : ConList) {
            AcctIds.add(Con.AccountId);   
        } 
        
        if(AcctIds.size() > 0){
            ConList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : AcctIds];
            
            for(Contact Con : ConList) {
                if(!AcctContactList.containsKey(Con.AccountId)){
                    AcctContactList.put(Con.AccountId, new List<Contact>());
                }
                AcctContactList.get(Con.AccountId).add(Con);     
            }                          
            
            AcctList = [SELECT No_Of_Contacts__c FROM Account WHERE Id IN : AcctIds];
            for(Account Acc : AcctList) {
                ConList = AcctContactList.get(Acc.Id);
                Acc.No_Of_Contacts__c = ConList.size();
            }   
            update AcctList;   
        }
     
    }
}    




/*
"Find atleast 5 Account from your ORG having highest number of Contacts and It should be displayed in ascending order.
Create a map to store number of contacts in key and list of associated contacts in value. If two Accounts having 
the same number of Contacts then it should display only one Account among them(Accounts having same no. of Contacts)."
*/
