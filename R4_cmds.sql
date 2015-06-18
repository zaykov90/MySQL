warnings;

UPDATE A1Employee SET supEmpID='10187462' WHERE empID='73724432'; -- Jennifer supervises Jamie Smith
UPDATE A1Employee SET supEmpID='10187462' WHERE empID='83540002'; -- Jennifer supervises Jamie Hill
UPDATE A1Employee SET supEmpID='90001234' WHERE empID='17253242'; -- Caroline supervises Louis
UPDATE A1Employee SET supEmpID='90001234' WHERE empID='77402846'; -- Caroline supervises Leah
UPDATE A1Employee SET supEmpID='90001234' WHERE empID='29404058'; -- Caroline supervises Steven
UPDATE A1Employee SET supEmpID='49534342' WHERE empID='12345678'; -- Thomas supervises Mark
UPDATE A1Employee SET supEmpID='49534342' WHERE empID='69204977'; -- Thomas supervises Allen
UPDATE A1Employee SET supEmpID='49534342' WHERE empID='82302832'; -- Thomas supervises Robert
UPDATE A1Employee SET supEmpID='49534342' WHERE empID='73629937'; -- Thomas supervises Dominic
UPDATE A1Employee SET supEmpID='49534342' WHERE empID='21111849'; -- Thomas supervises Sally
UPDATE A1Employee SET supEmpID='93828474' WHERE empID='51993748'; -- Chris supervises Daniel
UPDATE A1Employee SET supEmpID='93828474' WHERE empID='29534253'; -- Chris supervises Kerry
UPDATE A1Employee SET supEmpID='93828474' WHERE empID='31032482'; -- Chris supervises Sara

INSERT INTO A1Manager (mEmpID,officeNo,phoneNo) VALUES ('10187462','B192','02001381212');
INSERT INTO A1Manager (mEmpID,officeNo,phoneNo) VALUES ('90001234','J183','02001902000');
INSERT INTO A1Manager (mEmpID,officeNo,phoneNo) VALUES ('49534342','C100','02008884546');
INSERT INTO A1Manager (mEmpID,officeNo,phoneNo) VALUES ('93828474','G002','02009170011');

INSERT INTO A1Department VALUES ('SA12','Sales','10187462');
INSERT INTO A1Department VALUES ('CS71','Customer Service','90001234');
INSERT INTO A1Department VALUES ('TO93','Tourism','49534342');
INSERT INTO A1Department VALUES ('AD01','Administration','93828474');

UPDATE A1Manager SET mEmpDeptNo='SA12' WHERE mEmpId='10187462';
UPDATE A1Manager SET mEmpDeptNo='CS71' WHERE mEmpId='90001234';
UPDATE A1Manager SET mEmpDeptNo='TO93' WHERE mEmpId='49534342';
UPDATE A1Manager SET mEmpDeptNo='AD01' WHERE mEmpId='93828474';

INSERT INTO A1Guide VALUES ('12345678','0');
INSERT INTO A1Guide VALUES ('69204977','0');
INSERT INTO A1Guide VALUES ('73629937','0');
INSERT INTO A1Guide VALUES ('82302832','0');
INSERT INTO A1Guide VALUES ('21111849','0');

UPDATE A1Employee SET empDeptNo='SA12' WHERE empID='10187462'; -- Jennifer
UPDATE A1Employee SET empDeptNo='AD01' WHERE empID='12129482'; -- Matthew **
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='12345678'; -- Mark
UPDATE A1Employee SET empDeptNo='CS71' WHERE empID='17253242'; -- Louis
UPDATE A1Employee SET empDeptNo='CS71' WHERE empID='18343234'; -- Jamie Hanson **
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='21111849'; -- Sally
UPDATE A1Employee SET empDeptNo='CS71' WHERE empID='29404058'; -- Steven
UPDATE A1Employee SET empDeptNo='AD01' WHERE empID='29534253'; -- Kerry
UPDATE A1Employee SET empDeptNo='AD01' WHERE empID='31032482'; -- Sara
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='49534342'; -- Thomas
UPDATE A1Employee SET empDeptNo='AD01' WHERE empID='51993748'; -- Daniel
UPDATE A1Employee SET empDeptNo='CS71' WHERE empID='67022218'; -- Elaine **
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='69204977'; -- Allen
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='73629937'; -- Dominic
UPDATE A1Employee SET empDeptNo='SA12' WHERE empID='73724432'; -- Jamie Smith
UPDATE A1Employee SET empDeptNo='CS71' WHERE empID='77402846'; -- Leah
UPDATE A1Employee SET empDeptNo='TO93' WHERE empID='82302832'; -- Robert
UPDATE A1Employee SET empDeptNo='SA12' WHERE empID='83540002'; -- Jamie Hill
UPDATE A1Employee SET empDeptNo='SA12' WHERE empID='90001234'; -- Caroline
UPDATE A1Employee SET empDeptNo='AD01' WHERE empID='93828474'; -- Chris

INSERT INTO A1Transport VALUES ('car','5');
INSERT INTO A1Transport VALUES ('bus','50');
INSERT INTO A1Transport VALUES ('coach','30');
INSERT INTO A1Transport VALUES ('ferry','40');

INSERT INTO A1Ticket VALUES ('premium','45.50');
INSERT INTO A1Ticket VALUES ('adult','37.50');
INSERT INTO A1Ticket VALUES ('child','20.50');
INSERT INTO A1Ticket VALUES ('concession','12.50');

INSERT INTO A1Shift VALUES ('12345678','1'); -- Mark on Sunday
INSERT INTO A1Shift VALUES ('12345678','4'); -- Mark on Wednesday
INSERT INTO A1Shift VALUES ('12345678','5'); -- Mark on Thursday
INSERT INTO A1Shift VALUES ('69204977','2'); -- Allen on Monday
INSERT INTO A1Shift VALUES ('69204977','3'); -- Allen on Tuesday
INSERT INTO A1Shift VALUES ('69204977','7'); -- Allen on Saturday
INSERT INTO A1Shift VALUES ('73629937','1'); -- Dominic on Sunday
INSERT INTO A1Shift VALUES ('73629937','6'); -- Dominic on Friday
INSERT INTO A1Shift VALUES ('82302832','2'); -- Robert on Monday
INSERT INTO A1Shift VALUES ('82302832','3'); -- Robert on Tuesday
INSERT INTO A1Shift VALUES ('82302832','5'); -- Robert on Thursday
INSERT INTO A1Shift VALUES ('82302832','7'); -- Robert on Saturday
INSERT INTO A1Shift VALUES ('21111849','1'); -- Sally on Sunday
INSERT INTO A1Shift VALUES ('21111849','3'); -- Sally on Tuesday

INSERT INTO A1Transport  VALUES ('bus','50','40');
INSERT INTO A1Transport  VALUES ('car','5','60');
INSERT INTO A1Transport  VALUES ('coach','30','40');
INSERT INTO A1Transport  VALUES ('ferry','40','22');

INSERT INTO A1GeneralTour VALUES('EDIN','Edinburgh Tour','Hanover Street','Hanover Street','1');	
INSERT INTO A1GeneralTour VALUES('LNES','Loch Ness Tour','Glencoe','Loch Ness','65');
INSERT INTO A1GeneralTour VALUES('SKYE','See Skye','Mallaig','Isle of Skye','62');
INSERT INTO A1GeneralTour VALUES('HIGL','Highlands Tour','Perth','Inverness','112');
INSERT INTO A1GeneralTour VALUES('HIST','Historic Tour','Glasgow','Fort William','101');
	
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('EDIN1','EDIN','2014-04-10','bus','90','12');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('EDIN2','EDIN','2014-04-12','bus','90','12');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIGL1','HIGL','2014-05-09','bus','90','12');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIGL2','HIGL','2014-07-25','coach','168','22');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIGL3','HIGL','2014-05-03','coach','168','22');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIST1','HIST','2014-04-10','car','112','15');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIST2','HIST','2014-05-03','bus','168','22');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('HIST3','HIST','2014-04-10','bus','168','22');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('LNES1','LNES','2014-06-14','coach','97','12');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('LNES2','LNES','2014-07-22','car','65','8');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('SKYE1','SKYE','2014-06-10','ferry','169','22');
INSERT INTO A1ActualTour (tourID,atTourCode,date,atTransport,duration,tourCredits)
	VALUES ('SKYE2','SKYE','2014-07-16','ferry','169','22');
	
INSERT INTO A1Ticket VALUES ('premium', '45.50');
INSERT INTO A1Ticket VALUES ('adult', '37.50');
INSERT INTO A1Ticket VALUES ('child', '20.50');
INSERT INTO A1Ticket VALUES ('concession', '18.50');

INSERT INTO A1TourTicket VALUES ('EDIN1','premium','4');
INSERT INTO A1TourTicket VALUES ('EDIN1','adult','33');
INSERT INTO A1TourTicket VALUES ('EDIN1','child','3');
INSERT INTO A1TourTicket VALUES ('EDIN1','concession','0');
INSERT INTO A1TourTicket VALUES ('EDIN2','premium','0');
INSERT INTO A1TourTicket VALUES ('EDIN2','adult','0');
INSERT INTO A1TourTicket VALUES ('EDIN2','child','0');
INSERT INTO A1TourTicket VALUES ('EDIN2','concession','0');
INSERT INTO A1TourTicket VALUES ('HIGL1','premium','5');
INSERT INTO A1TourTicket VALUES ('HIGL1','adult','30');
INSERT INTO A1TourTicket VALUES ('HIGL1','child','10');
INSERT INTO A1TourTicket VALUES ('HIGL1','concession','5');
INSERT INTO A1TourTicket VALUES ('HIGL2','premium','8');
INSERT INTO A1TourTicket VALUES ('HIGL2','adult','10');
INSERT INTO A1TourTicket VALUES ('HIGL2','child','3');
INSERT INTO A1TourTicket VALUES ('HIGL2','concession','9');
INSERT INTO A1TourTicket VALUES ('HIGL3','premium','2');
INSERT INTO A1TourTicket VALUES ('HIGL3','adult','20');
INSERT INTO A1TourTicket VALUES ('HIGL3','child','5');
INSERT INTO A1TourTicket VALUES ('HIGL3','concession','3');
INSERT INTO A1TourTicket VALUES ('HIST1','premium','0');
INSERT INTO A1TourTicket VALUES ('HIST1','adult','0');
INSERT INTO A1TourTicket VALUES ('HIST1','child','0');
INSERT INTO A1TourTicket VALUES ('HIST1','concession','0');
INSERT INTO A1TourTicket VALUES ('HIST2','premium','2');
INSERT INTO A1TourTicket VALUES ('HIST2','adult','10');
INSERT INTO A1TourTicket VALUES ('HIST2','child','3');
INSERT INTO A1TourTicket VALUES ('HIST2','concession','0');
INSERT INTO A1TourTicket VALUES ('HIST3','premium','0');
INSERT INTO A1TourTicket VALUES ('HIST3','adult','2');
INSERT INTO A1TourTicket VALUES ('HIST3','child','15');
INSERT INTO A1TourTicket VALUES ('HIST3','concession','0');
INSERT INTO A1TourTicket VALUES ('LNES1','premium','0');
INSERT INTO A1TourTicket VALUES ('LNES1','adult','0');
INSERT INTO A1TourTicket VALUES ('LNES1','child','0');
INSERT INTO A1TourTicket VALUES ('LNES1','concession','0');
INSERT INTO A1TourTicket VALUES ('LNES2','premium','0');
INSERT INTO A1TourTicket VALUES ('LNES2','adult','2');
INSERT INTO A1TourTicket VALUES ('LNES2','child','3');
INSERT INTO A1TourTicket VALUES ('LNES2','concession','0');
INSERT INTO A1TourTicket VALUES ('SKYE1','premium','3');
INSERT INTO A1TourTicket VALUES ('SKYE1','adult','20');
INSERT INTO A1TourTicket VALUES ('SKYE1','child','4');
INSERT INTO A1TourTicket VALUES ('SKYE1','concession','0');
INSERT INTO A1TourTicket VALUES ('SKYE2','premium','1');
INSERT INTO A1TourTicket VALUES ('SKYE2','adult','15');
INSERT INTO A1TourTicket VALUES ('SKYE2','child','5');
INSERT INTO A1TourTicket VALUES ('SKYE2','concession','3');

UPDATE A1ActualTour SET atEmpID='12345678' WHERE tourID='EDIN1';
UPDATE A1ActualTour SET atEmpID='73629937' WHERE tourID='HIGL1';
UPDATE A1ActualTour SET atEmpID='73629937' WHERE tourID='HIGL2';
UPDATE A1ActualTour SET atEmpID='82302832' WHERE tourID='HIST1';
UPDATE A1ActualTour SET atEmpID='12345678' WHERE tourID='HIST3';
UPDATE A1ActualTour SET atEmpID='21111849' WHERE tourID='LNES2';
UPDATE A1ActualTour SET atEmpID='82302832' WHERE tourID='SKYE1';

INSERT INTO A1CanDoTour VALUES ('EDIN2','69204977');
INSERT INTO A1CanDoTour VALUES ('EDIN2','82302832');
INSERT INTO A1CanDoTour VALUES ('HIGL3','69204977');
INSERT INTO A1CanDoTour VALUES ('HIGL3','82302832');
INSERT INTO A1CanDoTour VALUES ('HIST2','69204977');
INSERT INTO A1CanDoTour VALUES ('HIST2','82302832');
INSERT INTO A1CanDoTour VALUES ('LNES1','21111849');
INSERT INTO A1CanDoTour VALUES ('LNES1','69204977');
INSERT INTO A1CanDoTour VALUES ('LNES1','82302832');
INSERT INTO A1CanDoTour VALUES ('SKYE2','21111849');
INSERT INTO A1CanDoTour VALUES ('SKYE2','69204977');
INSERT INTO A1CanDoTour VALUES ('SKYE2','82302832');






