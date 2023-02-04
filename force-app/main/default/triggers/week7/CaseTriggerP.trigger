trigger CaseTriggerP on Case (before insert, after insert) {
    //after insert because we need ID and we are doing DML
    if (trigger.isAfter && trigger.isInsert) {
        //Call method here
        CaseTriggerPHandler.createChildCase(Trigger.New, Trigger.NewMap); 
    }
}