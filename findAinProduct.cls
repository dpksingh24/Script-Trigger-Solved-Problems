//Find all the Products having Description field containing 'a' in it.
public class findAinProduct {
    //find a in description
    public static void getAllProducts(){
        list<Product2> listacc = new list<Product2>();
        listacc = [SELECT Id, Description FROM Product2 where name like '%a%'];
        System.debug('->'+ listacc);
    }    
    
    //Create 10 Products with different Product Names,  Discrption & Family 
    //create 10 products
    public static void getProd(){
    List<Product2> proL = new List<Product2>();
    
    for(Integer i=0;i<10;++i)
    {
        Product2 pro = new Product2();
        pro.Name = 'product User'+i;
        pro.Name = 'Desc';
        pro.Family = 'nuclear';
        proL.add(pro);
    }
    Insert proL;
    }
}