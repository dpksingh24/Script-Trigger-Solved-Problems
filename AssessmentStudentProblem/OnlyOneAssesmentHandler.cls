public class OnlyOneAssesmentHandler {
    public static void oneAss(List<Assesment_Conduct__c> ascList) {
        if(ascList != NULL){
            set<Id> asscIds = new set<Id>();
            Map<Id, Assesment_Conduct__c> assesmentConductMap = new Map<Id, Assesment_Conduct__c>();
            
            for(Assesment_Conduct__c assesmentConduct : ascList) {
                if(assesmentConduct.Assessment__c != NULL) {
                    asscIds.add(assesmentConduct.Assessment__c);
                }
            }    
            system.debug(asscIds);
                
            if(asscIds != null && asscIds.size() > 0) {
                for(Assesment_Conduct__c assconduct : [SELECT Id, Student__c, Assessment__c, Name FROM Assesment_Conduct__c 
                                                       where Student__c In : asscIds]) {
                                                           assesmentConductMap.put(assconduct.Assessment__c, assconduct);
                                                       }
                for(Assesment_Conduct__c assesmentConducts : ascList) {
                    if(assesmentConducts.Assessment__c != NULL && assesmentConductMap.get(assesmentConducts.Assessment__c) != NULL) {
                        assesmentConducts.addError('you can\'t create more than one assessment for a student ');
                    }
                }
            }   
        }
    }
}
