Insert into eg_boundary_type
   (ID_BNDRY_TYPE, HIERARCHY, NAME, UPDATEDTIME, ID_HEIRARCHY_TYPE)
 Values
   (4, 2, 'Zone', TO_DATE('09/06/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1);
   
   
   Insert into eg_boundary_type
      (ID_BNDRY_TYPE, HIERARCHY, NAME, UPDATEDTIME, ID_HEIRARCHY_TYPE)
    Values
      (5, 3, 'Ward', TO_DATE('09/06/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1);



Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(2, 2,1, 'Zone-1',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT,  NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(3, 3,1, 'Zone-2',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT,  NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(4, 4,1, 'Zone-3',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT,  NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(5,5,1, 'Zone-4',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT,  NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(6, 6,1, 'Zone-5',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT,  NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(7, 7,1, 'Zone-6',4, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');

Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(8,9,2,'Ward-02',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(9,28,2,'Ward-21',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(10,47,2,'Ward-40',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(11,57,2,'Ward-50',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(12,66,2,'Ward-59',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(13,91,2,'Ward-84',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(14,92,2,'Ward-85',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(15,99,2,'Ward-92',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(16,104,2,'Ward-97',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(17,106,2,'Ward-99',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(18,107,2,'Ward-100',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(19,108,2,'Ward-101',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(20,109,2,'Ward-102',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(21,110,2,'Ward-103',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(22,111,2,'Ward-104',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(23,112,2,'Ward-105',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(24,113,2,'Ward-106',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(25,116,2,'Ward-109',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');

Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(26,17,3,'Ward-10',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(27,26,3,'Ward-19',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(28,35,3,'Ward-28',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(29,36,3,'Ward-29',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(30,37,3,'Ward-30',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(31,44,3,'Ward-37',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(32,46,3,'Ward-39',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(33,51,3,'Ward-44',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(34,55,3,'Ward-48',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(35,60,3,'Ward-53',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(36,73,3,'Ward-66',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(37,74,3,'Ward-67',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(38,77,3,'Ward-70',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(39,78,3,'Ward-71',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(40,84,3,'Ward-77',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(41,93,3,'Ward-86',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(42,98,3,'Ward-91',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(43,102,3,'Ward-95',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');


Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(44,19,4,'Ward-12',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(45,30,4,'Ward-23',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(46,31,4,'Ward-24',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(47,32,4,'Ward-25',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(48,38,4,'Ward-31',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(49,43,4,'Ward-36',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(50,61,4,'Ward-54',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(51,62,4,'Ward-55',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(52,65,4,'Ward-58',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(53,82,4,'Ward-75',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(54,86,4,'Ward-79',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(55,87,4,'Ward-80',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(56,88,4,'Ward-81',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(57,90,4,'Ward-83',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(58,95,4,'Ward-88',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(59,97,4,'Ward-90',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(60,103,4,'Ward-96',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(61,115,4,'Ward-108',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');



Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(62,8,5,'Ward-01',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(63,11,5,'Ward-04',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(64,12,5,'Ward-05',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(65,13,5,'Ward-06',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(66,18,5,'Ward-11',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(67,20,5,'Ward-13',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(68,22,5,'Ward-15',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(69,29,5,'Ward-22',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(70,48,5,'Ward-41',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(71,50,5,'Ward-43',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(72,56,5,'Ward-49',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(73,58,5,'Ward-51',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(74,72,5,'Ward-65',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(75,83,5,'Ward-76',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(76,85,5,'Ward-78',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(77,101,5,'Ward-94',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(78,114,5,'Ward-107',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(79,117,5,'Ward-110',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');



Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(80,10,6,'Ward-03',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(81,14,6,'Ward-07',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(82,24,6,'Ward-17',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(83,40,6,'Ward-33',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(84,42,6,'Ward-35',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(85,45,6,'Ward-38',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(86,54,6,'Ward-47',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(87,59,6,'Ward-52',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(88,63,6,'Ward-56',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(89,67,6,'Ward-60',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(90,69,6,'Ward-62',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(91,71,6,'Ward-64',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(92,76,6,'Ward-69',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(93,79,6,'Ward-72',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(94,80,6,'Ward-73',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(95,81,6,'Ward-74',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(96,96,6,'Ward-89',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(97,100,6,'Ward-93',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(98,105,6,'Ward-98',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');



Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(99,15,7,'Ward-08',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(100,16,7,'Ward-09',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(101,21,7,'Ward-14',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(102,23,7,'Ward-16',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(103,25,7,'Ward-18',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(104,27,7,'Ward-20',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(105,33,7,'Ward-26',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(106,34,7,'Ward-27',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(107,39,7,'Ward-32',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(108,41,7,'Ward-34',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(109,49,7,'Ward-42',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(110,52,7,'Ward-45',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(111,53,7,'Ward-46',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(112,64,7,'Ward-57',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(113,68,7,'Ward-61',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(114,70,7,'Ward-63',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(115,75,7,'Ward-68',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(116,89,7,'Ward-82',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
Insert into eg_boundary (ID_BNDRY, BNDRY_NUM,PARENT, NAME, ID_BNDRY_TYPE, UPDATEDTIME, FROMDATE, IS_HISTORY) Values(117,94,7,'Ward-87',5, TO_DATE('10/11/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'N');
