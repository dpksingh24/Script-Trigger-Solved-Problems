public class GandhiChasmaProblem {
    public static void main() {
        List<OpportunityLineItem> opliList = [SELECT Id, OpportunityId, PricebookEntryId, Product2Id, 
                                              UnitPrice FROM OpportunityLineItem
                                              where Product2.Name like '%Chasma%'];
        List<PriceBookEntry> pbeList = [select Product2Id, UnitPrice, Pricebook2Id from PriceBookEntry where Name like '%Chasma%'];
        
        system.debug('line'+ opliList);
        
        Map<Id, Set<Id>> Productset = new Map<Id, Set<Id>>(); 
        for(PriceBookEntry pbe : pbeList) {
            set<Id> pbeId = new set<Id>();
            pbeId.add(pbe.Pricebook2Id);
            Productset.put(pbe.Product2Id, pbeId);
        }   
        System.debug('map '+Productset);
        
        Map<Id, Set<Id>> pricebookSet = new Map<Id, Set<Id>>(); 
        for(OpportunityLineItem opp : opliList) {
            set<Id> oppId = new set<Id>();
            oppId.add(opp.OpportunityId);
            pricebookSet.put(opp.PricebookEntryId, oppId);
        }   
        System.debug('map '+pricebookSet);
     	
        Decimal Total = 0.0;
        for(OpportunityLineItem getTotal : opliList) {
            if(Productset.containsKey(getTotal.Product2Id) && pricebookSet.containsKey(getTotal.PricebookEntryId)) {
                Total = Total + getTotal.UnitPrice;
            }
        }
        System.debug('ans->'+ Total);
        
    }
}

/*
Create a new Product "Gandhiji Chasma". Add Price as 100$ in standard price book and any other price books as well.
Create few oppportunites with Opportunity line item "Gandhiji Chasma". 
Write a script to get the total Price of all the Opportunity sold having Product "Gandhiji Chasma

(UnitPrice-(UnitPrice*Discount))*Quantity
*/
