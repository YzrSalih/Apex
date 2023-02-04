Students stdns = new Students();
stdns.firstName = 'Salih';
stdns.lastName = 'Yazar';
stdns.classYear = 2020;
stdns.major = 'IT';
string reportReturn = stdns.generateReport();
system.debug('report returned --> ' + reportReturn);



Students stdns2 = new Students();
stdns2.firstName = 'Samet';
stdns2.lastName = 'Yazar';
stdns2.classYear = 2018;
stdns2.major = 'IT';
stdns2.generateReport();
string reportReturn2 = stdns2.generateReport();
system.debug('report Returned2 --> ' + reportReturn2);
