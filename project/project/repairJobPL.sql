/*Li Huang  W1641460  service contract PLSQL procedure*/
/* 
Create a repair job
Write a PLSQL procedure to create a repair job.
Each repair job should consist of a customer information (name, phone,address), 
date of service, id of the machine covered, type of service (hardware or software), 
if it is a service item covered and an itemized list of charges.
*/
DECLARE
	TYPE Partsarray IS VARRAY(10) OF VARCHAR2(10); 
	TYPE Feearray IS VARRAY(10) OF REAL; 
	parts_v Partsarray := Partsarray();
	partsFee_v  Feearray:= Feearray();
	LaborFee_v  Feearray:= Feearray();
	cus_Num  NUMBER;  
	serv_Num NUMBER;
	PROCEDURE repair_Job(
		repairId_v in VARCHAR,
		phoneNo_v in VARCHAR,
		name_v in VARCHAR,
		address_v in VARCHAR,
		serviceDate_v in Date,
		machineId_v in VARCHAR,
		serviceType_v in VARCHAR,
		parts_v in Partsarray,
		partsFee_v in Feearray,
		LaborFee_v in Feearray)
		IS
		  BEGIN
			--If the customer information does not exist in customer table, 
			--insert the new customer information into customer table 
			SELECT COUNT(*) into cus_Num from customer where phoneNo = phoneNo_v;
			IF (cus_Num = 0) THEN
				INSERT into customer(phoneNo, name, address)
				values
				(phoneNo_v, name_v, address_v);
			End IF;
			
			INSERT into
			RepairJob(repairId, phoneNo, serviceDate,machineId,serviceType)
			values
			(repairId_v,phoneNo_v,serviceDate_v,machineId_v,serviceType_v);
			
			--Find out whether the repair item is under a service contract,
			SELECT COUNT(*) into serv_Num FROM RepairJob rj join ServiceContract sc
			on rj.phoneNo = sc.customerId and rj.machineId = sc.machineId 
			and rj.serviceType = sc.serviceType
			and rj.serviceDate BETWEEN sc.startDate and sc.endDate
			where rj.phoneNo = phoneNo_v;
			
			
			FOR i IN 1..parts_v.COUNT LOOP
				IF (serv_Num > 0) THEN
					---if the repair item under service contract,no charge will be made for labor.
				  INSERT into RepairFee(repairId, partsId, parts, partsFee, LaborFee)
				  VALUES
				  (repairId_v,i, parts_v(i),partsFee_v(i),0); 
				ELSE
					INSERT into RepairFee(repairId, partsId, parts, partsFee, LaborFee)
					VALUES
					(repairId_v,i, parts_v(i),partsFee_v(i),LaborFee_v(i));
				end If;
			END LOOP;
 
  END;
  
BEGIN 
	parts_v :=Partsarray('CPU','Memory','Screen');
	partsFee_v  := Feearray(300.00, 200.00, 100.00);
	LaborFee_v  := Feearray(150.00, 200.00, 100.00);
	repair_Job('RJ000001', '6503502234', 'Mike', 'San Jose', to_date('2022-05-01','yyyy-mm-dd'),'T002', 'software',parts_v, partsFee_v, LaborFee_v);

	parts_v :=Partsarray('OS','Processes');
	partsFee_v  := Feearray(250.00, 500.00);
	LaborFee_v  := Feearray(200.00, 300.00);
	repair_Job('RJ000002', '6503502238', 'Rose', 'Santa Clara', to_date('2022-04-01','yyyy-mm-dd'),'T002', 'software',parts_v, partsFee_v, LaborFee_v);

	parts_v :=Partsarray('Speaker','Camera');
	partsFee_v  := Feearray(150.00, 150.00);
	LaborFee_v  := Feearray(100.00, 100.00);
	repair_Job('RJ000003', '6503502239', 'Lucy', 'Santa Clara', to_date('2022-05-10','yyyy-mm-dd'),'T001', 'Hardware',parts_v, partsFee_v, LaborFee_v);

END;
/

/*step 1: 
Capture the session (queries and output):
spool 'D:\APP\Oracle\SQL\Q3.log';
 
Step 2: EXECUTE the belowing SQL command 
@'D:\APP\Oracle\SQL\project\repairJobPL.sql';

Step 3:
spool off;
*/