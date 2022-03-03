//Create new price book 'Algo Price Book' and 10 products with Prices in the Pricebook
public class price {
    public static void getPrice(){
        Pricebook2 cpb = new Pricebook2(name = 'Algo Price Book', IsActive = True);
        Insert cpb;
        
        List<Product2> prodList = new List<Product2>();
        for(Integer i=0; i<10;++i)
        {
            Product2 pro = new Product2(Name = 'Product testing 1:' + string.valueOf(i));
            prodList.add(pro);
        }
        if(!prodList.isEmpty())
        {
            Insert prodList;
        }
        
        List<PricebookEntry> pbeList = new List<PricebookEntry>();

        for(Product2 product : prodList){
            PricebookEntry pbe = new PricebookEntry(Pricebook2Id = cpb.Id,
                                                    IsActive=True, Product2Id = product.Id,
                                                    UnitPrice= 240);
            pbeList.add(pbe);
        }
        if(!pbeList.isEmpty())
        {
            Insert pbeList;
        }
    }
}