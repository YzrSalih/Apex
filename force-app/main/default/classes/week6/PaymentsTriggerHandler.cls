public with sharing class PaymentsTriggerHandler {
    public static void updateAmountOnPaymentInsert(List<Payments__c> triggerNew) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payments__c p : triggerNew){
            customersIdSet.add(p.Customer__c);
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    public static void updateAmountOnPaymentUpdate(List<Payments__c> triggerNew, Map<Id, Payments__c> oldPaymentRecsMap) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payments__c p : triggerNew){
            Payments__c oldPRec = oldPaymentRecsMap.get(p.Id);
            //When Reparenting is done
            if(p.Customer__c != oldPRec.Customer__c || p.Amount__c!= oldPRec.Amount__c){//Reparenting scenario
                customersIdSet.add(p.Customer__c);//new customer Id added
                customersIdSet.add(oldPRec.Customer__c);//Old customer Id added
            }
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    public static void updateAmountOnPaymentDelete(List<Payments__c> triggerOld) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payments__c p : triggerOld){
            customersIdSet.add(p.Customer__c);
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    // public static void updateAmountOnPaymentUnDelete(List<Payments__c> triggerNew) {
    //     Set<Id> customersIdSet  = new Set<Id>();
    //     for(Payments__c p : triggerNew){
    //         customersIdSet.add(p.Customer__c);
    //     }
    //     if(!customersIdSet.isEmpty()){
    //         updateAmountOnCustomer(customersIdSet);
    //     }
    // }
    public static void updateAmountOnCustomer(Set<Id> customersIdSet) {
        List<Customer__c> customerWithPayments = new List<Customer__c>();
        customerWithPayments = [Select Id, total_Amount__c, (Select Id, Amount__c from Payments__r) from Customer__c Where Id =: customersIdSet];
        List<Customer__c> updatedCustomerList = new List<Customer__c>();//New place holder for storing updated values
        for(Customer__c c : customerWithPayments){
            decimal totalAmount = 0;
            for(Payments__c p :c.Payments__r){
                totalAmount = totalAmount + p.Amount__c;
            }
            c.total_Amount__c = totalAmount;
            updatedCustomerList.add(c);
        }
        if(!updatedCustomerList.isEmpty()){
            Update updatedCustomerList;
        }
    }
}