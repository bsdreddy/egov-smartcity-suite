#UP

INSERT INTO RELATION ( ID, CODE, NAME, ADDRESS1, ADDRESS2, CITY, PIN, PHONE, FAX, CONTACTPERSON,
MOBILE, EMAIL, NARRATION, ISACTIVE, LASTMODIFIED, CREATED, MODIFIEDBY, RELATIONTYPEID, TDSID,
GLCODEID, PANNO, TINNO, BANKACCOUNT, BANKNAME, PWDAPPROVALCODE, REGNO, CREATEDBY, STATUSID, GRADEID,
INACTIVEON, PARTYTYPEID, SUBTYPEID, MODEOFPAY, BANKACCOUNTTYPE, IFSCCODE,
BANKID ) VALUES ( 
SEQ_RELATION.nextval, 'TEJA INDUSTIRES', 'Teja', 'bangalore', NULL, NULL, NULL, NULL, NULL, NULL, NULL
, NULL, NULL, 1,  TO_Date( '09/14/2009 03:16:42 PM', 'MM/DD/YYYY HH:MI:SS AM'),  TO_Date( '09/14/2009 03:14:11 PM', 'MM/DD/YYYY HH:MI:SS AM')
, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, (select id  from  EGW_STATUS where moduletype='Supplier' and description ='Active'), NULL, NULL, NULL
, NULL, NULL, NULL, NULL, NULL); 


#DOWN
