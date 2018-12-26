public class UpsertJsonData {

    public class AccountWrapper {
        Financial_Advisor__c financialAdvisor;
        List<Customer__c> customerList;
    }

    public static void upsertJson() {
        synchronizeS3Accounts(FinancialAdvisorsCallout.getRequestCallout().getBody());
    }

    public static void synchronizeS3Accounts(String json) {
        // parse the json
        List<fromJSON> dataList = fromJSON.parse(json);
        // iterate over the list fromjson
        List<AccountWrapper> processData = new List<AccountWrapper>();

        for (fromJSON data : dataList) {
            processData.addAll(processAccounts(data.Accounts));
        }

        List<Financial_Advisor__c> acctsToUpsert = new List<Financial_Advisor__c>();

        for (AccountWrapper acctToProcess : processData) {
            acctsToUpsert.add(acctToProcess.financialAdvisor);
        }

        // is not updating, just insert duplicates
        try {
            Schema.SObjectField f = Financial_Advisor__c.Fields.Account_Number__c;
            Database.UpsertResult [] cr = Database.upsert(acctsToUpsert , f, false);
        } catch (DmlException e) {
            System.debug('Something just happened:\n'+ e.getMessage());
            ErrorUtility.errorSendEmail('emiliano.gonzalez@modelit.xyz','Account upsert failed',e.getMessage());
        }

        List<Customer__c> custsToUpsert = new List<Customer__c>();

        for (AccountWrapper acctToProcess : processData) {

            for (Customer__c custToProcess : acctToProcess.customerList) {
                custToProcess.Financial_Advisor__c = acctToProcess.financialAdvisor.Id;
                custsToUpsert.add(custToProcess);
            }
        }

        try {
            upsert custsToUpsert;
        } catch (DmlException e) {
            System.debug('Something just happened:\n'+ e.getMessage());
            ErrorUtility.errorSendEmail('emiliano.gonzalez@modelit.xyz','Customer upsert failed',e.getMessage());
        }

        // create a list of customers id to check if there exist in the json file
        List<Id> customersId = new List<Id>();

        for (Customer__c checkCustomer : custsToUpsert){
            customersId.add(checkCustomer.Id);
        }

        // call the method to erase customers
        cleanCustomers(customersId);
    }

    public static List<AccountWrapper> processAccounts(List<fromJSON.Accounts> accountLists) {
        List<AccountWrapper> response = new List<AccountWrapper>();

        // iterate over the list of Accounts
        for (fromJSON.Accounts acct : accountLists) {

            // only accounts with status active
            if (acct.AccountStatus == 'Active') {
                AccountWrapper currentAccount = new AccountWrapper();
                Financial_Advisor__c acctObj = new Financial_Advisor__c();
                acctObj.Name = acct.AccountName;
                acctObj.Account_Number__c = acct.AccountNumber;
                acctObj.Account_Status__c = acct.AccountStatus;
                acctObj.As_of_Date__c = parseDate(acct.AsOfDate);
                currentAccount.financialAdvisor = acctObj;
                currentAccount.customerList  = new List<Customer__c>();

                for (fromJSON.Customers cust : acct.Customers){
                    Customer__c custObj = new Customer__c();
                    custObj.First_Name__c = cust.FirstName;
                    custObj.Last_Name__c = cust.LastName;
                    custObj.Email__c = cust.Email;
                    custObj.Phone__c = cust.Phone;
                    custObj.Address__c = cust.Address;
                    custObj.Customer_Number__c = cust.CustomerNumber;
                    custObj.Customer_Account_Name__c = acct.AccountNumber + cust.CustomerNumber;
                    currentAccount.customerList.add(custObj);
                }

                response.add(currentAccount);
            }
        }
        return response;
    }

    public static void cleanCustomers(List<Id> idList){

        try {
            List<Customer__c> custsInSalesforce = [SELECT Id, Name FROM Customer__c WHERE Id NOT IN :idList];
            delete custsInSalesforce;
        } catch (DmlException e) {
            System.debug('Something bad happened:\n' + e.getMessage());
            ErrorUtility.errorSendEmail('emiliano.gonzalez@modelit.xyz','Customer Deletion failed',e.getMessage());
        }
    }

    public static Date parseDate(String dateAccount) {
        List<String> parts = dateAccount.split('/');
        Integer month = integer.valueOf(parts[0]);
        Integer day = integer.valueOf(parts[1]);
        Integer year = integer.valueOf(parts[2]);
        return date.newInstance(year,month,day);
    }
}