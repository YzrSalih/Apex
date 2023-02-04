public with sharing class MyCity {
    public string favouriteCafe;
    public string favouritePark;
    public string favouriteMall;
    public string favouriteStore;

    public string myFavouriteLocation(String currentCity){
        system.debug('The most beautiful cafe in my city: ' + favouriteCafe + ', most beautiful park: ' + favouritePark + 
                     ', most beautiful mall ' + favouriteMall + ', most beautiful store: ' + favouriteStore);
                    
        return currentCity;
    }
}