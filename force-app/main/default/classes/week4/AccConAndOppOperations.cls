public class AccConAndOppOperations {
 public static List<Account> fetchAllAccounts(){
     List<Account> accList = new List<Account>();
     accList = [Select Id, Name, AnnualRevenue, Type, AccountSource from Account];
     return accList;
   }
 public static List<Opportunity> fetchOpps(string leadSrc, string stage){
    List<Opportunity> oppsList = new List<Opportunity>();
    oppsList = [Select Name, Amount from Opportunity Where LeadSource =: leadSrc and StageName =: stage];
    return oppsList;
 }  
 public static void fetchAccountsWithOpps(String AccessType, String oppStage){
    List<Account> accsList = new List<Account>();
    accsList = [Select Name, AnnualRevenue,(Select Name, Amount from Opportunities Where StageName =:oppStage)
                from Account Where Type =: AccessType];
        for(Account acc : accsList){
            system.debug('List for Opportunities for Account -->' + acc.Name);
            for(Opportunity opp : acc.Opportunities){
                system.debug('Opportunity -->' + opp);
            }
        }
 }
 public static Account createAccount(String name, decimal revenue, String type){
     Account acc = new Account();
      if(name != null){
       acc.Name = name;
       acc.AnnualRevenue = revenue;
       acc.Type = type;
       İnsert acc;
    }else{
      system.debug('Account Without Name cannot be created');
     }
     return acc;
   } 
}