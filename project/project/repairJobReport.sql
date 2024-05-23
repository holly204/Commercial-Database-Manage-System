------ Li Huang  W1641460 
/*Display a service contract by contract id.*/
-- the size of one page
SET PAGESIZE 20
-- the size of a line
SET LINESIZE 120           

-- Show the title of your report at the top of the page
ttitle center "Repair Job Report  " skip 2

-- Places and formats a specified title at the bottom of each report page 
btitle center "For Management Only"

SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF pre off -
HEAD "<TITLE>Repair Job Report</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: #FFFFC6} --> -
</STYLE>" -
BODY "TEXT='#ff00ff'" -
TABLE "WIDTH='90%' BORDER='5'" 

spool 'D:\APP\Oracle\SQL\project\repairJobReport.html';

BREAK ON phoneNo SKIP 2
-- change column headings and format number columns

column phoneNo format a10 heading "Customer|Phone"
column name format a10 heading "Customer|Name"
column address format a15 heading "Customer|Address"
column repairId format a10 heading "RepairId|Id"
column serviceDate format a10 heading "Service|Date"
column machineId format a10 heading "Machine|Id"
column serviceType format a10 heading "Service|Type"
column parts format a10 heading "Repair|Parts"
column partsFee format 999,999.00 heading "Parts|Fee"
column LaborFee format 999,999.00 heading "Labor|Fee"

-- Run the query
SELECT cs.phoneNo, cs.name, cs.address,  
rj.repairId,rj.serviceDate,rj.machineId,rj.serviceType,
rf.parts, rf.partsFee, rf.LaborFee
from RepairJob rj 
join customer cs on rj.phoneNo = cs.phoneNo
join RepairFee rf on rj.repairId = rf.repairId;

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
@'D:\APP\Oracle\SQL\project\repairJobReport.sql';
*/
