public class CalculateBMI {

    // accepts body weight (kg)
    // body height (meter)
    // return bmi value
    public static Decimal Calculate(Decimal weight, Decimal height)
    {
        Decimal result = weight / (height*height);
        return result;
    }

    // Calculate pace method
    // accepts distance in km
    // and min
    // return pace in km/hr
    public static Decimal CalculatePace(Decimal distance, Decimal minutes){
        Decimal hr = minutes/60;
        Decimal pace = distance / hr;
        return pace;
    }
}
