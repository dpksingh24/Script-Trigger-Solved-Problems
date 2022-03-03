//Update all Opportunity with future CloseDate by Opportunity Name=Opportunity Name + 'F'
public class updateOpportunity {
	public static void upOp()
    {
        LIST<opportunity> oppList = [SELECT Name, CloseDate FROM Opportunity WHERE CloseDate < TODAY];
        LIST<opportunity> oppList2 = new LIST<opportunity>();

        //loop
        for(opportunity opp:oppList)
        {
            opp.Name = opp.Name + 'F';
            oppList2.add(opp);
            System.debug('res=>'+opp);
        }
        if(!oppList.isEmpty())
        {
        UPDATE oppList;
        }
    }
}