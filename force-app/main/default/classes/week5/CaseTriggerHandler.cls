public with sharing class CaseTriggerHandler {
    //Question 3 Solution
    /* Whenever a case is created with origin as email then set status as new and Priority as Medium */

    public static void setCaseStatusAndPriority(List<Case> triggerNew) {
        for(Case cs: triggerNew){
            if(cs.Origin=='Email'){
                cs.Status='New';
                cs.Priority='Medium';
            }
        }
    }
}
