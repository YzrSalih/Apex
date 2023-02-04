public with sharing class InactiveCasesTaskCreationBatch Implements Database.Batchable<SObject>, Database.Stateful {
    public Integer count=0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Database.QueryLocator q1 = database.getQueryLocator([select Id, OwnerId, ClosedDate from Case 
        Where Status!= 'Closed' and LastModifiedDate < LAST_N_DAYS:5]);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Case> scope){
        List<Task> tasksList = new list<Task>();
        for(Case c : scope){
            Task tk = new Task();
            tk.Subject = System.Label.Subject;//'Critical action needed';//This needs to be created in Org first
            tk.Description = System.Label.Comments;//'Complete fast';//This needs to be created in Org first
            tk.WhatId = c.Id;
            tk.OwnerId = c.OwnerId;
            tk.Status = 'In Progress';
            tk.ActivityDate = Date.today().addDays(2);
            
            tasksList.add(tk);             
            count++;
        }
        if(!tasksList.isEmpty()){
            Insert tasksList;
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Total Number of tasks created:   '+count);
    }
}
