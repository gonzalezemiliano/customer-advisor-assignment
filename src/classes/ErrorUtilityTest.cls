@isTest
private class ErrorUtilityTest {
	
	@isTest static void testErrorSendEmail() {
		// create fake log
		String logMail = 'Error: Exception pepe \nSent to: maracutanga@gmail.com \nMessage: Hello World';
		Log__c saveMail = new Log__c(Log_Mail__c = logMail);
		insert saveMail;
		String address = 'maracutanga@gmail.com';
		String subject = 'Exception pepe';
		String message = 'Hello World';
		Test.startTest();
		ErrorUtility.errorSendEmail(address,subject,message);
		Integer invocations = Limits.getEmailInvocations();
		Test.stopTest();
		System.assertEquals(1, invocations, 'An email has not been sent');
	}
	
}