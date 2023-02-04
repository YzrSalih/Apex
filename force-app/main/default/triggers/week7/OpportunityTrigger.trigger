trigger OpportunityTrigger on Opportunity ( after update, after insert, after delete, after undelete) {
    //Assignment QUESTION WEEK - 7  Question 2
    Set<Id> accIdsSet = new Set<Id>();

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete){
            //Collect all AccountIds from the related opportunites for which Amount field is not null
            for(Opportunity opp : Trigger.New){
                if(opp.AccountId != null){
                    accIdsSet.add(opp.AccountId);
                }
            }
        }

        if(Trigger.isDelete){ // Parent silindikten sonra Parent'ın Id'si üzerinden kullanım yapıldığından After Delete'de çalışır.
            for(Opportunity opp : Trigger.Old){
                System.debug(opp.AccountId);
                accIdsSet.add(opp.AccountId);
            }
        }

        if(Trigger.isUpdate){
            for(Opportunity opp : Trigger.New){
                //Collect all AccountIds from the related opportunites for which Amount field is not null
                Opportunity oppOld = Trigger.oldMap.get(Opp.Id);

                if(opp.Amount != oppOld.Amount ||
                   opp.AccountId != oppOld.AccountId ||
                   opp.StageName != oppOld.StageName){
                    accIdsSet.add(opp.AccountId);
                    accIdsSet.add(oppOld.AccountId); //Adding Old AccountId
                }
            }
        }
    }
    if(!accIdsSet.isEmpty()){
        OpportunityTriggerHandler.updateHighestAmountOppName(accIdsSet);
        OpportunityTriggerHandler.updateTotalAmountGenerated(accIdsSet);
        OpportunityTriggerHandler.updateTargetAmountAchievedOppName(accIdsSet);
    }

}
