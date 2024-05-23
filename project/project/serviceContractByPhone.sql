------ Li Huang  W1641460 
/*Display all the service contracts for a specific customer (by phone).*/
-- the size of one page
SET PAGESIZE 20
-- the size of a line
SET LINESIZE 120



-- Show the title of your report at the top of the page
ttitle center "Service Contract Report  " skip 2

-- Places and formats a specified title at the bottom of each report page 
btitle center "For Management Only"

SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF pre off -
HEAD "<TITLE>serviceContract Report</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: #FFFFC6} --> -
</STYLE>" -
BODY "TEXT='#ff00ff'" -
TABLE "WIDTH='90%' BORDER='5'" 

spool 'D:\APP\Oracle\SQL\project\serviceContractByPhone.html';

ACCEPT phone_v CHAR PROMPT 'Enter customer phone number:  '

-- change column headings and format number columns

column customerId format a15 heading "Customer|Id"
column contractId format a15 heading "Service|Contract_id"
column startDate format a15 heading "Start_Date|of_Service"
column endDate format a15 heading "End_Date|of_Service"
column machineId format a15 heading "id_of_Machine|Covered"
column serviceType format a15 heading "Type_of|Service"
column feePerMonth format 999,999.00 heading "Fee_Charged|Per_Month"

-- Run the query
SELECT customerId,contractId,startDate,endDate,machineId,serviceType,feePerMonth from ServiceContract
where customerId = '&phone_v';
spool off;


--clear all formatting commands ...
CLEAR COLUMNS
CLEAR BREAK
TTITLE OFF 
BTITLE OFF
SET VERIFY OFF 
SET FEEDBACK OFF
SET RECSEP OFF
SET ECHO OFF

/*
EXECUTE the belowing SQL command to generate report
@'D:\APP\Oracle\SQL\project\serviceContractByPhone.sql';
*/
