public class updateAssessmentTosStudent {
    public static void insertTotalAssessmentGiven(List<Assesment_Conduct__c> ascList) {
        
        set<Id> acIds = new Set<Id>();
        for(Assesment_Conduct__c acObj: ascList) {
            acIds.add(acObj.Student__c);
        }
        system.debug(acIds);
        
        Map<Id,Student__c> stuMap = new Map<Id, Student__c>();
        
        if(acIds != NULL && acIds.size() > 0) {
            for(AggregateResult results : [
                SELECT count(Id) total, Student__c 
                FROM Assesment_Conduct__c 
                WHERE Student__c IN: acIds
                GROUP BY Student__c
            ]) {
                Student__c stuObj = new Student__c();
                stuObj.Id = (Id)results.get('Student__c');
                stuObj.totalAssessmentGiven__c = (Integer)results.get('total');
                stuMap.put(stuObj.Id, stuObj);
                system.debug(results);   
            }
            
            if(stuMap!=NULL && stuMap.size()>0) {
                update stuMap.values();
            }
            system.debug(stuMap);
        }
    }
}
