@isTest
private class UpsertJsonDataTest {
	public static String json = '[{'+
			'  \"Accounts\": ['+
			'    {'+
			'      \"AccountNumber\": \"ac2ac724-5eee-482f-8aeb-55c1ec23d71d\",'+
			'      \"AccountName\": \"Jabbertype\",'+
			'      \"AccountStatus\": \"Inactive\",'+
			'      \"AsOfDate\": \"9/27/2016\",'+
			'      \"Customers\": ['+
			'        {'+
			'          \"FirstName\": \"Nonnah\",'+
			'          \"LastName\": \"Drayton\",'+
			'          \"Email\": \"no\'neill0@diigo.com\",'+
			'          \"Phone\": \"375-(586)345-1801\",'+
			'          \"Address\": \"7956 Luster Terrace\",'+
			'          \"CustomerNumber\": \"0fc81d74-cad8-49e0-9567-9e8d0a612a7a\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Foster\",'+
			'          \"LastName\": \"Tackes\",'+
			'          \"Email\": \"fmeneo1@quantcast.com\",'+
			'          \"Phone\": \"30-(400)275-3547\",'+
			'          \"Address\": \"12074 Lakewood Gardens Alley\",'+
			'          \"CustomerNumber\": \"5cd44ecd-e310-4277-9328-4023b8fc6987\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Nicoli\",'+
			'          \"LastName\": \"Furmagier\",'+
			'          \"Email\": \"ncauson2@themeforest.net\",'+
			'          \"Phone\": \"970-(336)587-8052\",'+
			'          \"Address\": \"2 Huxley Point\",'+
			'          \"CustomerNumber\": \"9da711a3-2e87-48de-8774-0296526541d2\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Filberte\",'+
			'          \"LastName\": \"Teasdale-Markie\",'+
			'          \"Email\": \"fgowdy3@hibu.com\",'+
			'          \"Phone\": \"380-(747)331-9641\",'+
			'          \"Address\": \"2 Bluejay Crossing\",'+
			'          \"CustomerNumber\": \"5b1c778a-c7c0-4bbd-9a36-43d79283330d\"'+
			'        }'+
			'      ]'+
			'    },'+
			'    {'+
			'      \"AccountNumber\": \"a8c090d6-165e-424a-8e57-7fb57f69313c\",'+
			'      \"AccountName\": \"Wikizz\",'+
			'      \"AccountStatus\": \"Active\",'+
			'      \"AsOfDate\": \"10/3/2016\",'+
			'      \"Customers\": ['+
			'        {'+
			'          \"FirstName\": \"Nonnah\",'+
			'          \"LastName\": \"Swindells\",'+
			'          \"Email\": \"ngrinyakin0@spiegel.de\",'+
			'          \"Phone\": \"86-(178)738-2183\",'+
			'          \"Address\": \"4 Algoma Drive\",'+
			'          \"CustomerNumber\": \"128bf918-0d4a-4755-9e38-ab065ae3a9b4\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Jessika\",'+
			'          \"LastName\": \"Antonescu\",'+
			'          \"Email\": \"jwadlow1@mail.ru\",'+
			'          \"Phone\": \"351-(785)244-5709\",'+
			'          \"Address\": \"00 Maywood Parkway\",'+
			'          \"CustomerNumber\": \"d0269c28-42d6-4a1f-a605-fb22a6c598d5\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Odey\",'+
			'          \"LastName\": \"McElvogue\",'+
			'          \"Email\": \"obirchall2@dedecms.com\",'+
			'          \"Phone\": \"963-(970)720-2612\",'+
			'          \"Address\": \"23719 Petterle Place\",'+
			'          \"CustomerNumber\": \"99a12bc8-c162-4c75-afb1-022ebb1165c7\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Lee\",'+
			'          \"LastName\": \"Casillas\",'+
			'          \"Email\": \"lcoase3@cnbc.com\",'+
			'          \"Phone\": \"358-(576)398-2215\",'+
			'          \"Address\": \"28592 Blue Bill Park Center\",'+
			'          \"CustomerNumber\": \"d22cf9ac-b565-4687-8462-d14445bbbb1a\"'+
			'        }'+
			'      ]'+
			'    },'+
			'    {'+
			'      \"AccountNumber\": \"b8b17453-fefd-4755-a494-f810def3cd36\",'+
			'      \"AccountName\": \"Yadel\",'+
			'      \"AccountStatus\": \"Inactive\",'+
			'      \"AsOfDate\": \"9/17/2016\",'+
			'      \"Customers\": ['+
			'        {'+
			'          \"FirstName\": \"Sansone\",'+
			'          \"LastName\": \"Ducker\",'+
			'          \"Email\": \"sbirds0@tripadvisor.com\",'+
			'          \"Phone\": \"86-(771)935-2121\",'+
			'          \"Address\": \"72 Killdeer Street\",'+
			'          \"CustomerNumber\": \"8e09e740-32b4-4c7e-9fa7-ff463dab8d91\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Jeralee\",'+
			'          \"LastName\": \"McGirr\",'+
			'          \"Email\": \"jjerschke1@ow.ly\",'+
			'          \"Phone\": \"46-(560)441-1059\",'+
			'          \"Address\": \"24153 Weeping Birch Way\",'+
			'          \"CustomerNumber\": \"3122a79f-0e8c-4f2e-be85-9ce618f5b8de\"'+
			'        },'+
			'        {'+
			'          \"FirstName\": \"Esme\",'+
			'          \"LastName\": \"Fibbens\",'+
			'          \"Email\": \"edelacourt2@ucoz.ru\",'+
			'          \"Phone\": \"60-(549)189-1306\",'+
			'          \"Address\": \"897 Surrey Junction\",'+
			'          \"CustomerNumber\": \"d7196130-50b7-4ed7-96c9-b729e43ebb5e\"'+
			'        }'+
			'      ]'+
			'    }'+
			'  ]'+
			'}]';
	@isTest static void testparseDate() {
		// Implement test code
		String dateToTest = '11/23/2018';
		Test.startTest();
		Date dates = UpsertJsonData.parseDate(dateToTest);
		Test.stopTest();
		System.assertEquals(23, dates.day() , 'Date parsed successfully');
	}

	@isTest static void testCleanCustomers(){
		Financial_Advisor__c acct = new Financial_Advisor__c(Name = 'Account Test',
															 Account_Status__c = 'Active');
		insert acct;
		List<Customer__c> customers = new List<Customer__c>();
		for (Integer i=0; i<5; i++) {
			Customer__c c = new Customer__c(Name = 'Customer '+i,
											Financial_Advisor__c = acct.Id);
			customers.add(c);
		}insert customers;
		// create a list of customers id to check
		List<Id> customersId = new List<Id>();
		for (Customer__c checkCustomer : customers){
			customersId.add(checkCustomer.Id);
		}
		Test.startTest();
		UpsertJsonData.cleanCustomers(customersId);
		Test.stopTest();
		System.assertEquals(5,customersId.size(),'Customers Deleted');
	}

	@isTest static void testProcessAccounts(){
		//parse the json sample
		List<fromJSON> dataList = fromJSON.parse(json);
		List<UpsertJsonData.AccountWrapper> processData = new List<UpsertJsonData.AccountWrapper>();
		Test.startTest();
		for (fromJSON data : dataList){
		    processData.addAll(UpsertJsonData.processAccounts(data.Accounts));
		}
		Test.stopTest();
		System.assertNotEquals(0,dataList.size(),'Accounts Ready to insert');
	}
	
	@isTest static void testSynchronizeS3Accounts(){
		Test.startTest();
		UpsertJsonData.synchronizeS3Accounts(json);
		Test.stopTest();
		System.assertEquals(false, String.isEmpty(json), 'JSON upserted into salesforce');
	}
}