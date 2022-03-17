public class PolicyProblemHandler {
    public static void updatepolicy(List<Policy__c> updatePolicy) {
        
        Set<Decimal> policySet = new Set<Decimal>();
        for(Policy__c poObj : updatePolicy) {
            if(poObj != NULL) {
                policySet.add(poObj.Policy_number__c);
            }
        }
        
        List<Opportunity> opList = [SELECT Id, StageName, Policy_number__c 
                                    FROM Opportunity
                                    where Policy_number__c in : policySet];
        
        for(Opportunity opObj : opList) {  
            opObj.CloseDate = date.today();
            opObj.StageName = 'Closed Won';
            opObj.Name = 'Policy Opportunity Name';
            opObj.Amount = integer.valueOf((math.random() * 100));
        }
        if(!opList.isEmpty()) {
            UPDATE opList;
            system.debug(opList);
        }
        
        for(Policy__c checkforParentPolicy : updatePolicy) {
            for(Opportunity op :opList) {
                if(checkforParentPolicy.Parent_policy__c != NULL) {
                    checkforParentPolicy.Renew_policy__c = True;
                    checkforParentPolicy.Opportunity__c = op.Id;
                }
            }
        }
        
    }
}


/*
"**Create a custom object with name "Policy" have field "Renew policy"[checkbox] 
and a self lookup field name "Parent policy" it has an another field named "Policy number"[number,unique]
and a lookup with opportunity object with field name "opportunity name".create a field on opportunity with name "Policy number[unique]". 

write a trigger on policy[before update] to find the opportunity 
**with policy number opportunity[policy number] == Policy[policy number] then update opportunity to closed won 
**and if Parent policy is not null then update the parent policy filed "Rnew policy" = true 
**and update the policy "Opportunity name[lookup]" with opportunity Id."

*/
