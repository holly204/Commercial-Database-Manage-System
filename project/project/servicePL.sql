/*Li Huang  W1641460  service contract PLSQL procedure*/
/* 
Create a service contract for a given customer and a machine(s):
Write a PLSQL procedure to create a service contract and add it to the SeriveContract table.
Each service contract should consist of a customer id, service contract id (a unique number), 
start date of service, end date of service, id of the machine covered, type of service (hardware or software), 
fee charged per month. This information should be passed into the procedure via parameters. 
The service contract, when created, has an active status. The status may be updated to inactive.
The procedure creates an instance of the contract and stores it in the appropriate table.(s)

*/
CREATE  OR REPLACE PROCEDURE service_Contract(
customerId_v in VARCHAR,
contractId_v in VARCHAR,
startDate_v in Date,
endDate_v in Date,
machineId_v in VARCHAR,
serviceType_v in VARCHAR,
feePerMonth_v in REAL)
as
BEGIN
	INSERT into ServiceContract 
	(customerId,contractId,startDate,endDate,machineId,serviceType,feePerMonth)
	values
	(customerId_v,contractId_v,startDate_v,endDate_v,machineId_v,serviceType_v,feePerMonth_v);
End;
/

BEGIN

	service_Contract('6503502234','SC000001',  to_date('2022-01-01','yyyy-mm-dd'),to_date('2022-12-31','yyyy-mm-dd'),'T001', 'hardware', 15);
	service_Contract('6503502234','SC000001',  to_date('2022-01-01','yyyy-mm-dd'),to_date('2022-12-31','yyyy-mm-dd'),'T002', 'software', 10);
	service_Contract('6503502234','SC000001',  to_date('2022-01-01','yyyy-mm-dd'),to_date('2022-12-31','yyyy-mm-dd'),'T003', 'hardware', 15);

	service_Contract('6504502235','SC000002',  to_date('2022-01-01','yyyy-mm-dd'),to_date('2022-12-31','yyyy-mm-dd'),'T001', 'hardware', 15);
	service_Contract('6504502235','SC000002',  to_date('2022-01-01','yyyy-mm-dd'),to_date('2022-12-31','yyyy-mm-dd'),'T001', 'software', 10);

	service_Contract('8504502236','SC000003',  to_date('2023-01-01','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),'T001', 'hardware', 15);
	service_Contract('6504502235','SC000004',  to_date('2023-01-01','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),'T002', 'hardware', 15);

End;
/

/*step 1: 
Capture the session (queries and output):
spool 'D:\APP\Oracle\SQL\Q3.log';
 
Step 2: EXECUTE the belowing SQL command 
@'D:\APP\Oracle\SQL\project\servicePL.sql';

Step 3:
spool off;
*/