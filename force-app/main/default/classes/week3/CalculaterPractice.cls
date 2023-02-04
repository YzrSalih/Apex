public class CalculaterPractice {
    public static decimal dynamicCalulationMethod(decimal num1, decimal num2, string operation){
        decimal result = 0;
        switch on operation {
            when 'ADDITION' {
                result = num1 + num2;
            }
            when 'SUBTRACTION' {    
                result = num1 - num2;
            }
            when 'DIVISION' {
                result = num1 / num2;
            }
            when 'MULTIPLICATION' {
                result = num1 * num2;
            }
            when else {
                system.debug('Undefined Operation. Please check your parameters');
                result = null;
            }
        }
        return result;
    }
}
