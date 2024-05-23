/*Li Huang  W1641460  Project Creating TABLE*/

/*
customer(phoneNo, name, address)
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE customer;
CREATE TABLE customer (
    phoneNo char(10) PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(20)
);

INSERT INTO customer VALUES ('6503502234', 'Mike', 'San Jose');
INSERT INTO customer VALUES ('6504502235', 'Jack', 'San Francisco');
INSERT INTO customer VALUES ('8504502236', 'Miles', 'LA');

/*
serviceItem (itemId, itemType, make, model, year);
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE serviceItem;
CREATE TABLE serviceItem (
    itemId char(10) PRIMARY KEY,
	itemName VARCHAR(20),
    make   VARCHAR(20),
	model  VARCHAR(20),
	Itemyear  CHAR(4)
);
INSERT INTO serviceItem VALUES('T001', 'desktop', 'Dell', 'XP','2013');
INSERT INTO serviceItem VALUES('T002', 'laptop', 'APPle', 'Macbook','2015');
INSERT INTO serviceItem VALUES('T003', 'printer', 'HP', 'Jet','2018');
/*
monitor(itemId, make, model, year and size);
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE monitor;
CREATE TABLE monitor (
	itemId char(10) PRIMARY KEY,
    make   VARCHAR(20),
	model  VARCHAR(20),
	Itemyear   CHAR(4),
	Itemsize   REAL
);
INSERT INTO monitor VALUES('T001', 'Dell', 'XP','2013', 48);


/*
ServiceContract(contractId,customerId,startDate,endDate,machineId,serviceType,feePerMonth,status);
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE ServiceContract;
CREATE TABLE ServiceContract(
	customerId char(10),
	contractId char(10),
    startDate  DATE,
	endDate    DATE,
	machineId  char(10),
    serviceType VARCHAR(20),
	feePerMonth REAL,
	status VARCHAR(20) DEFAULT 'active',
	PRIMARY Key(customerId, contractId,machineId, serviceType),
	CHECK (endDate >= startDate)
);

/*
RepairJob(repairId, phoneNo, serviceDate,machineId,serviceType);
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE RepairJob;
CREATE TABLE RepairJob(
    repairId   char(10),
	phoneNo char(10),
    serviceDate  DATE,
	machineId  char(10),
    serviceType VARCHAR(20),
	PRIMARY KEY(repairId,phoneNo, serviceDate, machineId)
);

/*
RepairFee(repairId, partsId, partsFee, LaborFee);
*/
/*DROP THE TABLE if EXISTS */
DROP TABLE RepairFee;
CREATE TABLE RepairFee(
    repairId   char(10),
	partsId    char(10),
    parts VARCHAR(20),
	partsFee REAL,
	LaborFee REAL,
	PRIMARY Key(repairId, partsId)
);


/*step 1:
Capture the session (queries and output):
spool 'D:\APP\Oracle\SQL\project\creatingTable.log';

Step 2: EXECUTE the belowing SQL command
@'D:\APP\Oracle\SQL\project\creatingTable.sql';

Step 3:
spool off;
*/