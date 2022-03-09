
public class CountopportunitylineItem {
    public static void findcon(){    
        
        set<Id> oppId  = new Set<Id>();
        
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        oliList = [SELECT OpportunityId, Opportunity.AccountId from OpportunityLineItem LIMIT 50000];
        for(OpportunityLineItem oli : oliList) {
            oppId.add(oli.OpportunityId);
        }
        
        Map<Id, Integer> opmap = new Map<Id, Integer>();
        for(OpportunityLineItem op: oliList)  {
            if(!opmap.ContainsKey(op.Opportunity.AccountId)) {
                //put -> Associates the specified value with the specified key in the map.
                opmap.put(op.Opportunity.AccountId, 1);
            }else {
                //get(key)-> Returns the value to which the specified key is mapped, or null if the map contains no value for this key.
                Integer count = opmap.get(op.Opportunity.AccountId);
                count++;
                opmap.put(op.Opportunity.AccountId, count);
            }
        }
        
        //
        List<Account> accList = new List<Account>();        
        //keySet()-> Returns a set that contains all of the keys in the map
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
        
       	
