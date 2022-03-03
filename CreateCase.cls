//WAP to create 5 Case Records with all the values(Account, Contact, etc) filled in.
public class CreateCase {
    public static void getcase(){
        
        Account acc = [select Id, Name from Account where Name Like 'Deepak0'];
        Contact con = [select Id, Name from Contact  where Name Like '%Deepak0%'];
        Product2 pro = [SELECT Id, Name FROM Product2 where Name like '%product0%'];
       
        List<Case> addcase = new List<Case>();
        for(integer i=0;i<5;i++)
        {    
            Case objcase = new Case();

            objcase.Status = 'New';
            objcase.Origin = 'Phone';
            objcase.Type = 'Mechanical';
            objcase.SuppliedEmail='dpkrwt00@gmail.com';
            objcase.SuppliedName = 'deepak';
            objcase.SuppliedPhone = '8126263844';
            objcase.Reason = 'BreakDown';
            objcase.Subject = 'Subject testing';
            objcase.Description = 'Description Testing...';
            
            objcase.AccountId = acc.Id;
            objcase.ContactId = con.Id;
            objcase.ProductId = pro.Id;
            
            addcase.add(objcase);
        }
        Insert addcase;
        
    }
}