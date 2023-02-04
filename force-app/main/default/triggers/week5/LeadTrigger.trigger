trigger LeadTrigger on Lead (after insert) {
    //Week 5 Question 2.1 Solutions
    //Whenever Lead is created with LeadSource as Web then show "Rating should be Cold" message otherwise show "Rating should be hot"
    if(Trigger.isAfter){
        if (trigger.isInsert) {
            for(Lead ld : Trigger.New){
                if(ld.LeadSource == 'Web'){
                    System.debug('Rating should be Cold');
                } else {
                    System.debug('Rating should be hot');
                }
            }
        }
    }
}
    