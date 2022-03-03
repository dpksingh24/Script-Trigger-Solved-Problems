public class CreateProduct {
    public static void getProd(){
        List<Product2> proL = new List<Product2>();
        for(Integer i=0;i<10;++i)
        {
            Product2 pro = new Product2();
            pro.Name = 'Product Testing 1: '+i;
            pro.Family = 'nuclear';
            
            proL.add(pro);
        }
        Insert proL;
    }
}