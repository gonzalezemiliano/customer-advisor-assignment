public class fromJSON {

    public List<Accounts> Accounts;

    public class Customers {
        public String FirstName;
        public String LastName;
        public String Email;
        public String Phone;
        public String Address;
        public String CustomerNumber;
    }

    public class Accounts {
        public String AccountNumber;
        public String AccountName;
        public String AccountStatus;
        public String AsOfDate;
        public List<Customers> Customers;
    }
    public static List<fromJSON> parse(String json) {
        return (List<fromJSON>) System.JSON.deserialize(json, List<fromJSON>.class);
    }

}