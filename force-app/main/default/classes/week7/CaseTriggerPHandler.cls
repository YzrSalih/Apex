public class CaseTriggerPHandler {

    //create child case if description contains 'password'.
    public static void createChildCase(List<Case> caseTriggerNew, Map<Id, Case> caseTriggerNewMap) {
        //store keyword to check in one variable
        string checkKeyword = 'password';
        //store case id in set for which we want to create child cases
        Set<id> caseIDs = new set<id>();    

        for (case eachCAse : caseTriggerNew) {
            //check if description field contains keyword (ignoring case)
            if (eachCase.Description != null && eachCase.Description.containsIgnoreCase(checkkeyword)) {
                caseIDs.add(eachCAse.Id);
            }
        }
        //check if set has any elements
        if(!caseIDs.isEmpty()){
            List<case> createCases = new list<case>();
            for (ID eachID : caseIds) {
                Case c = new case();
                c.Subject = 'Parent case may contain secret info, do something NOW';
                c.ParentId = eachID;
                c.Priority = 'High';
                c.Description = 'Secret info not allowed in case';
                createCases.add(c);
            }
            insert createCases; //to find in org, search in salesforce 'Parent case may contain secret info, do something NOW'
            system.debug('created cases -> ' + createCases);
        }
        
    }
}