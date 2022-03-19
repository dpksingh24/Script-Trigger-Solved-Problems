trigger ContactsCreationUsingMap on Account (after insert) {
	list<Contact> conList = new List<Contact>();
    map<Id, Decimal> accMap = new map<Id, Decimal>(); 
    
    for(Account acc: trigger.new) {
        accMap.put(acc.Id, acc.NumberOfEmployees);
    }
    system.debug('->' + accMap);
    
    if(accMap.size()>0 && accMap!=NULL) {
        for(Id accId : accMap.keySet()) {
            for(Integer i=0; i<accMap.get(accId); i++) {
                Contact newCon = new Contact();
                newCon.AccountId = accId;
                newCon.LastName = 'Contact 1: '+ i;
                conList.add(newCon);
            }
        }
    }
    if(conList.size()>0 && conList!=NULL) {
        insert conList;
        system.debug(conList);
    }
}
