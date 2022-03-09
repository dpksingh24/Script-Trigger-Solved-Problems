
public class CountopportunitylineItem {
    public static void findcon(){    
        
        set<Id> oppId  = new Set<Id>();
        
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        oliList = [SELECT Id, OpportunityId, Opportunity.AccountId from OpportunityLineItem LIMIT 50000];
        for(OpportunityLineItem oli : oliList) {
            oppId.add(oli.OpportunityId);
        }
        
        Map<Id, Integer> opmap = new Map<Id, Integer>();
        for(OpportunityLineItem op: oliList)  {
            if(!opmap.ContainsKey(op.Opportunity.AccountId)) {
                ///after getting one record
                opmap.put(op.Opportunity.AccountId, 1);
            }else {
                Integer count = opmap.get(op.Opportunity.AccountId);
                count++;
                opmap.put(op.Opportunity.AccountId, count);
            }
        }
        
        //
        List<Account> accList = new List<Account>();        
        for(Id key: opmap.keySet()){
            Account acc = new Account ();
            acc.id = key;
            acc.No_of_Opportunities__c = opmap.get(key);
            accList.add(acc);
        }
        if(!accList.isEmpty()) {
            UPDATE accList;
            System.debug('->'+ accList);
        }
  }
}
        
       	
