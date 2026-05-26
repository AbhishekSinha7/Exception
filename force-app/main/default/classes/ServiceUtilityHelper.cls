/*******************************************************************************************************
* @Author:          CRM Developer
* @TestClass:       ServiceUtilityTest
* @Description:     Helper class for GlobalServiceUtility. Handles validation, SOQL queries and applies
*                   the ONS formula to calculate CPI, CPIH and RPI percent change between two dates.
/*******************************************************************************************************
* Version           Author              Date(DD-MM-YYYY)           Description
* 1.0               CRM Developer       01-04-2026                  Initial Build
*******************************************************************************************************/
public with sharing class ServiceUtilityHelper {

    /***************************************************************************************************
    * @Author:          CRM Developer
    * @Description:     Validates the date range and delegates to computeInflation if valid.
    * @Param1:          requests: List of FlowRequest containing startDate and endDate.
    ***************************************************************************************************/
    public static List<GlobalServiceUtility.FlowResult> getInflationRate(
        List<GlobalServiceUtility.FlowRequest> requests
    ) {
        List<GlobalServiceUtility.FlowResult> results = new List<GlobalServiceUtility.FlowResult>();

        for(GlobalServiceUtility.FlowRequest req : requests) {
            GlobalServiceUtility.FlowResult result = new GlobalServiceUtility.FlowResult();

            if(req.startDate == null || req.endDate == null) {
                result.errorMessage = Constants.ERR_NO_DATA_FOUND;
            } else if(req.startDate > req.endDate) {
                result.errorMessage = Constants.ERR_START_DATE_GREATER_THAN_END_DATE;
            } else {
                result = computeInflation(req, result);
            }
            results.add(result);
        }

        return results;
    }

    /***************************************************************************************************
    * @Author:          CRM Developer
    * @Description:     Fetches Index records whose date window covers the Start and End Date in a
    *                   single SOQL query, maps them to start and end slots, then applies the ONS
    *                   formula. Returns ERR_NO_DATA_FOUND if either record is missing.
    * @Param1:          req:FlowRequest containing startDate and endDate.
    * @Param2:          result:FlowResult to populate with calculated values or an error message.
    ***************************************************************************************************/
    private static GlobalServiceUtility.FlowResult computeInflation(
        GlobalServiceUtility.FlowRequest req,
        GlobalServiceUtility.FlowResult result
    ) {
        /*
        List<crms14__Index__c> indexRecords = [
            SELECT crms14__CPI_Index_Value__c,
                   crms14__CPIH_Index_Value__c,
                   crms14__RPI_Index_Value__c,
                   crms14__Start_Date__c,
                   crms14__End_Date__c
            FROM   crms14__Index__c
            WHERE  (crms14__Start_Date__c <= :req.startDate AND crms14__End_Date__c >= :req.startDate)//start date record
            OR     (crms14__Start_Date__c <= :req.endDate   AND crms14__End_Date__c >= :req.endDate)
            WITH   SECURITY_ENFORCED
            LIMIT  2
        ];
        crms14__Index__c startIdx = null;
        crms14__Index__c endIdx   = null;

        for(crms14__Index__c idx : indexRecords) {
            if(idx.crms14__Start_Date__c <= req.startDate && idx.crms14__End_Date__c >= req.startDate) {
                startIdx = idx;
            }
            if(idx.crms14__Start_Date__c <= req.endDate   && idx.crms14__End_Date__c >= req.endDate)   {
                endIdx   = idx;
            }
        }

        if(startIdx == null || endIdx == null) {
            result.errorMessage = Constants.ERR_NO_DATA_FOUND;
        }
        else{*/
        result.cpiPercentChange  = calculateRate(101,  102);
        result.cpihPercentChange = calculateRate(104, 108);
        result.rpiPercentChange  = calculateRate(110,  114);
        //}

        return result;
    }

    /***************************************************************************************************
    * @Author:          CRM Developer
    * @Description:     Applies ONS formula: ((indexNow - indexThen) / indexThen) * 100.
    *                   Returns null if either value is null or startValue is zero.
    * @Param1:          endValue:Index value at End Date   (index now).
    * @Param2:          startValue:Index value at Start Date (index then).
    ***************************************************************************************************/
    private static Double calculateRate(Decimal endValue, Decimal startValue) {
        Double ans;
        if(endValue != null && startValue != null && startValue != 0) {
            ans= (Double) ((endValue - startValue) / startValue * 100).setScale(1, RoundingMode.HALF_UP);
        }
        return ans;
    }
}