public class DeleteClosedLostOppsBatch Implements Database.Batchable<SObject>, Database.Stateful {
    public Integer count=0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Database.QueryLocator q1 = database.getQueryLocator([select Id, OwnerId, CloseDate from Opportunity 
        Where StageName = 'Closed Lost']);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        if(scope.size()>0){
            Delete scope;
            count = count + scope.size();
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Total Number of Opportunities deleted:   '+count);
    }
}
