public with sharing class IntegrationWorkingSession1 {

    public static HttpResponse getCovidCasesInfo(){
        //1. Prepare HttpRequest and wrap data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');
        //2. Prepare Internet
        Http http = new Http();
        //3. Send the request over the internet to recieve responce 
        HttpResponse response = http.send(request);
        //4. process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            List<CovidWrapper> wrappers = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
            CovidWrapper wrapper = wrappers[0];

            //Check for existing records of today
            List<Covid_info__c> infos = [SELECT Id, Name, Positive__c, Negative__c, Pending__c FROM Covid_info__c WHERE Recieved_Date__c = TODAY];
            if(!infos.isEmpty()){
                infos[0].Name = String.valueOf(wrapper.states);
                infos[0].Positive__c = wrapper.positive;
                infos[0].Negative__c = wrapper.negative;
                infos[0].Pending__c = wrapper.pending;
                update infos[0];
            }else {
                Covid_info__c info = new Covid_info__c();
                info.Name = String.valueOf(wrapper.states);
                info.Positive__c = wrapper.positive;
                info.Negative__c = wrapper.negative;
                info.Pending__c = wrapper.pending;
                info.Recieved_Date__c = Date.today();
                insert info;
            }

        }
        return response;
    }
    public static HttpResponse postThePost(){
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        Posts__c post = [SELECT id,name,body__c,title__c,user_id__c FROM Posts__c WHERE createdDate = TODAY LIMIT 1];

            PostWrapper wrapper =new PostWrapper();
            wrapper.user_id = integer.valueOf(post.user_id__c);
            wrapper.title = post.title__c;
            wrapper.body = post.body__c;

            string jsonString = Json.serialize(wrapper);
            system.debug(jsonString);
            request.setBody(jsonString);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('Authorization', 'Bearer 70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29');
            
    //2. Prepare internet
        Http http = new Http();

    //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);
        System.debug(response);
        System.debug(response.getBody());

     //4 Process the response

     if(response.getStatusCode()==201){
        system.debug('Record have been created successfully! ' + response.getBody() );

     }else{
        System.debug('An error occurred while inserting');
     }
     return response; 
    }
}