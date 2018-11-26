public class FinancialAdvisorsCallout {
        
	public static HttpResponse getRequestCallout() {
        		
        	String formattedDateString = DateTime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
                String bucketname = 'sfdc-training';
                String host = 's3.amazonaws.com';
                String fileName = 'FinancialAdvisors.json';
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://' + bucketname + '.' + host + '/' + filename);
                req.setHeader('Host', bucketname + '.' + host);
                req.setHeader('Connection', 'keep-alive');
                req.setHeader('Date', formattedDateString);
                req.setHeader('ACL', 'public-read-write');
                
                s3Credentials__c credentials = s3Credentials__c.getInstance();
                String key = 'KEY';
                String secret = 'SECRET';
                if (!Test.isRunningTest()) {
                   key =  credentials.key__c;
                   secret =  credentials.secret__c;
                }

                String stringToSign = 'GET\n\n' + '\n' + formattedDateString + '\n/' + bucketname + '/' + filename;
                 
                Blob mac = Crypto.generateMac('HMACSHA1', blob.valueOf(stringToSign), blob.valueof(secret));
                String signed = EncodingUtil.base64Encode(mac);
                String authHeader = 'AWS' + ' ' + key + ':' + signed;
                
                req.setHeader('Authorization', authHeader);
                Http http = new Http();
                HTTPResponse resp;
                resp = http.send(req);
                
        return resp;
	}
}