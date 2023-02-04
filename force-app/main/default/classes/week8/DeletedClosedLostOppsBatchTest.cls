@istest
public with sharing class DeleteClosedLostOppsBatchTest {
    @TestSetup
    static void makeData(){
        List<Opportunity> listOpp = new List<Opportunity>();
        for(integer i = 0 ; i< 200 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp' + i;
            opp.CloseDate = Date.today();
            opp.StageName = 'Closed Lost';
            listOpp.add(opp);
        }
        insert listOpp;
    }
    @istest
    public static void testMethodBatch() {

        Test.starttest();
        DeleteClosedLostOppsBatch dcl = new DeleteClosedLostOppsBatch();
        Database.executeBatch(dcl, 200);
        Test.stopTest();


        List<Opportunity> listCheckOpp = [SELECT id FROM Opportunity];
        System.assertEquals(0, listCheckOpp.size());
    }

    @istest
    public static void testMethodSchedule() {

        Test.starttest();
        DeleteClosedLostOppsBatchSchedulable dcs = new DeleteClosedLostOppsBatchSchedulable();
        string sch = '0 0 15 1/1 * ? *';
        System.schedule('Schedule From Apex', sch, dcs);
        Test.stopTest();
    }
}
