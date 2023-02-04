@istest
public with sharing class CreateCaseQueueableTest {
    @istest
    public static void testMethod1() {
        CreateCaseQueueable cc = new CreateCaseQueueable();
        Test.startTest();
        Id jobId = System.enqueueJob(cc);   
        System.debug(jobId);
        Test.stopTest();
    }
}
