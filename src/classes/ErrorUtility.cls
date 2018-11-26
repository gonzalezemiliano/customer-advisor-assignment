public class ErrorUtility {

	public static void errorSendEmail(String address, String subject, String message) {

		// Save Log record in a custom object
		String logMail = 'Error: ' + subject + '\nSent to: ' + address + '\nMessage: ' + message;
		Log__c saveMail = new Log__c(Log_Mail__c = logMail);
		insert saveMail;

		Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    	string [] toaddress = new string[]{address};
       
    	//Avoid to hit the max number of emails
    	email.saveAsActivity = false;
    	email.setToAddresses(toaddress);    
    	email.setSubject(subject);
    	email.setPlainTextBody(message);

    	Messaging.sendEmail( new Messaging.SingleEmailMessage[] { email } );
	}
}