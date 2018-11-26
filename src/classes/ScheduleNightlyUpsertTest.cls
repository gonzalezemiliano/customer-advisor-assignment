@isTest
private class ScheduleNightlyUpsertTest {
    // Dummy CRON expression: midnight on March 15.
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    @isTest static void testScheduleDaily2AM() {

    	Test.startTest();
            Test.setMock(HttpCalloutMock.class, new FinancialAdvisorCalloutMock());
    	    String jobId = ScheduleNightlyUpsert.scheduleDaily2AM();
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime 
                              FROM CronTrigger WHERE id = :jobId];  
    	Test.stopTest();
        System.assertEquals(0, ct.TimesTriggered); 
        System.assertNotEquals('2022-03-15 00:00:00', String.valueOf(ct.NextFireTime));
    }    
}