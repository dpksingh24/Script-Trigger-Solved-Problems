public class updateAssessmentToStudent {
    public static void insertTotalAssessmentGiven(List<Assesment_Conduct__c> ascList) {
        
        set<Id> acIds = new Set<Id>();
        for(Assesment_Conduct__c acObj: ascList) {
            acIds.add(acObj.Student__c);
        }
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
        }
    }
    
    //update && delete
    public static void updateTotalAssesmentGiven(List<Assesment_Conduct__c> ascList) {
        
        Set<Id> stuIds = new Set<Id>();  
        Map<Id, Student__c> stumap = new Map<Id, Student__c>();
        
        for(Assesment_Conduct__c ascObj : ascList){
            if(ascObj.Student__c != NULL) {
                stuIds.add(ascObj.Student__c);
            }
        }
        system.debug(stuIds);
        
        if(stuIds != NULL && stuIds.size() > 0) {
            for(AggregateResult agrResultObj : [
                SELECT COUNT(Id) total, Student__c FROM Assesment_Conduct__c 
                WHERE Student__c in : stuIds AND Id not in : ascList
                GROUP BY Student__c 
            ]) {
                
                system.debug('after delete: '+ agrResultObj);
                
                Student__c studentObj = new Student__c();
                
                String sid = String.valueOf(agrResultObj.get('Student__c')); 
                Integer total = Integer.valueOf(agrResultObj.get('total'));
                
                studentObj.Id = sid;
                studentObj.totalAssessmentGiven__c = total;
                stumap.put(studentObj.Id, studentObj);
            }
            system.debug(stumap);   
        }
        
        for(Id sid : stuIds) {
            if(!stumap.containsKey(sid)) {
                stumap.put(sid, new Student__c(Id = sid, totalAssessmentGiven__c = 0));
            }
        }
        
        if(stumap != NULL && stumap.size()>0) {
            UPDATE stumap.values();
        }
        
    }
}
