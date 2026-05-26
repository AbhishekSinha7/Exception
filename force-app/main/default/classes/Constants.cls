public class Constants {
public static final Integer SCHEDULE_FREQUENCY_VALUE = 1;
    public static final Integer EXPIRY_DAYS_VALUE = 30;
    public static final Boolean REMOVE_EXPIRY_DATE_FOR_COMPANIES_LINEKD_TO_ACCOUNT = true;
    public static final Boolean REMOVE_EXPIRY_DATE_WHEN_COMPANY_RECORD_IS_REFRESHED = false;
    public static final Boolean ENABLE_DELETION_OF_COMPANY_RECORDS = true;
 
     // Error Messages
    public static final String ERR_NO_DATA_FOUND = 'No inflation data is available for the selected date range.';
    public static final String ERR_START_DATE_GREATER_THAN_END_DATE  = 'Start Date cannot be later than End Date. Please provide a valid date range.';
    public static final String ERR_START_DATE_DATA_NOT_AVAILABLE = 'No data available for the selected Start Date. Please choose a date within the available data range.';
    public static final String ERR_END_DATE_DATA_NOT_AVAILABLE= 'Data for the selected End Date is not yet available. Please choose a valid End date.';
}