@isTest 
public with sharing class CalculatorTest {
    
    @isTest
	private static void testAdd() {
        Integer result = Calculator.add(5, 3);
        Assert.areEqual(8, result, '5 + 3 should equal 8');
    }

    @isTest
	private static void testSubtract() {
        Integer result = Calculator.subtract(5, 3);
        Assert.areEqual(2, result, '5 - 3 should equal 2');
    }

     @isTest
	private static void testMultiply() {
        Integer result = Calculator.multiply(5, 3);
        Assert.areEqual(15, result, '5 * 3 should equal 15');
    }

     @isTest
	 private static void testDivide() {
        Integer result = Calculator.divide(15, 3);
        Assert.areEqual(5, result, '15 / 3 should equal 5');
     }

    @isTest
    private static void testDivideByZero() {
        try {
            Calculator.divide(15, 0);
            System.assert(false, 'Divide by zero should throw an exception');
        } catch (Exception e) {
             Assert.areEqual('Cannot divide by zero', e.getMessage());
         }//hmm
    }
}