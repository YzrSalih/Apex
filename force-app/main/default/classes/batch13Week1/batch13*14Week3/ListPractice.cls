public with sharing class ListPractice { 
    public static List<Planets> planetsList = new List<Planets>(); 
    public String addPlanet(String planetName, Integer planetNumber, Integer numberOfMoons){ 
        String returnMessage; 
        if(planetName != null && planetName != ''){ 
            Planets p = new Planets(); 
            p.name = planetName; 
            p.planetNumber = planetNumber; 
            p.numberOfMoons = numberOfMoons; 
            planetsList.add(p); 
            returnMessage = 'Planet added successfully'; 
        } else { 
            returnMessage = 'Planet without name can not be added to the list';      
        } 
            return returnMessage; 
        } 
    }   