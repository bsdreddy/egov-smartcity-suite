#UP

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311006', 'RECEIVABLE FOR PROPERTY TAX-4311006 LIGHT TAX ARREARS', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311007', 'BIG RESIDENTIAL BUILDING ARREARS', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311008', 'RECEIVABLE FOR PROPERTY TAX EDUCATION CESS ARREARS', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311009', 'RECEIVABLE FOR PROPERTY TAX- EMPLOYMENT GUARANTEE CESS ARREARS', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311010', 'RECEIVABLE FOR PROPERTY TAX- GENERAL TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311011', 'RECEIVABLE FOR PROPERTY TAX- FIRE SERVICE TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311012', 'RECEIVABLE FOR PROPERTY TAX- WATER TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311013', 'RECEIVABLE FOR PROPERTY TAX- SESERAGE TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311014', 'RECEIVABLE FOR PROPERTY TAX- LIGHTING TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311015', 'RECEIVABLE FOR PROPERTY TAX- EDUCATION CESS CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311016', 'RECEIVABLE FOR PROPERTY TAX- BIG RESIDENTIAL BUILDING TAX CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311017', 'RECEIVABLE FOR PROPERTY TAX- EMPLOYMENT GUARANTEE CESS CURRENT', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'A', 4, 0, 1);

--income
--commented here because these account heads are part ERP Sample data and due to build failing
/*INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '1100102', 'EDUCATION CESS PAYABLE', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'I', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '1100103', 'BIG RESIDENTIAL BUILDING TAX PAYABLE', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'I', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '1100104', 'EMPLOYMENT GUARANTEE CESS PAYABLE', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'I', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( 
SEQ_CHARTOFACCOUNTS.NEXTVAL, '1108003', 'FIRE SERVICE TAX PAYABLE', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate
, 1, sysdate,'I', 4, 0, 1);*/

update chartofaccounts set budgetcheckreq = 0 where glcode in ('4311001','4311002','4311003','4311004');
delete from chartofaccountdetail where glcodeid=(select id from chartofaccounts where glcode='2801002');
update chartofaccounts set functionreqd = 0, budgetcheckreq = 0 where glcode = '2801002';

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( SEQ_CHARTOFACCOUNTS.NEXTVAL, '1404016', 'OTHER FEES - RECOVERY FEES', NULL, 1, 
(select id from chartofaccounts where name='OTHER FEES'), sysdate, 1, sysdate,'I', 4, 0, 1);

INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( SEQ_CHARTOFACCOUNTS.NEXTVAL, '4311018', 'RECEIVABLE FOR PROPERTY TAX- RECOVERY FEES', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate, 1, sysdate,'A', 4, 0, 1);

update chartofaccounts set budgetcheckreq = 0 where glcode in ('4311018');

/*INSERT INTO CHARTOFACCOUNTS ( ID, GLCODE, NAME, DESCRIPTION, ISACTIVEFORPOSTING, PARENTID,
LASTMODIFIED, MODIFIEDBY, CREATED, TYPE,  CLASSIFICATION, FUNCTIONREQD,
CREATEDBY ) VALUES ( SEQ_CHARTOFACCOUNTS.NEXTVAL, '1402001', 'RECEIVABLE FOR PROPERTY TAX- PENALTY_FINES', NULL, 1, 
(select id from chartofaccounts where name='RECEIVABLE FOR PROPERTY TAX'), sysdate, 1, sysdate,'A', 4, 0, 1);*/

#DOWN

delete from chartofaccounts where glcode = '4311006';
delete from chartofaccounts where glcode = '4311007';
delete from chartofaccounts where glcode = '4311008';
delete from chartofaccounts where glcode = '4311009';
delete from chartofaccounts where glcode = '4311010';
delete from chartofaccounts where glcode = '4311011';
delete from chartofaccounts where glcode = '4311012';
delete from chartofaccounts where glcode = '4311013';
delete from chartofaccounts where glcode = '4311014';
delete from chartofaccounts where glcode = '4311015';
delete from chartofaccounts where glcode = '4311016';
delete from chartofaccounts where glcode = '4311017';
delete from chartofaccounts where glcode = '1100102';
delete from chartofaccounts where glcode = '1100103';
delete from chartofaccounts where glcode = '1100104';
delete from chartofaccounts where glcode = '1108003';

update chartofaccounts set budgetcheckreq = 1 where glcode in ('4311001','4311002','4311003','4311004');

Insert into chartofaccountdetail (ID,GLCODEID,DETAILTYPEID,MODIFIEDBY,MODIFIEDDATE,CREATEDBY,CREATEDDATE) values (seq_chartofaccountdetail.nextval,(select id from chartofaccounts where glcode='2801002'),(select id from accountdetailtype where description='Supplier'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'));
Insert into chartofaccountdetail (ID,GLCODEID,DETAILTYPEID,MODIFIEDBY,MODIFIEDDATE,CREATEDBY,CREATEDDATE) values (seq_chartofaccountdetail.nextval,(select id from chartofaccounts where glcode='2801002'),(select id from accountdetailtype where description='contractor'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'));
Insert into chartofaccountdetail (ID,GLCODEID,DETAILTYPEID,MODIFIEDBY,MODIFIEDDATE,CREATEDBY,CREATEDDATE) values (seq_chartofaccountdetail.nextval,(select id from chartofaccounts where glcode='2801002'),(select id from accountdetailtype where description='AccountEntity'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'),186,to_date('16/07/2010 12:14:33','dd/mm/yyyy hh24:mi:ss'));

update chartofaccounts set functionreqd = 1, budgetcheckreq = 0 where glcode = '2801002';

delete from chartofaccounts where glcode = '1404016';
delete from chartofaccounts where glcode = '4311018';
delete from chartofaccounts where glcode = '1402001';
