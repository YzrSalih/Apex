List<Account> accList = new List<Account>();
accList = AccConAndOppOperations.fetchAllAccounts();
system.debug(accList);

List<Opportunity> oppList = new List<Opportunity>();
oppList = AccConAndOppOperations.fetchOpps('Web','Closed Won');
system.debug(oppList);

AccConAndOppOperations.fetchAccountsWithOpps('Customer - Direct', 'Negotiation/Review');

Account acc = AccConAndOppOperations.createAccount(null, 150000, 'Customer - Direct');
system.debug(acc);