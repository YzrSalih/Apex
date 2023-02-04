ListPractice lp = new ListPractice(); 
String lpMessage1 = lp.addPlanet(null, 3, 1); 
System.debug(lpMessage1); 
String lpMessage2 = lp.addPlanet('Earth', 3, 1); 
System.debug(lpMessage2); 
String lpMessage3 = lp.addPlanet('Mars', 2, 0); 
System.debug(lpMessage3); 
System.debug(ListPractice.planetsList); 