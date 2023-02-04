public class AccConAndOppOperation {
     public static Decimal oppsSum(){
      List<Opportunity> oppList = [SELECT id, name, amount 
                                   FROM Opportunity 
                                   WHERE amount != null and Stagename = 'Closed Won'];
    
     decimal sum = 0;
     if(oppList != null && oppList.size() > 0){
     for(opportunity op : oppList){
     sum += op.amount;
     } 
    }
    return sum;
  }
  public static List<Account> accountWithOpp (String stgName){
     List<Account> accountListWithOpp = new List<Account>();
    
     List<Account> accountList = [
                 SELECT Id, Name , (SELECT AccountId FROM Opportunities WHERE StageName = :stgName)
    FROM Account];
    
         if(accountList != null &&accountList.size() > 0){
             for(Account acc : accountList){
         if(acc.Opportunities != null && acc.Opportunities.size() > 0){
            accountListWithOpp.add(acc);
          }
         }
    
         if(accountListWithOpp != null && accountListWithOpp.size() > 0){
        return accountListWithOpp;
       }
     else{
         System.debug('There are not any records with these criteria');
         return null;
         }
     }else{
         System.debug('There are not any records with these criteria');
         return null;
         }
      } 
        public static List<Account> accountWithContact(){
             List<Account> accountList = [
             SELECT id, Name 
             FROM Account
            WHERE id IN (SELECT AccountId FROM Contact)
             ]; 
        
         if(accountList != null && accountList.size() > 0){
           return accountList;
             }else {
             return null;
        }
             }
        
         public static void createContact(id accId){
             Account acc = [SELECT id, name FROM Account WHERE id =: accId];
             Contact c = new Contact();
                  c.lastName = acc.Name;
                    c.AccountId = acc.id;
            System.debug('The Contact is created successfully');
            insert c;
     }
     public static void oppTop10(){
         List<Opportunity> oppUpdatedList = new List<Opportunity>();
         List<Opportunity> oppTop10List = [
           SELECT id, Name, Amount, Description 
           FROM Opportunity
           WHERE Amount != null
           ORDER BY Amount DESC LIMIT 10
             ];
         if(oppTop10List != null && oppTop10List.size() > 0 ){
         for(Opportunity op : oppTop10List){
         op.Description = 'This is one of the top 10 opportunity.Please work on this properly';
         oppUpdatedList.add(op);
         }
        update oppUpdatedList;
     }
    }
    public static List<Opportunity> createNOppForAcc (integer n, id accId){
         List<Opportunity> listOpp = new List<Opportunity>();
          if(n>0){
             Account acc = [SELECT Name, AnnualRevenue FROM Account WHERE id =: accId];
             for(integer i = 1 ; i <= n ; i++){
             Opportunity opp = new Opportunity();
             opp.Name = acc.Name + i;
             opp.AccountId = acc.id;
             opp.CloseDate = date.today().addYears(3);
             opp.StageName = 'Prospecting';
             if(acc.AnnualRevenue != null){
             opp.Amount = acc.AnnualRevenue/n;
             }
            listOpp.add(opp);
         }
          insert listOpp;
         }else {
         System.debug('Please tell us how many opportunities need to be create');
        }
        
         return listOpp;
        }
    }
                            
