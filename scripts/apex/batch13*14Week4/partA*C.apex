//Question 1: SOQL – Basic SELECT Queries
//1. Fetch Account Id, Contact First Name, Contact Last Name and Email Address for all the contacts present in your org.
SELECT AccountId, lastName, FirstName, Email FROM Contact

//2. Fetch all the accounts which have no Phone number populated and order them based on the Account Name in the ascending order.

SELECT Id, Name, Phone FROM Account WHERE Phone = null ORDER BY Name

//3. Find all contacts which have no account attached to them.
SELECT Id, Name FROM Contact WHERE AccountId = null

//4. Find out the count of all opportunities present in the Org.
SELECT Count() FROM Opportunity

//Question 3: SOQL – Medium
//1. Fetch all the opportunities which have stage as Closed Won and Amount more than or equal to 35000.

SELECT Id, Name, Amount FROM Opportunity WHERE StageName = 'Closed Won' and Amount >= 35000 

//2. Fetch all the contacts and their related Account Name, order them by the contact last name in descending order.

SELECT Id, Name, Account.Name FROM Contact ORDER BY LastName DESC

//3. Fetch all the Accounts along with their related Opportunities with status other than closed Lost

SELECT Id, Name, (SELECT Id, Name, Amount FROM Opportunities WHERE StageName != 'Closed Lost')  FROM Account

//4. Find the Top 10 opportunities based on Amount value.

SELECT Id, Name, Amount FROM Opportunity  WHERE Amount != null ORDER BY Amount DESC /*NULLS LAST*/ LIMIT 10

//5. Find lower 20 opportunities based on Amount value which are not set to Closed won and Closed Lost.

SELECT Id, Name, StageName, Amount FROM Opportunity WHERE StageName != 'Closed Won' and StageName != 'Closed Lost' and Amount != null ORDER BY Amount LIMIT 20





//3. Fetch all the Accounts along with their related Opportunities with status other than closed Lost
SELECT Id, Name, (SELECT Id, Name, Amount FROM Opportunities)  FROM Account



SELECT Id, Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Opportunity)

//contacları olmayan accountlar bu soql geliyor..
SELECT Id, name, (SELECT id, Name, accountId FROM contacts) FROM account WHERE id in (SELECT accountId FROM contact)