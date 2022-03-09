trigger CountContactAssoicateToAccount on Contact (after insert) {
    switch on Trigger.operationType {
        WHEN AFTER_INSERT {
            for(Contact con: trigger.new) {
                if(String.isNotBlank(con.AccountId)) {
                    String accountId = con.AccountId;
                    
                    List<AggregateResult> results = [
                        SELECT AccountId, COUNT(Id) totalContacts
                        FROM Contact
                        WHERE AccountId = :accountId
                        GROUP BY AccountId
                    ];
                    
                    for(AggregateResult result : results) {
                        String accId = String.valueOf(result.get('AccountId'));
                        Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
                        
                        Account acc = new Account();
                        acc.Id = accId;
                        acc.No_Of_Contacts__c = totalContacts;
                        UPDATE acc;
                        system.debug('contacts-> ' + acc);
                    }
                }
            }
        }
    }
}
