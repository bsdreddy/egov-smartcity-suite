
#UP


INSERT INTO EGF_INSTRUMENTACCOUNTCODES (ID, TYPEID, GLCODEID, CREATEDBY, LASTMODIFIEDBY, CREATEDDATE, LASTMODIFIEDDATE) VALUES
(SEQ_EGF_INSTRUMENTACCOUNTCODES.NEXTVAL,(SELECT ID FROM EGF_INSTRUMENTTYPE WHERE TYPE='cash'),(SELECT ID FROM CHARTOFACCOUNTS WHERE NAME='Cash On Hand'),
1,1,'21-OCT-2009','21-OCT-2009');
INSERT INTO EGF_INSTRUMENTACCOUNTCODES (ID, TYPEID, GLCODEID, CREATEDBY, LASTMODIFIEDBY, CREATEDDATE, LASTMODIFIEDDATE) VALUES
(SEQ_EGF_INSTRUMENTACCOUNTCODES.NEXTVAL,(SELECT ID FROM EGF_INSTRUMENTTYPE WHERE TYPE='cheque'),(SELECT ID FROM CHARTOFACCOUNTS WHERE NAME='Cheque in hand'),
1,1,'21-OCT-2009','21-OCT-2009');
INSERT INTO EGF_INSTRUMENTACCOUNTCODES (ID, TYPEID, GLCODEID, CREATEDBY, LASTMODIFIEDBY, CREATEDDATE, LASTMODIFIEDDATE) VALUES
(SEQ_EGF_INSTRUMENTACCOUNTCODES.NEXTVAL,(SELECT ID FROM EGF_INSTRUMENTTYPE WHERE TYPE='dd'),(SELECT ID FROM CHARTOFACCOUNTS WHERE NAME='Cheque in hand'),
1,1,'21-OCT-2009','21-OCT-2009');
COMMIT;


#DOWN





