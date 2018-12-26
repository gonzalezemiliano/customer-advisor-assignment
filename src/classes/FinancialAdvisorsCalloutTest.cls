@isTest
private class FinancialAdvisorsCalloutTest {

    @isTest static void testGetRequestCallout() {
        // Associate the callout with a mock response
        Test.startTest();
        // Call method to test
        Test.setMock(HttpCalloutMock.class, new FinancialAdvisorCalloutMock());
        HttpResponse result = FinancialAdvisorsCallout.getRequestCallout();
        Test.stopTest();
        // Verify mock response is not null
        System.assertNotEquals(null, result, 'The callout returned a null response.');
        // Verify status code
        System.assertEquals(200, result.getStatusCode(), 'The status code is OK.');
    }
}