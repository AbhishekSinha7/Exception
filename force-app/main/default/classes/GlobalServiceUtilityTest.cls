/*******************************************************************************************************
* @Author:          CRM Developer
* @Description:     Test class for GlobalServiceUtility.
*******************************************************************************************************/
@isTest
private class GlobalServiceUtilityTest {

    @isTest
    static void testGetInflationRate_DelegatestoHelper() {
        GlobalServiceUtility.FlowRequest req = new GlobalServiceUtility.FlowRequest();
        req.startDate = Date.newInstance(2025, 5, 1);
        req.endDate   = Date.newInstance(2025, 5, 31);

        Test.startTest();
        List<GlobalServiceUtility.FlowResult> results = GlobalServiceUtility.getInflationRate(
            new List<GlobalServiceUtility.FlowRequest>{ req }
        );
        Test.stopTest();
    }
}