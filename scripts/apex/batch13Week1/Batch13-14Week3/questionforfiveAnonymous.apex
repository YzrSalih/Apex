List<String> colourList = new List<String>();
colourList.add('Red');
colourList.add('Blue');
colourList.add('Purple');
colourList.add('Pink');
colourList.add('Black');
system.debug('Colour List : ' + colourList);

Integer size = colourList.size();
system.debug('Colour List Size :' + colourList.size());
system.debug('Colour List Size :' + size);

Boolean containsRed = colourList.contains('Red');
system.debug('containsRed :'+ colourList.contains('Red'));

String lastElement = colourList.get(size-1);
String lastElementUpperCase = lastElement.toUpperCase();
system.debug('lastElementInUpperCase ' +lastElementUpperCase);

colourList[4] = colourList[4].toUpperCase();
system.debug('colourList :'+colourList);

List<String> colourCodesList = new List<String>{'FF006', 'FF003', 'FF0934','AA7340'};
system.debug('colourCodesList :' + colourCodesList);

Boolean areTwoListEqualOrNot = colourList.equals(colourCodesList);
system.debug('areTwoListEqualOrNot :' + areTwoListEqualOrNot);

List<String> mergedList = new List<String>();
mergedList.addAll(colourList);
mergedList.addAll(colourCodesList);
system.debug('merged List :' + mergedList);