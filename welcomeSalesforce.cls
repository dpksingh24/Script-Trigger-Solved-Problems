//Create a apex class with a function that show  a message "Welcome to Salesforce "
public class welcomeSalesforce {
    String getstr = 'Welcome to Salesforce ';
    //by default private
	public void PrintString()
    {
		System.debug(getstr);  
    }
}