public class objectCreate {
	public static void test()
    {
      List<Account> accList = new List<Account>();
        for(Integer i=0;i<5;i++)
        {
            Account acc = new Account();
            acc.Name = 'Test account'+i;
            acc.Phone = '123456789';
            
            accList.add(acc);
        }
        System.debug('accList'+accList);
        //govern limit 
        if(!accList.isEmpty()){   
            //(accList.size() > 0)
        	Insert accList;
        }
    }
    
    //insert
    public static void addContact(){
        List<Account> accountList = new List<Account>();
        accountList = [select Id,Name from Account where Name Like '%Test Account%' LIMIT 5];
        //refrence
        List<Contact> conList = new List<Contact>();
        for(Account acc: accountList){
            Contact con  = new Contact();
            con.LastName = 'test contact';
            con.AccountId = acc.Id;
        	conList.add(con);
       }
        if(!accountList.isEmpty()){
            Insert conList;
        }
    }
    
    //update 
    public static void updateAcc(){
        List<Account> accountList = new List<Account>();
        accountList = [select Id,Name from Account where Name Like '%test%'];
        for(Account acc: accountList){
        	acc.Name = 'Alpha.'+ acc.Name;
       	}
        if(!accountList.isEmpty())
        {
            Update accountList;
        }
    }
    
    
    //delete
    public static void deleteAcc(){
        Account acc = new Account();
        acc = [Select Id, Name From Account Where Name Like '%a%' LIMIT 5];
        if( acc.Id != null){
            Delete acc;
        }
    }
}