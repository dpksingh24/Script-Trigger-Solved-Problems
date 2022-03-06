public class CountOfActiveContactHandler {
    public static void afterInsertHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: newContacts) {
            if(String.isNotBlank(con.AccountId)) {
                accountIds.add(con.AccountId);
            }
        }
        
        List<AggregateResult> results = [
            SELECT AccountId, COUNT(Id) totalContacts 
            FROM Contact
            WHERE Active__c = TRUE AND AccountId IN:accountIds
            GROUP BY AccountId
        ];
        List<Account> accountsToUpdate = new List<Account>();
        for(AggregateResult result : results) {
            
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            
            Account acc = new Account();
            acc.Id = accId;
            acc.Active_Contacts__c = totalContacts;
            accountsToUpdate.add(acc);
        }
        Update accountsToUpdate;
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
            //get aggregate result for all accounts
            List<AggregateResult> results = [
                SELECT AccountId, COUNT(Id) totalContacts 
                FROM Contact
                WHERE Active__c = TRUE AND AccountId IN:accountIds
                GROUP BY AccountId
            ];
            //build final list of accounts to update
            List<Account> accountsToUpdate = new List<Account>();
            for(AggregateResult result : results) {
                //get account ID and number of active contacts
                String accId = String.valueOf(result.get('AccountId'));
                Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
                //make sure you use id feild in your account to update it
                Account acc = new Account();
                acc.Id = accId;
                acc.Active_Contacts__c = totalContacts;
                accountsToUpdate.add(acc);
            }
            Update accountsToUpdate;
    }
}
