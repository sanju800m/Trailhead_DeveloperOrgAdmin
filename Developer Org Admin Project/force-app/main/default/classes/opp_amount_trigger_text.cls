@isTest
private class opp_amount_trigger_text {
    @testSetup
    static void setup() {
        // Create test data
        Account acc = new Account(Name = 'Test Account');
        insert acc;
    }

    @isTest
    static void testHighBudgetOpportunityTrigger() {
        Account acc = [SELECT Id FROM Account LIMIT 1];

        Opportunity opp = new Opportunity(
            Name = 'High Budget Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addMonths(1),
            Amount = 150000,
            AccountId = acc.Id
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        // Verify that the email was sent
        List<Messaging.SingleEmailMessage> sentEmails = [SELECT Id, Subject, ToAddress FROM Messaging.SingleEmailMessage];
        System.assertEquals(1, sentEmails.size(), 'One email should have been sent');
        System.assertEquals('High Budget Opportunity', sentEmails[0].Subject, 'Email subject should match');
    }
}