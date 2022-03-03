//Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
public class createopportunity {
    
    //create 20 opportunity
   
    /*public static void createop(){        
        List<opportunity> oppo = new List<opportunity>();
        for(Integer i=0;i<5;++i){
            Opportunity op = new Opportunity();
            op.Name = 'DSR'+i;
            op.closeDate = System.today();
            op.StageName = 'stage'+i;
            OP.Amount = 50000+i;
            oppo.add(op);
        }
        if(!oppo.isEmpty()){
        	Insert oppo;
        }
    }*/
    
 
    
    
    
    
    
    public static void getop(){
        List<Account> account = [select Id, name from Account where Name='Test account' LIMIT 10];
        Opportunity opp = new Opportunity(Name='Lord Of The Rings', StageName='Qualification ', 
                                        CloseDate=Date.today(),TotalOpportunityQuantity=12,
                                        Description='Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
        opp.AccountId = opp.AccountId;
        Insert opp;
    }
    
    	
    public static void updateop(){ 
        // retrieve Lord Of The Rings films account
        Opportunity opp = [SELECT Id, Name FROM Opportunity WHERE Name='change' LIMIT 1];
        //add Amount
        opp.Amount = 20000;
        opp.Name = 'Lord';
        // update the account
        update opp;
    }
    
    public static void deleteOp(){
        // get opportunity record to delete
        List<opportunity> opp = [SELECT Id, Name FROM opportunity WHERE Name LIKE '%Lord%'];
        // delete opportunity
        delete opp;
    }
    
    public static void undeleteop(){
        List<opportunity> opp = [select Id, Name from opportunity where isDeleted=true ALL ROWS];
        undelete opp;
    }
}