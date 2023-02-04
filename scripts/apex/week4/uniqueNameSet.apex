Set<String> uniqueNameSet = new Set<String>{'Tom', 'Jerry'};
system.debug('uniqueNameSet'+uniqueNameSet);

Integer size = uniqueNameSet.size();
system.debug('uniqueNameSet size :' + size);

uniqueNameSet.add('Garfield');
uniqueNameSet.add('Micky Mouse');
uniqueNameSet.add('Sonic');
uniqueNameSet.add('Pink Phanter');
system.debug('uniqueNameSet :' + uniqueNameSet);

String myName = 'Bugs Bunny';
Boolean DoesContainMyName = uniqueNameSet.contains(myName);
system.debug('Does uniqueNameSet contains my name? ' + uniqueNameSet.contains(myName));

Boolean isUniqueNameSetEmpty = uniqueNameSet.isEmpty();
system.debug(isUniqueNameSetEmpty);

uniqueNameSet.clear();
system.debug('Cleared uniqueNameSet Empty :' + uniqueNameSet);

isUniqueNameSetEmpty = uniqueNameSet.isEmpty();
system.debug('Is uniqueNameSet Empty after clear operation :    '+isUniqueNameSetEmpty);




