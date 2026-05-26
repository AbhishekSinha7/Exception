@isTest 
public with sharing class AreaTest {
    @isTest 
    public static void calculateArea(){
      Integer ar;
      Test.startTest();
      ar = Area.calculateArea(5,2);
      Test.stopTest();
      Assert.areEqual(10, ar, 'The area is not matched');
    }
}