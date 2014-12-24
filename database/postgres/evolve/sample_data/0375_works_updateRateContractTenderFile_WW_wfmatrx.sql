#UP

--RateContract water works

delete from eg_wf_matrix where department='Water Works' and objecttype='RateContract';

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','NEW',null,null,'ASSISTANT ENGINEER,JUNIOR ENGINEER',null,'CREATED','Pending for Check','DEPUTY ENGINEER','CREATED','Forward,Cancel',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','RESUBMITTED',null,'Pending for Check','DEPUTY ENGINEER',null,'CHECKED','Pending for Approval','EXECUTIVE ENGINEER','CHECKED','Forward,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','CREATED',null,'Pending for Check','DEPUTY ENGINEER',null,'CHECKED','Pending for Approval','EXECUTIVE ENGINEER','CHECKED','Forward,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','CHECKED',null,'Pending for Approval','EXECUTIVE ENGINEER',null,'APPROVED','END',null,'APPROVED','Approve,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','REJECTED',null,null,'ASSISTANT ENGINEER,JUNIOR ENGINEER',null,'RESUBMITTED','Pending for Check','DEPUTY ENGINEER','RESUBMITTED','Forward,Cancel',null,null);

--AbstractEstiamte Quotation water works

delete from eg_wf_matrix where department='Water Works' and fromqty=0 and objectType ='AbstractEstimate';


Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','NEW',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','budgetApp','CREATED','Pending checking for Technical Sanction','DEPUTY ENGINEER','CREATED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','CREATED',null,'Pending checking for Technical Sanction','DEPUTY ENGINEER','budgetApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTION_CHECKED',null,'Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','budgetApp','TECH_SANCTIONED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTIONED',null,'Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','budgetApp','ADMIN_SANCTIONED','END',null,'ADMIN_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','REJECTED',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','budgetApp','RESUBMITTED','Pending checking for Technical Sanction','DEPUTY ENGINEER','RESUBMITTED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','RESUBMITTED',null,'Pending checking for Technical Sanction','DEPUTY ENGINEER','budgetApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','NEW',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','depositCodeApp','CREATED','Pending checking for Technical Sanction','DEPUTY ENGINEER','CREATED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','CREATED',null,'Pending checking for Technical Sanction','DEPUTY ENGINEER','depositCodeApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTION_CHECKED',null,'Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','depositCodeApp','TECH_SANCTIONED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTIONED',null,'Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','depositCodeApp','ADMIN_SANCTIONED','END',null,'ADMIN_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','REJECTED',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','depositCodeApp','RESUBMITTED','Pending checking for Technical Sanction','DEPUTY ENGINEER','RESUBMITTED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','RESUBMITTED',null,'Pending checking for Technical Sanction','DEPUTY ENGINEER','depositCodeApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','EXECUTIVE ENGINEER,DEPUTY ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);



#DOWN

--RateContract water works

delete from eg_wf_matrix where department='Water Works' and objecttype='RateContract';

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','NEW',null,null,'ASSISTANT ENGINEER,JUNIOR ENGINEER',null,'CREATED','Pending for Check','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','CREATED','Forward,Cancel',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','RESUBMITTED',null,'Pending for Check','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER',null,'CHECKED','Pending for Approval','EXECUTIVE ENGINEER','CHECKED','Forward,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','CREATED',null,'Pending for Check','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER',null,'CHECKED','Pending for Approval','EXECUTIVE ENGINEER','CHECKED','Forward,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','CHECKED',null,'Pending for Approval','EXECUTIVE ENGINEER',null,'APPROVED','END',null,'APPROVED','Approve,Reject',null,null);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','RateContract','REJECTED',null,null,'ASSISTANT ENGINEER,JUNIOR ENGINEER',null,'RESUBMITTED','Pending for Check','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','RESUBMITTED','Forward,Cancel',null,null);

--AbstractEstimate Quotatation water works

delete from eg_wf_matrix where department='Water Works' and fromqty=0 and objectType ='AbstractEstimate';


Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','NEW',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','budgetApp','CREATED','Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','CREATED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','CREATED',null,'Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','budgetApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTION_CHECKED',null,'Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','budgetApp','TECH_SANCTIONED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTIONED',null,'Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','budgetApp','ADMIN_SANCTIONED','END',null,'ADMIN_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','REJECTED',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','budgetApp','RESUBMITTED','Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','RESUBMITTED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','RESUBMITTED',null,'Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','budgetApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','NEW',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','depositCodeApp','CREATED','Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','CREATED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','CREATED',null,'Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','depositCodeApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTION_CHECKED',null,'Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','depositCodeApp','TECH_SANCTIONED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','TECH_SANCTIONED',null,'Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','depositCodeApp','ADMIN_SANCTIONED','END',null,'ADMIN_SANCTIONED','Approve,Reject',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','REJECTED',null,null,'JUNIOR ENGINEER,ASSISTANT ENGINEER','depositCodeApp','RESUBMITTED','Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','RESUBMITTED','Forward,Cancel',0,50000);

Insert into EG_WF_MATRIX (ID,DEPARTMENT,OBJECTTYPE,CURRENTSTATE,CURRENTSTATUS,PENDINGACTIONS,CURRENTDESIGNATION,ADDITIONALRULE,NEXTSTATE,NEXTACTION,NEXTDESIGNATION,NEXTSTATUS,VALIDACTIONS,FROMQTY,TOQTY) values (EG_WF_MATRIX_SEQ.nextVal,'Water Works','AbstractEstimate','RESUBMITTED',null,'Pending checking for Technical Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','depositCodeApp','TECH_SANCTION_CHECKED','Pending Admin Sanction','ASSISTANT ENGINEER,SPECIAL DESK OFFICER,EXECUTIVE ENGINEER','TECH_SANCTION_CHECKED','Forward,Reject',0,50000);




