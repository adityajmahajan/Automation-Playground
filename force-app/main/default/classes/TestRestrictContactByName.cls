@isTest
private class TestRestrictContactByName {
    @isTest 
    static void testInvalidName() {
        Test.startTest();
        List<Contact> testInvalidConList = new List<Contact>();
        for(Integer i=0;i<99;i++){
            Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
            testInvalidConList.add(invalidContact);
        }
        Database.SaveResult[] invalidResults =  Database.insert(testInvalidConList, false);
        Test.stopTest();
        System.assert(!invalidResults[0].isSuccess());
    }

    @isTest 
    static void testValidName() {
        Test.startTest();
        List<Contact> testValidConList = new List<Contact>();
        for(Integer i=100;i<200;i++){
            Contact validContact = new Contact(LastName = 'Mahajan');
            testValidConList.add(validContact);
        }
        Database.SaveResult[] validResults = Database.insert(testValidConList, false);
        Test.stopTest();
        System.assert(validResults[0].isSuccess());
    }
}
