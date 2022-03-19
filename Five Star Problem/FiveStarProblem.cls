public class FiveStarProblem {
    public static void main() {
        
        List<Product2> proList = [SELECT Id, Rate__c FROM Product2 where Rate__c = '5 star'];        
        List<OpportunityLineItem> opliList = [SELECT Id, OpportunityId, Product2Id, Rate__c 
                                              FROM OpportunityLineItem where Product2Id in : proList];
        for(OpportunityLineItem opliObj: opliList) {
            if(String.isNotBlank(opliObj.Rate__c)) {
                List<String> Langs = opliObj.Rate__c.split(';');
                opliObj.Counter__c = Langs.size();
            } else {
                opliObj.Counter__c = 0;
            }
        }
        update opliList;
        
        List<OpportunityLineItem> opli = [SELECT Id, OpportunityId, Counter__c, Product2Id, Rate__c FROM OpportunityLineItem 
                                          where Product2Id in: proList];
        
        List<Id> key = new List<Id>();
        for(OpportunityLineItem oli : opli) {
            if(oli.Counter__c <3 && oli.Counter__c>0) {
                key.add(oli.Product2Id);
            }
            List<Product2> prod = [select name from Product2 where id in : key];
            system.debug(prod);
        }
        
    }
}


/*
"Create a Multi picklist field ""Rate"" [Values as 1 star, 2 stars, 3 stars, 4 stars, 5 stars] on Product2
and same Multi picklist field ""Rate"" on Opportunitylineitem with the same value.
Write a script to get all the Products which got less than 3 ratings in opportunity line items but the Product rate for those was 5 star."    
*/







