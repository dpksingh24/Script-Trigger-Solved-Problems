public class AddJpgPdf {
    public static void copying(){
        Account accAdd = [select id,name from Account where Name like '%Deepak%' limit 1];
        Opportunity op = new Opportunity();
        op.AccountId = accAdd.Id;
        op.Name = 'Rawat';
        
        Insert op;
        
        List<ContentDocumentLink> cdl = [select LinkedEntityId, ContentDocumentId, ShareType from ContentDocumentLink where LinkedEntityId='0015j00000Xrl7JAAR'];
        
        for(ContentDocumentLink cod: cdl){
            ContentDocumentLink cd = new ContentDocumentLink();
            cd.ContentDocumentId = cod.ContentDocumentId;
            cd.LinkedEntityId =op.Id;
            cd.ShareType='v';
            
            Insert cd;
        }
    }
}