public class DiffDates {
 public static void getDiff(){
        
        Datetime startdate = Datetime.newInstance(2016, 01, 06, 06, 07, 55);
        Datetime enddate = Datetime.newInstance(2016, 02, 05, 07, 08, 55);

        Integer year = startdate.year()-enddate.year();
        Integer month = startdate.month()-enddate.month();
        Integer days = startdate.day()-enddate.day();
        Integer hour = startdate.hour()-enddate.hour();
        Integer minute = startdate.minute()-enddate.minute();
        Integer second = startdate.second()-enddate.second();

        System.debug('Difference between two dates=>'+year+'Years'+month+'Months'+days+'Days'+hour+'Hours'+minute+'Minutes'+second+'Seconds');

    }
}