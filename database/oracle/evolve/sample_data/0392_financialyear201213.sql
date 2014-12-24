#UP

Insert into financialyear
   (ID, FINANCIALYEAR, STARTINGDATE, ENDINGDATE, ISACTIVE, CREATED, LASTMODIFIED, MODIFIEDBY, ISACTIVEFORPOSTING, ISCLOSED, TRANSFERCLOSINGBALANCE)
 Values
   (seq_financialyear.nextval, '2012-13', TO_DATE('04/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/31/2013 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1, TO_DATE('03/29/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/29/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1, 1, 0, 0);


Insert into fiscalperiod
   (ID, NAME, STARTINGDATE, ENDINGDATE, ISACTIVEFORPOSTING, ISACTIVE, MODIFIEDBY, LASTMODIFIED, CREATED, FINANCIALYEARID)
 Values
   (seq_fiscalperiod.nextval, '201213', TO_DATE('04/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/31/2013 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 0, 0, 308, TO_DATE('03/30/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/30/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), (select id from financialyear where financialyear='2012-13'));


#DOWN


delete from fiscalperiod where name='201213';
delete from financialyear where FINANCIALYEAR='2012-13';
