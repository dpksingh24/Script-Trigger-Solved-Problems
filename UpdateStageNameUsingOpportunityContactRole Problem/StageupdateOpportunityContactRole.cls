public class StageupdateOpportunityContactRole {
  public static void findcon() {        
        List<Opportunity> oppList = new List<Opportunity>();
        Integer count = 0, count1 = 0;
        
        oppList = [select id, StageName From Opportunity Limit 50000];
        Set<Id> oppIds = new Set<Id>();
        for(Opportunity opr : oppList){
            oppIds.add(opr.id);
        }
        
        List<OpportunityLineItem> opliList = new List<OpportunityLineItem>();
        opliList = [ 
            SELECT
            OpportunityId
            FROM OpportunityLineItem
            WHERE OpportunityId In :oppIds
        ];
        
        for(OpportunityLineItem opli:opliList){
            for(Opportunity opportunity :oppList){
                if(opli.OpportunityId == opportunity.Id){
                    count = opliList.Size();
                }
                system.debug('size of count->'+ count);
            }
        }
        
        List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
        ocrList =[Select Id, OpportunityId From OpportunityContactRole Where OpportunityId In :oppIds];
        
        for(OpportunityContactRole ocr : ocrList){
            for(Opportunity opportunity2 :oppList){
                if(ocr.OpportunityId == opportunity2.id){
                    count1=opliList.Size();
                }
            }
        }
        
        for(Opportunity oc : oppList){
            if(count == count1){
                oc.StageName ='Closed Won';
            }
        }
        Update oppList;
    }
}
