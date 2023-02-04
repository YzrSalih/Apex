DeleteClosedLostOppsBatch dlteClsd = new DeleteClosedLostOppsBatch();
Id batchId = Database.executeBatch(dlteClsd, 10); //default = 200/ max:2000

InactiveCasesTaskCreationBatch ite = new InactiveCasesTaskCreationBatch();
Database.executeBatch(ite,5);

CreateCaseQueueable cc = new CreateCaseQueueable();
Id jobId = system.enqueueJob(cc);
system.debug(jobId);

DeleteClosedLostOppsBatchSchedulable dcs = new DeleteClosedLostOppsBatchSchedulable();
string sch = '15 0 0 ? * * *';
system.schedule('Schedule From Apex', dcs, sch);