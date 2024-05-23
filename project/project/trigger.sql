/*Li Huang  W1641460  */
/*
When a service contract is deleted, the customer’s information and the date of cancelation, 
should be recorded (in a separate table) automatically.
*/
DROP TABLE Canceled_service;
CREATE TABLE Canceled_service(
	customerId char(10),
	contractId char(10),
    DeleteDate  DATE,
	machineId  char(10),
    serviceType VARCHAR(20),
	feePerMonth REAL
);
Create Or REPLACE TRIGGER ServiceContract_trig
Before delete on ServiceContract
for each row
Begin
	INSERT into Canceled_service
	values(:old.customerId,:old.contractId, sysdate, :old.machineId,:old.serviceType,:old.feePerMonth);
End;
/

/*step 1: 
Capture the session (queries and output):
spool 'D:\APP\Oracle\SQL\Q3.log';
 
Step 2: EXECUTE the belowing SQL command 
@'D:\APP\Oracle\SQL\project\trigger.sql';

Step 3:
spool off;
*/