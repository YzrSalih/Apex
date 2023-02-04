//TEST COVID CALLOUT//
HttpResponse resp = IntegrationWorkingSession1.getCovidCasesInfo();
system.debug(resp);
//POST CALLOUT
HttpResponse resp2 = IntegrationWorkingSession1.postThePosts();
system.debug(resp2);