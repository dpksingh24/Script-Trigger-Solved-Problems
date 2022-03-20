public class OnlyOneAssesmentHandler {
    public static void oneAss(List<Assesment_Conduct__c> ascList) {
     
        Set<Id> acId = new set<Id>();
        for(Assesment_Conduct__c acObj : ascList) {
            acId.add(acObj.Student__c);
        }
        
		List<Assesment_Conduct__c> DublicateAsc = [SELECT Id, Name, Student__c 
                                                   FROM Assesment_Conduct__c
                                                  WHERE Student__c in:acId];
        
        list<Student__c> stuList = new List<Student__c>(); 
        for(Assesment_Conduct__c ascObj : ascList) {
            if(DublicateAsc.size() > 1) {
                ascObj.addError('cannot add more than one assesment');
            }
            system.debug(ascObj);
        }
    }
}
