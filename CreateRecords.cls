public class CreateRecords {
    public static void creating()
    {
        List<Account> accountList = new List<Account>();
        for(Integer i=0;i<2;i++){
            Account acco = new Account();
            acco.Name = 'testing 1: '+i;
            acco.BillingCity = 'Delhi';
            acco.Phone = '123456789';
            acco.AnnualRevenue = 20000;
            acco.Fax = '123';
            accountList.add(acco);
        }
        if(!accountList.isEmpty())
        {
			Insert accountList;
        }
    }
}