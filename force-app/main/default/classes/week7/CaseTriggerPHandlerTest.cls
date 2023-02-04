@isTest
public with sharing class CaseTriggerPHandlerTest {
    @isTest
    private static void testNOPassword() {
        //Prepare data which fires Handler WITHOUT PASSWORD in description
        List<case> createCases = new list<case>();
        for (Integer i = 0; i < 200; i++) {
            Case c = new case();
            c.Subject = 'Test TriggerHandler';
            c.Priority = 'High';
            c.Description = 'Some description just to TEST TriggerHandler';
            createCases.add(c);
        }
        //dml will fire trigger automatically
        insert createCases;
        
        // assert to check if records are successfully created and 
        //NO child records are created.
        list<case> cases = [select id from case];
        system.assertEquals(200, cases.size());
    }
    @isTest
    private static void testYesPassword() {
        //Prepare data which fires Handler with PASSWORD in description
        List<case> createCases = new list<case>();
        //create 200 records
        for (Integer i = 0; i < 200; i++) {
            Case c = new case();
            c.Subject = 'Test TriggerHandler';
            c.Priority = 'High';
            c.Description = 'Some description with Password ';
            createCases.add(c);
        }
        //dml will fire triggerHandler automatically
        //all conditions will be true, and it should create 200 child cases
        insert createCases;
        
        // assert to check if records are successfully created.
        //and child records are also created.
        list<case> cases = [select id from case];
        system.assertEquals(400, cases.size()); //400 records should be created.
    }
}