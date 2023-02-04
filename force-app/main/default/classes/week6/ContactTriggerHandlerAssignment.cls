public class ContactTriggerHandlerAssignment {
    public static void updateAccount(List<Contact> newList, Map<Id, Contact> OldMap){
        Set<id> accIdsSet = new Set<Id>();
        for(Contact c : newList){
            Contact conOldRec = OldMap.get(c.Id);
            //collect all account Ids for which we need to update fax
            if(c.Main_Contact_Person__c != conOldRec.Main_Contact_Person__c && c.Main_Contact_Person__c){
                accIdsSet.add(c.AccountId);
            }
        }
        if(!accIdsSet.isEmpty()){
            updateAccountFax(accIdsSet);
        }
    }
    public static void updateAccountFax(Set<Id> accIdsSet){
        List<Account> accountsWithContactsList = [Select Id, fax, (Select fax from Contacts where Main_Contact_Person__c = True Limit 1) from Account Where Id =: accIdsSet];
        for(Account acc : accountsWithContactsList){
            if(acc.Contacts.size() == 1)
                acc.Fax = acc.Contacts[0].Fax;
        }
        Update accountsWithContactsList;
    }
}

