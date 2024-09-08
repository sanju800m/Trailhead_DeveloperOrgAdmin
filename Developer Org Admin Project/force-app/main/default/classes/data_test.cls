@isTest
private class data_test {
    @testSetup
    static void setup() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contact con = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = acc.Id);
        insert con;
        Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Prospecting', CloseDate = Date.today(), AccountId = acc.Id);
        insert opp;
    }

    @isTest
    static void testLogAllAccounts() {
        data service = new data();
        Test.startTest();
        service.logAllAccounts();
        Test.stopTest();
    }

    @isTest
    static void testLogAllContacts() {
        data service = new data();
        Test.startTest();
        service.logAllContacts();
        Test.stopTest();
    }

    @isTest
    static void testLogAllOpportunities() {
        data service = new data();
        Test.startTest();
        service.logAllOpportunities();
        Test.stopTest();
    }
}