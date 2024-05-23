------ Li Huang  W1641460 
/*Display the total revenue generated in a specific month by all the repair jobs.*/
-- the size of one page
SET PAGESIZE 20
-- the size of a line
SET LINESIZE 120

-- Sets terminal output off
--set termout off

-- Show the title of your report at the top of the page

ttitle center "Repair Revenue  Report  "  skip 2

-- Places and formats a specified title at the bottom of each report page 
btitle center "For Management Only"
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF pre off -
HEAD "<TITLE>serviceContract Report</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: #FFFFC6} --> -
</STYLE>" -
BODY "TEXT='#ff00ff'" -
TABLE "WIDTH='90%' BORDER='5'" 

spool 'D:\APP\Oracle\SQL\project\RevenueReport.html';
BREAK ON REPORT
COMPUTE SUM LABEL TOTAL OF partsFee LaborFee on REPORT

column phoneNo format a10 heading "Customer|Phone"
column repairId format a10 heading "RepairId|Id"
column serviceDate format a10 heading "Service|Date"
column machineId format a10 heading "Machine|Id"
column serviceType format a10 heading "Service|Type"
column parts format a10 heading "Repair|Parts"
column partsFee format 999,999.00 heading "Parts|Fee"
column LaborFee format 999,999.00 heading "Labor|Fee"

ACCEPT Month_year DATE FORMAT 'yyyy-mm' PROMPT 'Enter year and month yyyy-mm:  '

SELECT 
rj.phoneNo,rj.repairId,rj.serviceDate,rj.machineId,rj.serviceType,
rf.parts, rf.partsFee, rf.LaborFee
FROM RepairJob rj
join RepairFee rf
ON rj.repairId = rf.repairId
WHERE TO_CHAR(serviceDate, 'yyyy-mm')= '&Month_year';


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
@'D:\APP\Oracle\SQL\project\RevenueReport.sql';
*/

