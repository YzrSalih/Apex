public static List<Account>fetchAllAccounts(){
    List<Account>accList = new List<Account>();
        accList = [Select Id, Name, AnnualRevenue, Type, AccountSource from Account];
        return accList;
 }
