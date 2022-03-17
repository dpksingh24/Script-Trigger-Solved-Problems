public class RollupAmountProblemHandler {
    public static void InsertMain(List<Contact> conList) {
        
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = new List<Account>();
        for(Contact conObj : conList) {
            if(conObj.AccountId != NULL) {
                accIds.add(conObj.AccountId);
            }
        }
        for(Account accObj : [
            select id, name, Rollup_Amount_X__c, Rollup_Amount_Y__c, type,
            (select id, name, Amount_x__c, Amount_Y__c from Contacts) 
            from Account where id in : accIds 
        ]){ 
            accObj.Rollup_Amount_X__c = 0;
            accObj.Rollup_Amount_Y__c = 0;
            
            for(Contact conObj : accObj.Contacts) {
                
                if(conObj.Amount_x__c != NULL && conObj.Amount_Y__c != NULL) { 
                    if(accObj.Type == 'Positive'){
                        accObj.Rollup_Amount_X__c = conObj.Amount_x__c;
                    }
                   else if(accObj.Type == 'Negative'){
                        accObj.Rollup_Amount_Y__c += conObj.Amount_Y__c;
                    }
                    else {
                        accObj.Rollup_Amount__c = accObj.Rollup_Amount_X__c + accObj.Rollup_Amount_Y__c + conObj.Amount_x__c + conObj.Amount_Y__c;
                    }
                }
            }
            accList.add(accObj);
        }
        if(!accList.isEmpty()){
            update accList;
        }       
    }
}
                    /*
Make two number fields on contact object
Amount_X
Amount_Y
2) Make one picklist field "Type" , values ('Positive', 'Negative') on Account Object
3) Make two number fields on account
Rollup_Amount_X
Rollup_Amount_Y
Rollup_Amount
4) Make one trigger on contact object, which will do following:
--> **Sum all child of contact's field "Amount_X" and store in parent account's "Rollup_Amount_X" Where Account's Type is "Positive"
--> **Sum all child of contact's field "Amount_Y" and store in parent account's "Rollup_Amount_Y" Where Account's Type is "Negative"
--> **Sum all child of contact's field "Amount_X" + "Amount_Y" and store in parent account's "Rollup_Amount"
*/
