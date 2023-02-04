public class OperationsHelper {
   public decimal largestOutOfTwoNumbers(Decimal d1, Decimal d2){
    decimal largestNumber;
    if(d1 >= d2){
        largestNumber = d1; 
    }else{
        largestNumber = d2;
    }
    return largestNumber;
   }   
   public decimal smallestOutOfThreeNumbers(Decimal c1, Decimal c2, Decimal c3){
      
    Decimal c1c2Min = math.min(c1, c2);
    Decimal c1c2c3Min = Math.min(c1c2Min, c3);
    return c1c2c3Min; 
   }
   public Integer sumofPositiveIntegers(Integer n){
        Integer sum;
        if(n<0){
            sum = null;
            system.debug('We are not calculating the sum for negative numbers');
        } else {
            sum = 0;        
            for(Integer i = 1; i <= n; i++){
                sum = sum + i;
            }
        }
        return sum;
    }
}
