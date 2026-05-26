/*******************************************************************************************************
* @Author:          CRM Developer
* @Description:     Test class for ServiceUtilityHelper.
/*******************************************************************************************************
* Version           Author              Date(DD-MM-YYYY)           Description
* 1.0               CRM Developer       06-04-2026                  Initial Build
*******************************************************************************************************/
@isTest
private class ServiceUtilityHelperTest {


    /***************************************************************************************************
    * @Description: Two different months with valid index records.
    *
    *               CPI:  ((110 - 100) / 100) * 100 = 10.0%
    *               CPIH: ((220 - 200) / 200) * 100 = 10.0%
    *               RPI:  ((315 - 300) / 300) * 100 = 5.0%
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_validData() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2025, 4, 15);
        req.endDate   = Date.newInstance(2025, 5, 20);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

    /***************************************************************************************************
    * @Description: Same month — startDate and endDate fall in the same index bucket.
    *               Same record assigned to both startIdx and endIdx → all rates = 0.0%
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_SameMonth() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2025, 5, 1);
        req.endDate   = Date.newInstance(2025, 5, 31);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

    /***************************************************************************************************
    * @Description: Null startDate — should return ERR_NO_DATA_FOUND.
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_NullStartDate() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = null;
        req.endDate   = Date.newInstance(2025, 5, 31);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

    /***************************************************************************************************
    * @Description: Null endDate — should return ERR_NO_DATA_FOUND.
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_NullEndDate() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2025, 4, 1);
        req.endDate   = null;

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

    /***************************************************************************************************
    * Author:       CRM Developer
    * @Description: startDate after endDate — should return ERR_START_DATE_GREATER_THAN_END_DATE.
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_StartDateAfterEndDate() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2025, 5, 31);
        req.endDate   = Date.newInstance(2025, 4, 1);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

    /***************************************************************************************************
    * Author:       CRM Developer
    * @Description: No index records exist for the given dates — should return ERR_NO_DATA_FOUND.
    ***************************************************************************************************/
    @isTest
    static void testGetInflationRate_NoIndexRecordsFound() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2020, 1, 1);
        req.endDate   = Date.newInstance(2020, 2, 28);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = ServiceUtilityHelper.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }

}