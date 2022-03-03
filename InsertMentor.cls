public class InsertMentor {
    public static void insertparent(){
		parent__c parent = new parent__c();
        parent.Name = 'deepak parent';
        parent.email__c = 'dpk@gmail.com';
            
        Insert parent ;
        System.debug('parent>>'+parent);
    }
}