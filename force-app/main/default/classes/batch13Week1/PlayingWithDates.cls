public class PlayingWithDates {
   
    public void printDateOutput(){

        //Print today's date
        Date todayDate = Date.today();
        System.debug('Today is : ' + todayDate);

        //Create an instance of a date for 5th November 2789
        Date november5 = Date.newInstance(2789, 11, 5);
        System.debug('Instance of a date for 5th November 2789 : ' + november5);

        //Create an instance of a date for 4th March 1459.
        Date march4 = Date.newInstance(1459, 3, 4);
        System.debug('Instance of a date for 4th March 1459 : ' + march4);

        //Create three Integer variables (dayInt, monthInt, yearInt) for storing day, month, year
        //respectively, and provide some default values. Using the three Integer variables (dayInt,
        //monthInt, yearInt) create a new date instance and save it in a new variable

        Integer dayInt = 13;
        Integer monthInt = 1;
        Integer yearInt = 2023;
        Date myDate = Date.newInstance(yearInt, monthInt, dayInt);
        System.debug('New date instance : ' + myDate);

    }
}