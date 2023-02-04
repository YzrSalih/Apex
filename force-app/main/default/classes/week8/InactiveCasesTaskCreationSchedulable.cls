public with sharing class InactiveCasesTaskCreationSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        InactiveCasesTaskCreationBatch b = new InactiveCasesTaskCreationBatch(); 
        database.executeBatch(b,40);
    }
}