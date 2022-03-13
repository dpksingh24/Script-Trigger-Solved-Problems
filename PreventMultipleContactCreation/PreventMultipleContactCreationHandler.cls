public class PreventMultipleContactCreationHandler {
    public static void createPrimaryContact(List<Contact> contactList) {
        //first hold prepare set of accountid check weather is primary or not under account or not
        Set<Id> accIds = new Set<Id>();
        
        //map hold existing contacts
        Map<Id, Contact> accountIdContactMap = new Map<Id, Contact>();
        
        for(Contact contactObj: contactList) {
            if(contactObj.IsPrimary__c == True && contactObj.AccountId != NULL) {
                accIds.add(contactObj.AccountId);
            }
        }
        system.debug(accIds);
        if(accIds != null && accIds.size()>0) {
            //preparation of map accountIdContactMap for existing primary contact
            for(Contact contObj : [select id, IsPrimary__c, AccountId from Contact 
                                   where AccountId in : accIds AND IsPrimary__c = True ]) {
                                       accountIdContactMap.put(contObj.AccountId, contObj);
                                   }
            //validation starts primary or not
            for(Contact contactObj : contactList) {
                if(contactObj.IsPrimary__c == True && contactObj.AccountId != NULL && accountIdContactMap.get(contactObj.AccountId)!= NULL) {
                    contactObj.addError('You can\'t create more than one primary contact ');
                }
            }
        }    
    }
    
    public static void PrimaryContactToUpdate(Map<Id, Contact> ContactNewMap, Map<Id, Contact> ContactOldMap) {
        Set<Id> accIds = new Set<Id>();
        Map<Id, Contact> accountIdContactMap = new Map<Id, Contact>();
        
        for(Contact contactObj: ContactNewMap.values()) {
            if(ContactNewMap.get(contactObj.Id).IsPrimary__c != ContactOldMap.get(contactObj.Id).IsPrimary__c
               && ContactNewMap.get(contactObj.Id).IsPrimary__c == true && ContactNewMap.get(contactObj.id).AccountId != NULL) {
                   accIds.add(ContactNewMap.get(contactObj.id).AccountId);
               }
        }
        if(accIds != null && accIds.size()>0) {
            //preparation of map accountIdContactMap for existing primary contact
            for(Contact contObj : [select id, IsPrimary__c, AccountId from Contact 
                                   where AccountId in : accIds AND IsPrimary__c = True ]) {
                                       accountIdContactMap.put(contObj.AccountId, contObj);
                                   }
            //validation
            for(Contact contactObj : ContactNewMap.values()) {
                if(ContactNewMap.get(contactObj.Id).IsPrimary__c != ContactOldMap.get(contactObj.Id).IsPrimary__c
                   && contactNewMap.get(contactObj.Id).IsPrimary__c == true
                   && contactNewMap.get(contactObj.Id).AccountId != NULL
                   && accountIdContactMap.get(ContactNewMap.get(contactObj.Id).AccountId) != NULL) {
                       contactObj.addError('You can\'t create more than one primary contact ');
                   }
            }
        }
    }
    
    //Calculate Number of Contacts 
    public static void calculateNumberofContactsonInsert(List<Contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Contact contactObj:contactList){
            if(contactObj.AccountID!=null){
                accountIdSet.add(contactObj.AccountID);
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0){
            for(AggregateResult agrResultObj:[select count(id) contCount,AccountId 
                                              from Contact where AccountId in:accountIdSet Group By AccountId]){
                                                  Account actObj = new Account();       
                                                  actObj.Id= (Id)agrResultObj.get('AccountId');
                                                  actObj.Number_of_Contacts__c = (Integer)agrResultObj.get('contCount');
                                                  accountMap.put(actObj.Id,actObj);
                                              }
            
            if(accountMap!=null && accountMap.size()>0){
                update accountMap.values();
            }
        }
    }
    
    public static void calculateNumberofContactsonDelete(List<Contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Contact contactObj:contactList){
            if(contactObj.AccountID!=null){
                accountIdSet.add(contactObj.AccountID);
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0){
            for(AggregateResult agrResultObj:[select count(id) contCount,AccountId 
                                              from Contact where AccountId in:accountIdSet and id not in:contactList 
                                              Group By AccountId]){
                                                  Account actObj = new Account();       
                                                  actObj.Id= (Id)agrResultObj.get('AccountId');
                                                  actObj.Number_of_Contacts__c = (Integer)agrResultObj.get('contCount');
                                                  accountMap.put(actObj.Id,actObj);
                                              }
            
            if(accountMap!=null && accountMap.size()>0){
                update accountMap.values();
            }
        }
    }
}
