#UP

INSERT INTO EGF_MRHEADER ( ID, MRNO, MRDATE, MRTYPE, FUNDID, FUNDSOURCEID, REQUESTEDBY, STATUSID, APPROVEDBY, CREATEDDATE, CREATEDBY, LASTMODIFIEDDATE, LASTMODIFIEDBY, FROMSTOREID, TOSTOREID, FIELDID, FUNCTIONID, FUNCTIONARYID, DEPARTMENTID, ACCOUNTCODE, PURPOSE, STATE_ID )
VALUES ( 
seq_egf_mrheader.NEXTVAL, 'MR/1/2009-10', 
TO_Date( '11/06/2009','MM/DD/YYYY'), 'k',
 (select Id from FUND WHERE name like '%Municipal General Fund%'), 
(select Id from FUNDSOURCE WHERE name like '%Loans and Bonds%'), 
'egovernments', 11
,
 (Select ID_USER FROM EG_USER where FIRST_NAME LIKE '%SUPERUSER%'), 
 TO_Date( '11/06/2009', 'MM/DD/YYYY'),
 (Select ID_USER FROM EG_USER where FIRST_NAME LIKE '%SUPERUSER%'), 
 TO_Date( '11/06/2009 12:00:00', 'MM/DD/YYYY HH:MI:SS'), 
 (Select ID_USER FROM EG_USER where FIRST_NAME LIKE '%SUPERUSER%'),
 (SELECT ID FROM EG_STORES WHERE STORENAME LIKE '%MEDICAL STORES%'), 
 (SELECT ID FROM EG_STORES WHERE STORENAME LIKE '%MALARIA STORES%'),
 ( SELECT ID_BNDRY FROM EG_BOUNDARY WHERE NAME LIKE '%020%'), 
 (SELECT ID FROM FUNCTION WHERE code='3100'), 
 ( select ID FROM  FUNCTIONARY 	WHERE CODE ='456'), 
 (SELECT ID_DEPT FROM EG_DEPARTMENT WHERE DEPT_NAME LIKE '%H-Health%'), 
 ( SELECT ID FROM CHARTOFACCOUNTS WHERE GLCODE='2302001'), 
 (SELECT ID FROM EGSTORES_TXNTYPES WHERE MODULE='MR' AND TYPE='purposeType' AND CODE='Maintenance: Consumption' ), 
 null); 
 
 #DOWN
 DELETE FROM EGF_MRHEADER WHERE MRNO LIKE '%MR/1%'