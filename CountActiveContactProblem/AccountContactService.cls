public class AccountContactService {
    public static void updateActiveContacts(Set<Id> accountIds) {
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
}
