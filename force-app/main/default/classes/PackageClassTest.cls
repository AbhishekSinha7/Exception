@isTest
public class PackageClassTest {

   @isTest
	private static void testMain() {
        Test.startTest();
        PackageClass.main();
        Test.stopTest();
    }

    @isTest
	private static void testaddTwoNumbers() {
        Integer result;
        Test.startTest();
        result = PackageClass.addTwoNumbers(2,2);
        Test.stopTest();
        Assert.areEqual(4,result, 'Additon is not correct');
    }

    @isTest
	private static void testaddTwoNumbersWithExceptionHandling() {
        Integer result;
        Test.startTest();
        result = PackageClass.addTwoNumbersWithExceptionHandling(2,2);
        Test.stopTest();
        Assert.areEqual(4,result, 'Additon is not correct');
    }

    @isTest
	private static void testaddTwoNumbersWithExceptionHandling2() {
        Integer result;
        Test.startTest();
        result = PackageClass.addTwoNumbersWithExceptionHandling(2,4);
        Test.stopTest();
        Assert.areEqual(0,result, 'Additon is not correct');
    }
}