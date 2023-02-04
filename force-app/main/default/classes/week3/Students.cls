  public class Students {
   public string firstName;
   public string lastName;
   public integer classYear;
   public string major;

   public string generateReport(){
     system.debug('Report Generated ' + firstName + ' ' + lastName + ' for ' + classYear + ' ' + major);
     return major;

   }

}
