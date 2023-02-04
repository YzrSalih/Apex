public class AccConAndOppOperations {

    // ***************** Week 4 *******************
    //Question 4: SOQL In Apex and DML
    //1. Write the logic to fetch and return all the accounts. Include account name, annual revenue, type, and source of account.
    public static List<Account> fetchAllAccounts(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name, AnnualRevenue, Type, AccountSource from Account];
        return accList;
    }
    //2. Find all the opportunities which has Lead Source as 'Web' and Stage as 'Closed Lost'. Make it dynamic so that it works for other stages and Lead sources as well.
    public static void fetchOpportunities(String oppStageName, String leadsrc){
        List<Opportunity> oppRetrivedList = new List<Opportunity>();
        oppRetrivedList = [Select Name, Amount from Opportunity Where StageName = :oppStageName and LeadSource = :leadsrc];
        System.debug('oppRetrivedList   -->'+oppRetrivedList);
    }
    //3. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity record should be printed in different line.
    public static void printOppAndAccDetails() {
        List<Account> accountWithOppList = new List<Account>();
        accountWithOppList = [Select Name, AnnualRevenue, (Select Name, Amount from Opportunities Where StageName = 'Closed Won') 
                                from Account Where Type ='Customer - Direct'];
        for(Account acc : accountWithOppList){
            System.debug('Account name '+acc.Name + ' and its annual revenue is --> '+acc.AnnualRevenue);
            for(Opportunity opp : acc.Opportunities){
                System.debug('Opportunity Name and Amount  -->'+opp.Name + ' '+ opp.Amount);
            }
        }
    }
    //Dynamic Version of 3.
    public static void printOppAndAccDetails(String accType, String oppStage) {
        List<Account> accountWithOppList = new List<Account>();
        accountWithOppList = [Select Name, AnnualRevenue, (Select Name, Amount from Opportunities Where StageName = :oppStage) 
                                from Account Where Type =: accType];
        for(Account acc : accountWithOppList){
            System.debug('Account name '+acc.Name + ' and its annual revenue is --> '+acc.AnnualRevenue);
            for(Opportunity opp : acc.Opportunities){
                System.debug('Opportunity Name  -->'+opp.Name);
                System.debug('Opportunity Amount  -->'+opp.Amount);

            }
        }
    }
    //4. Write a method which should return the account record after creating it.
    //Take Name, Annual Revenue, Type as input parameters and populate the values in account record. If Name is not provided, then do not create the account and show a message like Account without name cannot be created.
    public static Account createAccount(String name, Double annualRev, String type){
        Account acc = new Account();
        if(name != null && name != ''){
            acc.Name = name;
            acc.Type = type;
            acc.AnnualRevenue = annualRev;
            Insert acc;
        } else {
            system.debug('Account without name cannot be created');
        }
        return acc;
    }
    // ******************** Week 5 *******************************

    /*Part 1. 1.  Prepare a method which returns the sum of all the closed won opportunities Amount present in the org.*/
    public static Decimal oppsSum(){

        // List<AggregateResult> oppsSumList = new List<AggregateResult>();
        // oppsSumList = [Select Sum(Amount), StageName from Opportunity Group by StageName];
        // for(AggregateResult agr : oppsSumList){
        //     if(agr.get('stageName') == 'Closed Won'){
        //         System.debug(agr.get('expr0'));
        //     }
        // }
        // return oppsSumList;

        List<Opportunity> oppList = [select id, name, amount from opportunity where amount != null and stageName = 'Closed Won' ];
        decimal sum = 0;
        for (opportunity op : oppList) {
            sum += op.amount;
        }
        return sum;
    }
    /*Part 1. 2. Prepare a method which will return all the Accounts for which at least a closed Won Opportunity is present. Make it dynamic if we want to bring account for other opportunity stageNames*/
    public static List<Account> accountsWithAtLeastOneOpp(String oppstageName){
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from opportunity Where StageName =: oppstageName)];
        return accountsList;

        // List<Opportunity> oppList = [Select AccountId from opportunity Where StageName = : oppstageName];
        // Set<Id> ids = new Set<Id>();
        // for (opportunity op : oppList) {
        //     ids.add(op.AccountId);
        // }
        // List<Account> accountsList = new List<Account>();
        // accountsList = [Select Id, Name from Account where Id in :ids];
        // return accountsList;
    }
    /*Part 1. 3.Prepare a method which will return all the Accounts for which at least a contact is present*/
    //Sol1
    public static List<Account> accountsWithAtLeastOneContact(){
        //Get the account Ids from all the contacts in the org
        List<Contact> contactsList = new List<Contact>();
        contactsList = [Select AccountId from Contact];
        Set<Id> accntIdsSet = new Set<Id>();
        for(Contact con : contactsList){
            accntIdsSet.add(con.AccountId);
        }
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In : accntIdsSet];
        return accountsList;
    }
    //Sol2
    public static List<Account> accountsWithAtLeastOneContact1(){
        //Get the account Ids from all the contacts in the org
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from Contact)];
        return accountsList;
    }
    /*part 3. 1. Take account Id as input parameter and create a new contact for the provided account's Id. Populate Contact last name as same as Account's Name.*/
    public static void createContact(id accId) {
        account acc = [select id, name from Account where id = :accId];
        contact c = new contact();
        c.lastName = acc.name;
        c.accountId = acc.id;
        System.debug('success contact');
        insert c;
    }
    /* part 3. 2. Update the description field of top 10 opportunities as "This is one of the top 10 opportunity. 
    Please work on this properly" */
    public static void oppTop10() {
        list<Opportunity> oppTop10List = [SELECT Id, Name, Amount, Description FROM Opportunity WHERE Amount != null ORDER BY Amount DESC LIMIT 10];
        for (opportunity op : oppTop10List) {
            op.description = 'This is one of the top 10 opportunity. Please work on this properly';
        }
        System.debug('success opp');
        update oppTop10List;
    }
    /*part 3. 3. Write a logic to create and return n number of opportunities for a particular AccountId. 
    AccountId and n will be passed as parameters in the method. 
    Populate opportunity fields as follows:
    Close date as 3 years from today 
    Stage name as Prospecting 
    Opportunity amount as Account's annual revenue divided by n 
    and Opportunity name same as Account name 
    For Ex: if n=2, Then two new opportunities If n=0, Print the message as "Please tell us how many 
    opportunities needs to be created"*/
    public static List<Opportunity> createNOpp(integer n, id accId) {
        List<Opportunity> listOpp = new list<Opportunity>();//liste bosh bir halde bekliyor, onu dolduracagiz
        if (n>0) {
            Account acc =[select name, annualRevenue from Account where Id=:accId];
            for (Integer i = 1; i <= n;  i++){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name + i;
                opp.AccountId = accId;
                opp.CloseDate =date.today().addYears(3);
                opp.StageName = 'Prospecting';
                if (acc.AnnualRevenue!=null) {
                    opp.Amount = acc.AnnualRevenue/n;
                }
                listOpp.add(opp);
            }
        }else {
            System.debug('Please tell us how many opportunities needs to be created');
        }
        insert listOpp;
        return listOpp;        
    }
    /*part 3. 4. Find out all the Account which have no contacts attached to them. Add a contact for each one of 
    them and update the last Name of contact with the Name field of account.*/
    //ilk once accounti olmayan contactleri bulmamiz lazim
    public static void method_12() {
       List<Contact> ctList = new list<Contact>();
       List<account> listAcc= [Select Id,name from Account where Id not in (select AccountID from contact)];//where contact not exist
       for (Account eachAcc : listAcc) {
            contact ct =new contact();
            ct.LastName = eachAcc.Name;
            ct.AccountId= eachAcc.Id;
            ctList.add(ct);            
       }
       if (!ctList.isEmpty()) {
           insert ctList;           
       }
    }
    //part 3. 5. Delete all the opportunities which have amount less than 20000 and status as closed lost.
    public static void deleteOpp() {
        List<Opportunity> delOppList =[select name  from Opportunity where Amount <20000 AND StageName = 'Closed Lost'];
        if (!delOppList.isEmpty()) {
            delete delOppList;
            System.debug('Deleted');                
        }else {
            System.debug('Not Deleted, your list is empty');
        }
    }
}