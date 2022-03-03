public class InsertChild {
public static void insertchilds(){
		child__c children = new child__c();
        children.Name = 'deepak child';

        insert children;
        System.debug('child>>'+children);
    }
}