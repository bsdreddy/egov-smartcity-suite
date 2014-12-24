#UP

INSERT INTO EG_SCRIPT ( ID, NAME, SCRIPT_TYPE, CREATED_BY, CREATED_DATE, MODIFIED_BY, MODIFIED_DATE,
SCRIPT, START_DATE, END_DATE ) VALUES ( 
eg_script_seq.nextval, 'ReceiptVoucher.workflow.validactions', 'python', NULL, NULL, NULL
, NULL, 'transitions={''OPERATOR'':[''co_approve'',''co_reject''],''SECTION MANAGER'':[''am_approve'',''am_reject''],''ACCOUNTS OFFICER'':[''ao_approve'',''ao_reject'']}
state=persistenceService.getDesginationName()
if state in transitions:result=transitions[state]'
,  TO_Date( '01/01/1900 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'),  TO_Date( '01/01/2100 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM')); 


Insert into EG_SCRIPT (ID,NAME,SCRIPT_TYPE,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE,SCRIPT,START_DATE,END_DATE) 
values (eg_script_seq.nextval,'ReceiptVoucher.workflow','python',null,null,null,null,'from org.egov.pims.dao import EisDAOFactory
from org.egov.pims.commons import DesignationMaster
from org.egov.pims.commons.dao import DesignationMasterDAO
from org.egov.infstr import ValidationError
from org.egov.infstr import ValidationException
from org.egov.lib.rjbac.dept import DepartmentImpl
from org.egov.exceptions import NoSuchObjectException
from org.egov.exceptions import TooManyValuesException
from org.egov import EGOVRuntimeException
from org.egov.infstr.utils import EGovConfig
from org.egov.dao.bills import BillsDaoFactory
pimsDAO=EisDAOFactory.getDAOFactory().getPersonalInformationDAO()
def co_approve():
    update_workflow(''SECTION MANAGER'',wfItem,''CO APPROVED'',comments)
    return (persistenceService.persist(wfItem),None)
def am_approve():
    update_workflow(''ACCOUNTS OFFICER'',wfItem,''MANAGER APPROVED'',comments)
    return (persistenceService.persist(wfItem),None)
def ao_approve():
     update_workflow(''ACCOUNTS OFFICER'',wfItem,''END'',comments)
     persistenceService.createVoucherfromPreApprovedVoucher(wfItem)
     return (persistenceService.persist(wfItem),None)
def co_reject():
    update_workflow(''OPERATOR'',wfItem,''END'',comments)
    persistenceService.cancelVoucher(wfItem)
    return (persistenceService.persist(wfItem),None)
def ao_reject():
    update_workflow(''OPERATOR'',wfItem,''AO REJECTED'',comments)
    return (persistenceService.persist(wfItem),None)
def am_reject():
   update_workflow(''OPERATOR'',wfItem,''SECTION MANAGER REJECTED'',comments)
   return (persistenceService.persist(wfItem),None)
def find_desig(designationName):
    designations=persistenceService.findAllBy(''from DesignationMaster dm where upper(designationName)=?'',[designationName.upper()])
    if not designations: raise ValidationException,[ValidationError(''currentState.owner'',''egf.preapprovedJV.no_next_desig'')]
    return designations[0]
',TO_Date( '01/01/1900 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'),  TO_Date( '01/01/2100 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM')); 

update eg_script set script=script||'
def find_posForDesignation(designation, wfItem):
    next_desig=find_desig(designation)
    if not next_desig:
        raise ValidationException,[ValidationError(''currentState.owner'',''egf.preapprovedJV.no_designation'')]
    emp=None
    user=None
    try:
        btypeStr=EGovConfig.getProperty("egf_config.xml", "city", "1", "BoundaryType")
        htype=persistenceService.find("from HeirarchyTypeImpl where lower(name)=lower(?)",["Administration"])
        sqlQry="from BoundaryTypeImpl btype where lower(btype.name)=lower(''"+btypeStr+"'') and btype.heirarchyType=?"
        btype=persistenceService.find(sqlQry,[htype])
        bndry=persistenceService.find("from BoundaryImpl bndry where bndry.boundaryType=?",[btype])
        dept=persistenceService.getDepartmentForWfItem(wfItem)
        if(dept.getDeptCode()==''A''):
            functionary = persistenceService.find("from Functionary where upper(name)=?",["TREASURY"])
            emp=pimsDAO.getEmployeeByFunctionary(dept.getId(),next_desig.getDesignationId(),bndry.getId(),functionary.getId())
        else:    
            emp=pimsDAO.getEmployee(dept.getId(),next_desig.getDesignationId(),bndry.getId())
        pos=persistenceService.getPositionForEmployee(emp)
    except TooManyValuesException:
        raise ValidationException,[ValidationError(''TooManyValuesException'',''TooManyValuesException'')]
    except NoSuchObjectException:
        raise ValidationException,[ValidationError(''NoSuchObjectException'',''NoSuchObjectException'')]
    except EGOVRuntimeException:
        raise ValidationException,[ValidationError(''EGOVRuntimeException'',''TooManyValuesException'')]
    else:
        pass
    if not pos:
        raise ValidationException,[ValidationError(''currentState.owner'',''egf.preapprovedJV.no_position'')]
    return pos
def update_workflow(designation1, wfItem,designation2,comments):
    pos=find_posForDesignation(designation1,wfItem)
    wfItem.changeState(designation2,pos,comments)
transitions={''co_approve'':co_approve,''co_reject'':co_reject,''am_approve'':am_approve,''ao_approve'':ao_approve,''ao_reject'':ao_reject,''am_reject'':am_reject}
result,validationErrors=transitions[action.getName()]()' where name='ReceiptVoucher.workflow';


Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','co_approve','Forward',null,null,null,null);
Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','co_reject','Cancel',null,null,null,null);

Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','am_approve','Forward',null,null,null,null);
Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','am_reject','Send back',null,null,null,null);

Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','ao_approve','Approve',null,null,null,null);
Insert into EG_WF_ACTIONS (ID,TYPE,NAME,DESCRIPTION,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) 
values (EG_WF_ACTIONS_SEQ.NEXTVAL,'ReceiptVoucher','ao_reject','Send back',null,null,null,null);

-----------------------------------------------------

Insert into eg_designation (DESIGNATIONID,DEPTID,DESIGNATION_NAME,DESIGNATION_LOCAL,OFFICER_LEVEL,DESIGNATION_DESCRIPTION,SANCTIONED_POSTS,OUTSOURCED_POSTS,BASIC_FROM,BASIC_TO,ANN_INCREMENT,REPORTSTO,GRADE_ID) 
values (SEQ_DESIGNATION.NEXTVAL,null,'OPERATOR',null,1,'OPERATOR.',10,7,4500,9000,null,2,null);

----------------------------------------------

INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('OPERATOR', seq_pos.NEXTVAL, 10, 7,(select DESIGNATIONID from eg_designation where designation_name='OPERATOR'), sysdate);

INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('SM', seq_pos.NEXTVAL, 5, 2,(select DESIGNATIONID from eg_designation where designation_name='SECTION MANAGER'), sysdate);
 
INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('AO', seq_pos.NEXTVAL, 5, 2,(select DESIGNATIONID from eg_designation where designation_name='ACCOUNTS OFFICER'), sysdate);
 -----------------------------------------------------------
INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'coll_op', 'coll_op', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'coll_manager', 'coll_manager', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'coll_ao', 'coll_ao', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
-------------------------------------------------
INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90001', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id_user FROM EG_USER WHERE user_name ='coll_op'), 1, NULL, NULL, 
    NULL, 'coll_op', NULL, NULL, NULL, 
    NULL, 'coll_op', NULL,3);

INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90002', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id_user FROM EG_USER WHERE user_name ='coll_manager'), 1, NULL, NULL, 
    NULL, 'coll_manager', NULL, NULL, NULL, 
    NULL, 'coll_manager', NULL,3);
    
INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90003', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id_user FROM EG_USER WHERE user_name ='coll_ao'), 1, NULL, NULL, 
    NULL, 'coll_ao', NULL, NULL, NULL, 
    NULL, 'coll_ao', NULL,3);
--------------------------------------------------
INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='coll_op'));

INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='coll_manager'));

INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='coll_ao'));
--------------------------------------------

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='OPERATOR'), 
    NULL, NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='coll_op')), NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id FROM EG_POSITION WHERE position_name='OPERATOR'),NULL,NULL);

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='SECTION MANAGER'), 
    NULL, NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='coll_manager')), NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id FROM EG_POSITION WHERE position_name='SM'),NULL,NULL);

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='ACCOUNTS OFFICER'), 
    NULL, NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='coll_ao')), NULL, 
    (select id_dept from eg_department where dept_code='FA'), (SELECT id FROM EG_POSITION WHERE position_name='AO'),NULL,NULL);
----------------------------------------------------------
INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='coll_op'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='coll_op')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');

INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='coll_manager'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='coll_manager')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');

INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='coll_ao'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='coll_ao')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');
---------------------------------------
INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'coll_op'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );

INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'coll_manager'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );

INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'coll_ao'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'RECEIPT_COLLETION', 'RECEIPT_COLLETION', NULL, SYSDATE,  SYSDATE, 1,1); 

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_5', 'Counter 5', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_6', 'Counter 6', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_7', 'Counter 7', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 


INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='coll_op'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_5'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 

INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='coll_manager'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_6'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 

INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='coll_ao'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_7'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 

---------------------------------------

INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('ACC_OPERATOR', seq_pos.NEXTVAL, 10, 7,(select DESIGNATIONID from eg_designation where designation_name='OPERATOR'), sysdate);

INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('ACC_MANAGER', seq_pos.NEXTVAL, 5, 2,(select DESIGNATIONID from eg_designation where designation_name='SECTION MANAGER'), sysdate);
 
INSERT INTO EG_POSITION (POSITION_NAME, ID, SANCTIONED_POSTS, OUTSOURCED_POSTS, DESIG_ID, EFFECTIVE_DATE)
 VALUES('ACC_AO', seq_pos.NEXTVAL, 5, 2,(select DESIGNATIONID from eg_designation where designation_name='ACCOUNTS OFFICER'), sysdate);
 -----------------------------------------------------------
INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'acc_coll_op', 'acc_coll_op', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'acc_coll_manager', 'acc_coll_manager', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER(ID_USER, FIRST_NAME, USER_NAME, PWD, PWD_REMINDER, UPDATETIME, IS_SUSPENDED, ISACTIVE, FROMDATE, TODATE)
 VALUES (seq_eg_user.NEXTVAL, 'acc_coll_ao', 'acc_coll_ao', 't27o223b7q3k0mtic20k1u32n', 'egovfinancials', TO_DATE('03/17/2008 11:59:39', 'MM/DD/YYYY HH24:MI:SS'), 'N', 1, TO_DATE('01/01/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
-------------------------------------------------
INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90004', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id_user FROM EG_USER WHERE user_name ='acc_coll_op'), 1, NULL, NULL, 
    NULL, 'acc_coll_op', NULL, NULL, NULL, 
    NULL, 'acc_coll_op', NULL,3);

INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90005', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id_user FROM EG_USER WHERE user_name ='acc_coll_manager'), 1, NULL, NULL, 
    NULL, 'acc_coll_manager', NULL, NULL, NULL, 
    NULL, 'acc_coll_manager', NULL,3);
    
INSERT INTO EG_EMPLOYEE (ID, CODE, DATE_OF_BIRTH, BLOOD_GROUP, MOTHER_TONUGE, RELIGION_ID, COMMUNITY_ID, GENDER, IS_HANDICAPPED, IS_MED_REPORT_AVAILABLE, DATE_OF_FIRST_APPOINTMENT, IDENTIFICATION_MARKS1, LANGUAGES_KNOWN_ID, MODE_OF_RECRUIMENT_ID, RECRUITMENT_TYPE_ID, CATEGORY_ID, QULIFIED_ID, SALARY_BANK, BANK,  PAY_FIXED_IN_ID, GRADE_ID, PRESENT_DESIGNATION, SCALE_OF_PAY, BASIC_PAY, SPL_PAY, PP_SGPP_PAY, ANNUAL_INCREMENT_ID, GPF_AC_NUMBER, RETIREMENT_AGE, PRESENT_DEPARTMENT, IF_ON_DUTY_ARRANGMENT_DUTY_DEP, LOCATION, COST_CENTER, ID_DEPT, ID_USER, ISACTIVE, EMPFATHER_FIRSTNAME, EMPFATHER_LASTNAME, EMPFATHER_MIDDLENAME, EMP_FIRSTNAME, EMP_LASTNAME, EMP_MIDDLENAME, IDENTIFICATION_MARKS2, PAN_NUMBER, NAME, MATURITY_DATE,EMPCATMSTR_ID)
 VALUES (EGPIMS_PERSONAL_INFO_SEQ.NEXTVAL, '90006', TO_DATE('11/11/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 
    NULL, NULL, '0', '0', '0', 
    TO_DATE('11/11/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, NULL, 1, 1, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL,  NULL, 
    NULL, NULL, NULL,  '452454', 
    NULL, NULL, NULL, NULL, NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id_user FROM EG_USER WHERE user_name ='acc_coll_ao'), 1, NULL, NULL, 
    NULL, 'acc_coll_ao', NULL, NULL, NULL, 
    NULL, 'acc_coll_ao', NULL,3);
--------------------------------------------------
INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_op'));

INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_manager'));

INSERT INTO EG_EMP_ASSIGNMENT_PRD (ID, FROM_DATE, TO_DATE, ID_EMPLOYEE)
 VALUES (seq_ass_prd.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL, (SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_ao'));
--------------------------------------------
Insert into FUNCTIONARY (ID,CODE,NAME,CREATETIMESTAMP,UPDATETIMESTAMP,ISACTIVE) 
values (seq_functionary.nextval,1156,'Treasury',to_timestamp('07-10-08','DD-MM-RR HH12:MI:SS.FF AM'),to_timestamp('07-10-08','DD-MM-RR HH12:MI:SS.FF AM'),1);

-----------------------------------------------

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='OPERATOR'), 
    (select id from functionary where name='Treasury'), NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_op')), NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id FROM EG_POSITION WHERE position_name='ACC_OPERATOR'),NULL,NULL);

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='SECTION MANAGER'), 
    (select id from functionary where name='Treasury'), NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_manager')), NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id FROM EG_POSITION WHERE position_name='ACC_MANAGER'),NULL,NULL);

INSERT INTO EG_EMP_ASSIGNMENT (ID, ID_FUND, ID_FUNCTION, DESIGNATIONID, ID_FUNCTIONARY, PCT_ALLOCATION, REPORTS_TO, ID_EMP_ASSIGN_PRD, FIELD, MAIN_DEPT, POSITION_ID,GOVT_ORDER_NO, GRADE_ID)
 VALUES (seq_ass.NEXTVAL,(select id from fund where name='Municipal General Fund'), null, (select DESIGNATIONID from eg_designation where designation_name='ACCOUNTS OFFICER'), 
    (select id from functionary where name='Treasury'), NULL, NULL,(SELECT id FROM EG_EMP_ASSIGNMENT_PRD WHERE id_employee =(SELECT id FROM EG_EMPLOYEE WHERE name='acc_coll_ao')), NULL, 
    (select id_dept from eg_department where dept_code='A'), (SELECT id FROM EG_POSITION WHERE position_name='ACC_AO'),NULL,NULL);
----------------------------------------------------------
INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='acc_coll_op'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='acc_coll_op')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');

INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='acc_coll_manager'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='acc_coll_manager')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');

INSERT INTO EG_USER_JURLEVEL(ID_USER_JURLEVEL, ID_USER, ID_BNDRY_TYPE, UPDATETIME)
 VALUES (SEQ_EG_USER_JURLEVEL.NEXTVAL, (SELECT id_user FROM EG_USER WHERE first_name='acc_coll_ao'), 1, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO EG_USER_JURVALUES (ID_USER_JURLEVEL, ID_BNDRY, ID, FROMDATE, TODATE, IS_HISTORY)
 VALUES ((SELECT id_user_jurlevel FROM EG_USER_JURLEVEL WHERE id_user=(SELECT id_user FROM EG_USER WHERE first_name='acc_coll_ao')), 1, SEQ_EG_USER_JURVALUES.NEXTVAL, TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), null, 'N');
---------------------------------------
INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'acc_coll_op'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );

INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'acc_coll_manager'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );

INSERT INTO EG_USERROLE (id_role, id_user, ID, fromdate, todate, is_history)
VALUES ((SELECT id_role FROM EG_ROLES WHERE ROLE_NAME='SuperUser'), (SELECT id_user FROM EG_USER WHERE user_name = 'acc_coll_ao'), seq_eg_userrole.NEXTVAL,TO_DATE('01/01/1990 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '', 'N' );


INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_8', 'Counter 8', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_9', 'Counter 9', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 

INSERT INTO EG_LOCATION (ID, NAME, DESCRIPTION, LOCATIONID, CREATEDDATE, LASTMODIFIEDDATE, ISACTIVE, ISLOCATION) 
VALUES (SEQ_EG_LOCATION.NEXTVAL, 'COUNTER_10', 'Counter 10', (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'RECEIPT_COLLETION'), SYSDATE,  SYSDATE, 1, 0); 


INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='acc_coll_op'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_8'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 

INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='acc_coll_manager'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_9'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 

INSERT INTO EG_USERCOUNTER_MAP (ID, USERID, COUNTERID, FROMDATE, TODATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (SEQ_EG_USERCOUNTER_MAP.NEXTVAL, (SELECT ID_USER FROM EG_USER WHERE USER_NAME='acc_coll_ao'), (SELECT ID FROM EG_LOCATION WHERE NAME LIKE 'COUNTER_10'),  TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),  TO_Date( '12/31/2099 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'), 1, SYSDATE); 



#DOWN
