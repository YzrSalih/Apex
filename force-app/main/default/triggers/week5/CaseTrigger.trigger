trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    //Week 5 Question 1.1 Solution
    System.debug('--------------- START ---------------');
    System.debug('We are in the triggers');
    if(trigger.isBefore){
        //This block will run only for BEFORE triggers
        System.debug('We are in the BEFORE triggers');
        if(trigger.isInsert){
            //This block will run only for INSERT operation
            System.debug('We are in the BEFORE INSERT triggers');

            //Week 5 Question 3 Solution
            /*Whenever a case is created with origin as email then set status as new and Priority as Medium*/
            CaseTriggerHandler.setCaseStatusAndPriority(trigger.New);  
        }
        if(trigger.isUpdate){
            //This block will run only for UPDATE operation
            System.debug('We are in the BEFORE UPDATE triggers');
            
            // Week 5 Question 1.2 Solution
             for(Case c : Trigger.new){
               System.debug('Case# '+ c.CaseNumber + 'with Id = '+c.Id+' was created on '+c.CreatedDate);
            // }

            // Week 5 Question 2.3 Solution
            //Show the message as 'Case origin is changed for [Case Number]' whenever case origin field value is changed.
            Map<Id, case> caseOldRecsMap = Trigger.oldMap;
             for(Case c : Trigger.new){
              if (caseOldRecsMap.get(c.Id).Origin != c.Origin) {
                  System.debug('Case origin is changed for ' + c.CaseNumber);
                 }
             }
        }
    }
    if(trigger.isAfter){
        //This block will run only for AFTER triggers
        System.debug('We are in the AFTER triggers');
        if(trigger.isInsert){
            //This block will run only for INSERT operation
            System.debug('We are in the AFTER INSERT triggers');
        }
        if(trigger.isUpdate){
            //This block will run only for UPDATE operation
            System.debug('We are in the AFTER UPDATE triggers');
        }
        //Week 5 Question 1.2 Solution
        //Iterate over each case record and get the field values for printing
        for(Case c : Trigger.new){
          System.debug('Case# '+ c.CaseNumber + 'with Id = '+c.Id+' was created on '+c.CreatedDate);
        }
    }
    System.debug('--------------- END ---------------');
 }
}