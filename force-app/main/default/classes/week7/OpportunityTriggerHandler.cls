public with sharing class OpportunityTriggerHandler {
    //Assignment QUESTION WEEK - 7 Question 2 Part A
    @Future
    public static void updateHighestAmountOppName(Set<Id> accountIdsSet){
        List<Account> accListWithOpps = new List<Account>();
        //Fetching accounts and their related opportunitites ordering them based on amount field value
        accListWithOpps = [Select Id, TargetAmount__c, HighestAmountOpportunityName__c, 
                            (Select Name, Amount from Opportunities WHERE Amount != null Order by Amount Desc) 
                            from Account Where Id = :accountIdsSet];
        for(Account acc : accListWithOpps){
            if(acc.Opportunities.size()>0){//Condition to avoid null-pointer exception
                acc.HighestAmountOpportunityName__c = acc.Opportunities[0].Name;
            } else {
                acc.HighestAmountOpportunityName__c = null;
            }            
        }
        Update accListWithOpps;
    }
        //Assignment QUESTION WEEK - 7 Question 2 Part B
        @Future
        public static void updateTargetAmountAchievedOppName(Set<Id> accountIdsSet){
            List<Account> accListWithOpps = new List<Account>();
            //Fetching accounts and their related opportunitites ordering them based on amount field value
            accListWithOpps = [Select Id, TargetAmount__c, TargetAmountAchivedOpportunityName__c, 
                              (Select Name, Amount from Opportunities Where StageName = 'Closed Won' AND Amount !=null Order by Amount Desc)
                              from Account Where Id = :accountIdsSet];
            for(Account acc : accListWithOpps){
                System.debug('accListWithOpps   '+acc.Opportunities);
                if(acc.Opportunities.size()>0 && acc.Opportunities[0].Amount >= acc.TargetAmount__c){//Condition to avoid null-pointer exception
                    acc.TargetAmountAchivedOpportunityName__c = acc.Opportunities[0].Name;
                }else{
                    acc.TargetAmountAchivedOpportunityName__c = null;
                }
            }
            Update accListWithOpps;
        }


    //Assignment QUESTION WEEK - 7 Question 2 Part C    
    @Future
    public static void updateTotalAmountGenerated(Set<Id> accountIdsSet){
        List<Account> accListWithOpps = new List<Account>();
        //Fetching accounts and their related opportunitites ordering them based on amount field value
        accListWithOpps = [Select Id, TargetAmount__c, TotalAmountGenerated__c, 
                          (Select Amount from Opportunities Where StageName = 'Closed Won' AND Amount != null)
                          from Account Where Id = :accountIdsSet];
        for(Account acc : accListWithOpps){
            Double totalAmount = 0;//PlaceHolder to store the total amount with each iteration
            for(Opportunity opp : acc.Opportunities){
                totalAmount = totalAmount + opp.Amount;
            }
            acc.TotalAmountGenerated__c = totalAmount;
        }
        Update accListWithOpps;
    }


}