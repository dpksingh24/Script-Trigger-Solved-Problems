trigger PolicyOpportunity on Policy__c (before update) {
    if(trigger.isBefore && trigger.isUpdate){
      Set<Decimal> s = new Set<Decimal>();
        for(Policy__c  p1 : trigger.New){
            s.add(p1.Policy_Number__c);
        }
        List<Opportunity> op = new List<Opportunity>();
          List<Policy_c> pp = new List<Policy_c>();
       pp = [Select id ,Name,Policy_Number_c,Parent_Policyc,Opportunity_Namec,Renew_Policyc from Policy_c Where Id In : trigger.New];
        op = [Select id ,Name,Policy_Number_c,StageName from Opportunity Where Policy_Number_c In: s];
  
        for(Policy__c p : pp){
            for(Opportunity o : op){
                if(p.Policy_Number_c == o.Policy_Number_c){
                    o.StageName = 'Closed Won';
                }
                      if(p.Parent_Policy__c != null){
                          p.Renew_Policy__c = true;
                          p.Opportunity_Name__c = o.id;
                      }}}	
                    
                
            
        
        
        if(op!=null){
            update op;
        }
        if(pp!=null){
            update pp;
        }
          
    }}
