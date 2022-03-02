public class PersonAccount {
    public static void insertpa(){
        List<Person_Account__c> paList = new List<Person_Account__c>();
        for(Integer i=0;i<10;++i){
			Person_Account__c pa = new Person_Account__c();
            pa.Name = 'Deepak pa 1: '+i;
            pa.father_name__c = 'pa fathername';
            pa.address__c = 'pa address';
            
            paList.add(pa);
        }
        if(!paList.isEmpty()){
            Insert paList;
        }
  
   		List<Loan_Data__c> loandatalist = new List<Loan_Data__c>();
        for(Person_Account__c pa: paList){
            for(integer i=0;i<3;i++){
                Loan_Data__c ld = new Loan_Data__c();
                ld.Name = 'loan data 1: '+i;
                ld.Loan_Status__c = 'Active';
                ld.Person__c = pa.Id;
                ld.loan_amount__c = 9000;
                ld.Loan_taken_date__c = date.today();
                
                loandatalist.add(ld);
            }
        }
        insert loandatalist;
    }

    //update loan_amount__c
    public static void updateld(){
        Loan_Data__c ldc = [SELECT Id, Name, Loan_Status__c, Loan_taken_date__c, Person__c, loan_amount__c FROM Loan_Data__c where Id = 'a075j000001BDk8AAG' limit 1];
        ldc.loan_amount__c = 9000;
        Update ldc;
    }
    
    //update person account
    public static void updatepa(){
        Person_Account__c pac = [select Id, Name from Person_Account__c where Id = 'a065j00000478ZWAAY'];
        pac.Name = 'Deepak pa 1: 4';
        update pac;
    }
}
