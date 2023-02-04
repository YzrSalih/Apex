Map<String,Integer> StudentRankMap = new Map<String,Integer>();
StudentRankMap.put('Salih', 1);
StudentRankMap.put('Samet', 2);
StudentRankMap.put('Emre', 3);
StudentRankMap.put('Sefa', 4);
for(String student : StudentRankMap.keySet()){
    system.debug('Student Name :' + student);
}
for(String student : StudentRankMap.keySet()){
    system.debug('Student Name: ' + student + ' and Rank ' + StudentRankMap.get(student));
}
