//create a Map named as StudentRankMap, Key as Student name and Value as Rank.
Map<String, Integer> StudentRankMap = new Map<String, Integer>();

//Decide the data type for key and value.
// KEY - String
// VALUE - INTEGER

//Store 4 students name and their ranks.
StudentRankMap.put('Tommy', 1);
StudentRankMap.put('Arthur', 2);
StudentRankMap.put('John', 3);
StudentRankMap.put('Polly', 4);

//Print all the students name one by one.
for(String student : StudentRankMap.keySet()){
    System.debug('Student Name :'+ student);
}
//Print all the student's name and rank one by one in the following format. Student Name: ??????? and Rank: ????
for(String student : StudentRankMap.keySet()){
    System.debug('Student Name :'+ student + ' and Rank : '+StudentRankMap.get(student));
}