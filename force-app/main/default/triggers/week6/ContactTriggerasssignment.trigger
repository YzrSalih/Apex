trigger ContactTriggerassignment on Contact (After update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        ContactTriggerHandlerAssignment.UpdateAccount(trigger.new, trigger.OldMap);
    }
}