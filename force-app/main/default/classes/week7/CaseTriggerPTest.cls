@isTest
public with sharing class CaseTriggerPTest {
    @isTest
    private static void testMethod1() {
        List<case> createCases = new list<case>();
        //create 200 records
        for (Integer i = 0; i < 200; i++) {
            Case c = new case();
            c.Subject = 'Test Trigger';
            c.Priority = 'High';
            c.Description = 'Some description just to TEST Trigger';
            createCases.add(c);
        }
        //dml will fire trigger automatically
        insert createCases;
        
        //formality assert to check if records are successfully created.
        list<case> cases = [select id from case];
        system.assertEquals(200, cases.size());
    }
}
