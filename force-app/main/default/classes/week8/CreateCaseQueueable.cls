public with sharing class CreateCaseQueueable implements Queueable{
    // id caseId;
    // public CreateCaseQueueable(id caseIdMethod){
    //     caseId = caseIdMethod;
    // }
    public void execute(QueueableContext qc) {

        Case c = new Case();
        // c = [SELECT id, Name FROM Case WHERE id = : caseID];
        c.Type = 'Mechanical';
        c.Origin = 'Phone';
        c.Status = 'New';

        insert c;
    }
}
