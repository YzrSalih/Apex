trigger CustomerTrigger on Customer__c (before delete,after Insert) {
    if(Trigger.isDelete && Trigger.isBefore){
        CustomerTriggerHandler.updateRelatedPayments(Trigger.old);
    }
    if(Trigger.isInsert && Trigger.isAfter){
        CustomerTriggerHandler.createDefaultPayments(Trigger.new);
    }
}
