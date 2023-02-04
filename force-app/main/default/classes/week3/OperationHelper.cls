    public class OperationHelper {
    public decimal sumOfListValues(List<Decimal> values){
        Decimal sum;    
        if(values.size() > 0){
            sum = 0;
            for(Decimal val : values){
                sum = sum + val;
            }
        } else {
            system.debug('Please provide values to do the operation');  
        }
        return sum;
    }
    public decimal averageOfListValues(List<Decimal> values){
        decimal average;
        if(values.size()>0){
            decimal sum = this.sumofListValues(values);
            average = sum/values.size();
            system.debug('values.size() '+values.size());
        } else {
            system.debug('Please provide values to do the operation');
        }
        return average;
    }
    public decimal highestOfListValues(List<Decimal> values){
        decimal highestElement;
        if(values.size()>0){
            highestElement = values[0];
            for(Decimal val : values){
                if(val > highestElement){
                    highestElement = val;
                }
            }
        } else {
            system.debug('Please provide values to do the operation');
        }
        return highestElement;
  }
  public decimal lowestOfListValues(List<Decimal> values){
    decimal lowestElement;
    if(values.size()>0){
        lowestElement = values[0];
        for(Decimal val : values){
            if(val < lowestElement){
                lowestElement = val;
            }
        }
    } else {
        system.debug('Please provide values to do the operation');
    }
    return lowestElement;
  }   
}
