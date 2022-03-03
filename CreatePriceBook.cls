//Create new price book 'Algo Price Book' and 10 products with Prices in the Pricebook
public class CreatePriceBook {
    
    public static List<Product2> createProduct(Integer productQuantity){
    	List<Product2> productList = new List<Product2>();
        for(Integer i=1; i<=10; ++i){
            Product2 prod = new Product2();
            prod.Name = 'Product Example 1: '+i;
            prod.IsActive = True;
            productList.add(prod);
        }
        if(!productList.isEmpty()){
            Insert productList;
        }
        Pricebook2 stdPb = [select Id, IsStandard from Pricebook2 where IsStandard = true Limit 1];
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        for(Product2 prod: productList){
            PricebookEntry pbe = new PricebookEntry();

            pbe.Product2Id = prod.Id;
            pbe.Pricebook2Id = stdPb.Id; 
            pbe.UnitPrice = 2;
            pbeList.add(pbe);
        }
        Insert pbeList;
        return productList;
    }
    
    public static void createCustomPricebook(){
        Pricebook2 custPricebook = new Pricebook2();
        custPricebook.Name = 'abc Pricebook';
        Insert custPricebook;
        List<Product2> prodList = createProduct(5);
    }
}