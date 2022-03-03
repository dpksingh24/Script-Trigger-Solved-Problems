public class opportunityClone {  
    public static void InsertOpp(){
        Opportunity opp = new Opportunity();
        opp.Name = 'deepak opp';
        opp.CloseDate = System.today();
        opp.StageName = 'deepak stage name';
        opp.Amount = 5000;
        Insert opp;
    }
    
    public static void InsertProduct(){
        Product2 pro = new Product2();
        pro.Name = 'product Clone Opp';
        pro.IsActive = True;
        Insert pro;
    }
    public static void InsertpricebookEntry(){
		Pricebook2 spb = [select id , IsStandard from Pricebook2 where IsStandard = true limit 1];
        Product2 pro = [select id from Product2 limit 1];
        
    	PricebookEntry spbe = new PricebookEntry();
        spbe.Pricebook2Id = spb.Id;
		spbe.Product2Id = pro.Id;
        spbe.UnitPrice = 500;
        spbe.IsActive = True;
        Insert spbe;
	}
    public static void oppLineItem(){
        PricebookEntry pbe = [select Id from PricebookEntry limit 1];
        Product2 pro = [select id from Product2 limit 1];
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.PricebookEntryId = pbe.Id;
        oppLine.Product2Id = pro.Id;
        oppLine.Quantity = 10;
        oppLine.UnitPrice = 100;
        
        Insert oppLine;
    }
    
    public static void cloneOpp(){
        Opportunity opp = [select id,Name,StageName,closeDate from Opportunity where Id=:'0065j00000TuZcpAAF' limit 1];
        Opportunity cloneOpp = new Opportunity();
        cloneOpp.Name = opp.Name+'clone';
        cloneOpp.CloseDate = opp.CloseDate + 30;
        cloneOpp.StageName = opp.StageName;
        insert cloneOpp;
        
        List<OpportunityLineItem> opplineList = new List<OpportunityLineItem>();
        opplineList = [select id,PricebookEntryId,OpportunityId,UnitPrice,Quantity from OpportunityLineItem 
                       where OpportunityId =:opp.Id limit 10];
        
        List<OpportunityLineItem> cloneopLine = new List<OpportunityLineItem>();
        PricebookEntry pbe = [select Id from PricebookEntry limit 1];
        for(OpportunityLineItem opline : opplineList){
            OpportunityLineItem opclone = new OpportunityLineItem();
            opclone.PricebookEntryId = pbe.id;
            opclone.OpportunityId = cloneOpp.id;
            opclone.UnitPrice = opline.UnitPrice;
            opclone.Quantity = opline.Quantity;
            cloneopLine.add(opclone);
            }
        Insert cloneopLine;
    }
}