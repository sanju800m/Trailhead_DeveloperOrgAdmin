public class data {

    public void logAllAccounts() {
        List<Account> accounts = [SELECT Id, Name FROM Account];
        for (Account acc : accounts) {
            System.debug('Account: ' + acc);
        }
    }

    public void logAllContacts() {
        List<Contact> contacts = [SELECT Id, FirstName, LastName, AccountId FROM Contact];
        for (Contact con : contacts) {
            System.debug('Contact: ' + con);
        }
    }

    public void logAllOpportunities() {
        List<Opportunity> opportunities = [SELECT Id, Name, AccountId, StageName FROM Opportunity];
        for (Opportunity opp : opportunities) {
            System.debug('Opportunity: ' + opp);
        }
    }
}