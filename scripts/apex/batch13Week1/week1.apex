//Assignment 2
System.debug('Welcome to Developer practice week 1, again');

//Assignment 3
Team t = new Team();
t.teamDescription();

//Assignment 4
player p = new player();
p.playing();

//Assignment 5
PlayingWithDates demo = new PlayingWithDates();
demo.printDateOutput();

//weekend meeting
Salesforce sf = new Salesforce();
sf.companyName = 'Salesforce';
sf.headQuarters = 'San francisco, California';
sf.CEO = 'Marc Benioff';

Integer lenght = sf.companyName.length();
system.debug('Lenght of the Company Name: ' + lenght);

String upperCase = sf.companyName.toUpperCase();
system.debug('Upper Case is the Company Name: ' + upperCase);

String lowerCase = sf.companyName.toLowerCase();
system.debug('Lower Case is the Company Name: ' + lowerCase);

String subString = sf.companyName.substring(0, 4);
system.debug('Substring is the Company Name: ' + subString);

Integer indexOf = sf.companyName.indexOf('force');
system.debug('Index of the force Company : ' + indexOf);

String replacedString = sf.companyName.replace('force','dynamic');
system.debug('Replaced companyName : ' + replacedString);

String trimmedString = sf.companyName.trim();
system.debug('Trimmed companyName : ' + trimmedString);


system.debug('Company Name: ' + sf.companyName);
system.debug('Head Quarters: ' + sf.headQuarters);
system.debug('CEO: ' + sf.CEO);
