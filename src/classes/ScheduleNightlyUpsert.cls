global class ScheduleNightlyUpsert implements Schedulable {

	@future (callout=true)
	public static void callUpsertData(){
		UpsertJsonData.upsertJson();
	}

    public static void execute(SchedulableContext sc) {
		callUpsertData();
		
	}
	public static String schNightly = '0 0 02 * * ?	';  //Every Day, 2AM
	public static String scheduleDaily2AM() {
    	ScheduleNightlyUpsert SC = new ScheduleNightlyUpsert(); 
    	return System.Schedule('ScheduleNightlyUpsert - Daily 2AM', schNightly, SC);
    }
}