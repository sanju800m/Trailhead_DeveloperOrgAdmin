trigger opp_amount_trigger on Opportunity (after insert, after update) {
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for (Opportunity opp : Trigger.new) {
        if (opp.Amount > 100000) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] { 'sanju800m@gmail.com' }); 
            email.setSubject('High Budget Opportunity');
            email.setPlainTextBody('This is a highbudget opp');
            emails.add(email);
        }
    }

    if (!emails.isEmpty()) {
        Messaging.sendEmail(emails);
    }
}