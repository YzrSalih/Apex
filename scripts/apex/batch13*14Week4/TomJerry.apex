 //Assignment week 4 Part E
    //Solution 1
    Set<String> uniqueNameSet = new Set<String>{'Tom', 'Jerry'};
    System.debug('uniqueNameSet   '+uniqueNameSet);
    //Solution 2
    Integer size = uniqueNameSet.size();
    System.debug('uniqueNameSet size  '+uniqueNameSet.size());
    //Solution 3
    uniqueNameSet.add('Brutus');
    uniqueNameSet.add('Bob');
    uniqueNameSet.add('Brutus');
    uniqueNameSet.add('Olive');
    uniqueNameSet.add('Olive');
    System.debug('uniqueNameSet   '+uniqueNameSet);
    //Solution 4
    String myName = 'Sumit';
    Boolean doesContainMyName = uniqueNameSet.contains(myName);
    System.debug('Does uniqueNameSet contains my name?'+uniqueNameSet.contains(myName));
    //Solution 5
    Boolean isUniqueNameSetEmpty = uniqueNameSet.isEmpty();
    System.debug('Is uniqueNameSet Empty  '+isUniqueNameSetEmpty);
    //Solution 6
    uniqueNameSet.clear();
    System.debug('Cleared uniqueNameSet Empty  '+uniqueNameSet);
    //Solution 7
    isUniqueNameSetEmpty = uniqueNameSet.isEmpty();
    System.debug('Is uniqueNameSet Empty after clear operation'+isUniqueNameSetEmpty);
