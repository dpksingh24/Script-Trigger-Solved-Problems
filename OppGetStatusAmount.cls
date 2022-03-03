//Find the the Opportunity which status is  closed Won and has highest amount.
public class OppGetStatusAmount {
    public static void PrintSA(){
       List<AggregateResult> agr = new List<AggregateResult>();
       agr = [select StageName, MAX(Amount) FROM Opportunity Where StageName = 'Closed Won' GROUP BY StageName];
       System.debug('->'+agr);
    }
}