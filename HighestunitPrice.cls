public class HighestunitPrice {
    public static void PrintSA(){
        List<AggregateResult> agr = new List<AggregateResult>();
        agr = [select StageName, MAX(Amount) FROM Opportunity Where StageName = 'Closed Won' GROUP BY StageName];
        System.debug('->'+agr);
    }   
}
