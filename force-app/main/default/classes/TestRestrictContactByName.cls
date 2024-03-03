@isTest
private class TestRestrictContactByName {

    @isTest static void testInvalidName() {
        // Create a test Contact with the invalid last name
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');

        // Initialize the SaveResult variable
        Database.SaveResult sr = null;

        // Try to insert the contact - expect an error
        try {
            sr = Database.insert(invalidContact);
            System.assert(false, 'No exception thrown. Expected an exception.');
        } catch (DmlException e) {
            // Verify that the error message is what we expect
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'));
        }

        // Assert that the insert failed and no record was created
        System.assert(sr == null || !sr.isSuccess()); 
    }

    @isTest static void testValidName() {
        // Create a test Contact with a valid last name
        Contact validContact = new Contact(LastName = 'Smith');

        // Try to insert the contact - expect no errors
        Database.SaveResult sr = Database.insert(validContact);

        // Assert that the insert was successful
        System.assert(sr != null && sr.isSuccess()); 
    }
}
