public with sharing class Calculator {

    public class customException extends Exception{}

    public static Integer add(Integer a, Integer b) {
        return a + b;
    }

    // Subtraction
    public static Integer subtract(Integer a, Integer b) {
        return a - b;
    }

    // Multiplication
    public static Integer multiply(Integer a, Integer b) {
        return a * b;
    }

    // Division
    public static Integer divide(Integer a, Integer b) {
        if(b == 0) {
            throw new customException('Cannot divide by zero');
        }
        return a / b;
    }
    //v4
}