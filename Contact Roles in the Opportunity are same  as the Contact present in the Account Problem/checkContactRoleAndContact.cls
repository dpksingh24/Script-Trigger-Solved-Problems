public class checkContactRoleAndContact {
    public static void test1(){
        
        List<Account> accList = [Select id,name from Account LIMIT 50000];
        List<Contact> conList = [Select id, AccountId from Contact where accountId != null LIMIT 50000];
        
        List<Opportunity> oppList = [Select id, AccountId, same_Contact__c from Opportunity where AccountId != null LIMIT 50000];
        List<OpportunityContactRole> contactRoleList = [Select id, ContactId, OpportunityId from OpportunityContactRole where OpportunityId IN: oppList LIMIT 50000];
        
        Map<id,set<Id>> oppIdVSContactIds = new  Map<id,set<Id>>();
        for(OpportunityContactRole roles : contactRoleList){
            if(oppIdVSContactIds.containskey(roles.OpportunityId)){
                Set<Id> contactIds = oppIdVSContactIds.get(roles.OpportunityId);
                contactIds.add(roles.ContactId);
                oppIdVSContactIds.put(roles.OpportunityId,contactIds);   
            }
            else{
                Set<Id> contactIds = new Set<Id>();
                contactIds.add(roles.ContactId);
                oppIdVSContactIds.put(roles.OpportunityId,contactIds);   
            }
        }
        Map<id,set<Id>> accIdVSContactIds = new Map<id,set<Id>>();
            for(Contact con : conList){
                if(accIdVSContactIds.containskey(con.AccountId)){
                    Set<Id> contactIds = accIdVSContactIds.get(con.AccountId);
                    contactIds.add(con.Id);
                    accIdVSContactIds.put(con.AccountId,contactIds);   
                }
                else{
                    Set<Id> contactIds = new Set<Id>();
                    contactIds.add(con.Id);
                    accIdVSContactIds.put(con.AccountId,contactIds);   
                }
            }
        List<Opportunity> oppupdateList = new List<Opportunity>();
        for(Opportunity opp: oppList){
            if(oppIdVSContactIds.containskey(opp.id) && accIdVSContactIds.containskey(opp.AccountId)){
                set<Id> contactOpp = oppIdVSContactIds.get(opp.id);
                set<Id> contactAcc = accIdVSContactIds.get(opp.AccountId);
                if(contactOpp.equals(contactAcc)){
                    opp.same_Contact__c = true;
                    oppupdateList.add(opp);
                }
                //oppIdVSContactIds.get(opp.id).equals(accIdVSContactIds.get(opp.AccountId)
            }
        }
        update oppupdateList;
    }
}    


        
        
        // map 1 key = Opportunity Id value = Set<Id> contact Id
        // key = '0065g00000EaCl4AAF'   value = set<>
        // map 2 key = Account Id value = Set<Id> contact Id
        
