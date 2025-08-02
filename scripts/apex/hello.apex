// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Alicia';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


		// Create HTTP request to send.
		HttpRequest request = new HttpRequest();
		// Set the endpoint URL. Use direct URL or for best practices use Named Credential.
		request.setEndpoint('https://dummyjson.com/users/' + 22);
		// Set the HTTP method to GET.
		request.setMethod('GET');
		request.setTimeout(120000);
		// Send the HTTP request and get the response.
		Http http = new Http();
		HttpResponse response = Http.send(request);
		// If the HTTP response code is successful, parse the JSON response and update the contact.
        System.debug('This is the status: ' + response.getStatusCode() + ' ' + response.getStatus());
        System.debug('This is the data: ' + response.getBody());
		
    Contact contactRecord = new Contact();

        String contactId = '003aj00000S7ZvQAAV';
		if (contactRecord == null) {
            throw new AuraHandledException('Contact with ID ' + contactId + ' not found.');
        }

        contactRecord.Id = contactId;
		// Create a map of the field values.
		Map <String, Object> contactPayloadMap = new Map <String, Object>();
		contactPayloadMap.put('id', contactRecord.Id);
        contactPayloadMap.put('firstName', contactRecord.FirstName != null ? contactRecord.FirstName : 'Unknown');
        contactPayloadMap.put('lastName', contactRecord.LastName != null ? contactRecord.LastName : 'Unknown');
        contactPayloadMap.put('email', contactRecord.Email != null ? contactRecord.Email : 'unknown@example.com');
        contactPayloadMap.put('phone', contactRecord.Phone != null ? contactRecord.Phone : 'N/A');

		// Serialize the map into a JSON string.
        String contactPayloadJSON = JSON.serialize(contactPayloadMap);
		System.debug('Generated payload: ' + contactPayloadJSON);

	Contact con = DummyJSONCallout