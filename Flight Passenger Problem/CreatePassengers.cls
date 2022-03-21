public class CreatePassengers {
    public static void addFlight() {
        List<Flight__c> flightList = new List<Flight__c>();
        for(Integer i=0;i<=2;i++) {
            Flight__c flightObj = new Flight__c();
            flightObj.Name = 'Flight 1: '+ i;
            flightObj.capacity__c = Integer.valueOf((math.random() * 1000));
            flightList.add(flightObj);
        }
        if(!flightList.isEmpty()) {
            INSERT flightList;
        }
    }
    
    public static void addPass() {
        List<Passenger__c> passList = new List<Passenger__c>();
        for(Integer i=0; i<9; i++) {
            Passenger__c passObj = new Passenger__c();
            
            //creting a random insertion between values of picklist
            List<String> avilable = new List<String>{'Adult','Infant','Child'};
                Integer listSize = avilable.size();
            Integer randomPic = Integer.valueOf((Math.random() * listSize));
            
            passObj.Name = 'Passenger 1: '+ i;
            passObj.Age_Group__c = avilable[randomPic];
            passObj.d_o_b__c =  date.newInstance(1990, 10, 24);
            passList.add(passObj);
        }
        if(!passList.isEmpty()) {
            INSERT passList;
        }
    }
    
    public static void  flightPass() {
        
        Flight__c flightList = [select id from Flight__c LIMIT 1];
        List<Passenger__c> passList = [ select id from Passenger__c LIMIT 50000];
        
        List<Flight_passenger__c> flpList = new List<Flight_passenger__c>();
        
        //creating dynamically insertion for section field
        List<String> avilableSection = new List<String>{'first class','business class','economy class'};
            Integer listSize = avilableSection.size()-1;
        Integer randomSection = Integer.valueOf((Math.random() * listSize));
        
        for(Passenger__c pasObj : passList) { 
            for(Integer i=0; i<3; i++){
                Flight_passenger__c flpObj = new Flight_passenger__c();
                
                flpObj.Name = 'Flight 1 '+i;
                flpObj.Passenger__c = pasObj.Id;
                flpObj.Flight__c = flightList.Id;
                
                flpObj.Section__c = avilableSection[randomSection];
                
                flpObj.date_of_departure__c = date.today();
                flpList.add(flpObj);
            }
        }
        INSERT flpList;
    }
    
    
    
}

/*
to create 9 pass with 3 diff section in 3 flight
*/
