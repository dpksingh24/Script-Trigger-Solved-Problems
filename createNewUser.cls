public class createNewUser {
    public static void addNew(){
    Profile proId = new Profile();
        proId = [SELECT Id FROM Profile WHERE Name='System Administrator' LIMIT 1];
        //System.debug('Informations are- '+obj);
        User usr=new User();
        usr.Alias='testing';
        usr.LastName='test';
        usr.Email='dpksingh@cloudanalogy.com';
        usr.Username='singhdpk24@cloud.com';
        usr.ProfileId = proId.Id;
        usr.EmailEncodingKey='UTF-8';
        insert usr;
        System.debug('New System Admin user is - '+usr);
    }
}