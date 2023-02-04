trigger PaymentsTrigger on Payments__c (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            PaymentsTriggerHandler.updateAmountOnPaymentInsert(trigger.New);
        }
        if(Trigger.isUpdate){
            PaymentsTriggerHandler.updateAmountOnPaymentUpdate(trigger.New, trigger.oldMap);
        }
        if(Trigger.isDelete){
            PaymentsTriggerHandler.updateAmountOnPaymentDelete(trigger.Old);
        }
        // if(Trigger.isUndelete){
        //     PaymentsTriggerHandler.updateAmountOnPaymentUnDelete(trigger.New);
        // }
    }
}