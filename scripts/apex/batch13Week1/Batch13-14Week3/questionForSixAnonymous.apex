List<String> fruitsSet = new List<String>{'Orange', 'Banana', 'Apple','Mango'};
for(String fruit : fruitsSet){
    system.debug('fruit name :' + fruit);
}
Integer fruitsSetSize = fruitsSet.size();
system.debug('fruitsSetSize :' + fruitsSetSize);

fruitsSet.add('Apricot');
system.debug('new fruits Set :' + fruitsSet);

Boolean isApricotPresent = fruitsSet.contains('Apricot');
system.debug('isApricotPresent :' + isApricotPresent);

Boolean isListEmpty = fruitsSet.isEmpty();
system.debug('isListEmpty : '+ isListEmpty);