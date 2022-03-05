//Create 10 Contacts with different Account(LookUp) values(Relationship) with no same 2 account in them.
public class InsertContact {
    public static void InsertCon(){
        
        List<Account> accList = new List<Account>();
        accList = [select id, name from Account LIMIT 20];
        
        list<Contact> listconn = new list<Contact>();
        Integer k=0;
        for(integer i=1;i<10;++i){
            k=k+1;
            Contact con = new Contact();
            con.LastName = accList.get(k).Name;
            con.AccountId = accList.get(k).Id;
            listconn.add(con);
        }
        Insert listconn;
        System.debug(listconn);
    }
    
    
    //using sobject demo
    public static void insertAcc(){
        SObject accountrec = (SObject) Type.forName('Account').newInstance();
        accountrec.put('Name', 'Sample Sobject');
        accountrec.put('Phone', '123456789');
        
        insert accountrec;
    }
}
