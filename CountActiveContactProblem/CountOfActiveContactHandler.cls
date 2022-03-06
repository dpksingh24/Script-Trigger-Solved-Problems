public class CountOfActiveContactHandler {
    public static void afterInsertHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: newContacts) {
            if(String.isNotBlank(con.AccountId)) {
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }
    
    public static void afterUpdateHandler(List<Contact> updateContact, Map<Id, Contact> oldContactsMap) {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: updateContact) {
            //capture the account id only if active checkbox value if flipped
            if(String.isNotBlank(con.AccountId) && oldContactsMap.get(con.Id).Active__c != con.Active__c) {
                accountIds.add(con.AccountId);
            }else if(oldContactsMap.get(con.Id).AccountId != con.AccountId) {
                accountIds.add(con.AccountId);
                accountIds.add(oldContactsMap.get(con.Id).AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }
}
