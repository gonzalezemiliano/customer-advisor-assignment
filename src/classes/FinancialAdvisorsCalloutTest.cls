@isTest
private class FinancialAdvisorsCalloutTest {

    @isTest static void testGetRequestCallout() {
        // Associate the callout with a mock response
        test.startTest();
        // Call method to test
            Test.setMock(HttpCalloutMock.class, new FinancialAdvisorCalloutMock());
            HttpResponse result = FinancialAdvisorsCallout.getRequestCallout();
        test.stopTest();
        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
        // Verify status code
        System.assertEquals(200,result.getStatusCode(),
          'The status code is OK.');
    }
}