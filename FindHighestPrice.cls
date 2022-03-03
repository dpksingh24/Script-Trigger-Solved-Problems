public class FindHighestPrice {
    public static void getHP(){
        AggregateResult pricebookentry = [select max(UnitPrice) from PricebookEntry];
        // If you have multiple unnamed columns you reference in the order called with expr0, expr1, expr2, etc.
        Double doublepbe = Double.valueOf(pricebookentry.get('expr0'));
        System.debug(doublepbe);
        /*
        List<PricebookEntry> pbookList = [select Product2.Name from pricebookEntry where UnitPrice  = :doublepbe limit 1];
        for(pricebookEntry p: pbookList){
            System.debug(P.Product2.Name+ '-->' +doublepbe);
        }*/
        
    }
}