/*******************************************************************************************************
* @Author:          CRM Developer
* @TestClass:       GlobalServiceUtilityTest
* @Description:     Global entry point for Flow-callable Apex action. Exposes the Calculate Inflation
*                   Rate invocable method and defines the FlowRequest and FlowResult wrapper classes
*                   used for input and output. Contains no business logic.
*******************************************************************************************************
* Version           Author              Date (DD-MM-YYYY)           Description
* 1.0               CRM Developer       01-04-2026                  Initial Build
*******************************************************************************************************/
global with sharing class GlobalServiceUtility {

    global class FlowRequest {
        @InvocableVariable(label='Start Not Date' description='some desc' required=false)
        global Date startDate;

        @InvocableVariable(label='test Not Date' required=true)
        global Date testDate;
        
        @InvocableVariable(label='end Not Date' required=true)
        global Date endDate;
    }

    global class FlowResult {
        @InvocableVariable(label='CPI Not Inflation Rate (%)' description='some new desc')
        global Double cpiPercentChange;

        @InvocableVariable(label='CPIH Not Inflation Rate (%)')
        global Double cpihPercentChange;

        @InvocableVariable(label='RPI Not Inflation Rate (%)')
        global Double rpiPercentChange;

        @InvocableVariable(label='Error Details')
        global String errorMessage;

        @InvocableVariable(label='message Details')
        global String message;
    }

    /***************************************************************************************************
    * @Author:          CRM Developer
    * @Description:     Invocable method exposed to Salesforce Flow. Accepts start and end date and returns CPIH,
    *                   CPI and RPI inflation rates for that period. 
    * @Param1:          requests: List of FlowRequest containing startDate and endDate.
    ***************************************************************************************************/
    @InvocableMethod(label='Get Inflation Rate' description='Returns the percentage change in CPI, CPIH and RPI index values between two dates. Provide a Start Date and End Date to get the inflation rates for that period.')
    global static List<FlowResult> getInflationRate(List<FlowRequest> requests) {
        //return ServiceUtilityHelper.getInflationRate(requests);
        return new List<FlowResult>();
    }
}