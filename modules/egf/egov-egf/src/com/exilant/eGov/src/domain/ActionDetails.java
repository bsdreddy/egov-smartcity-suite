
/*
 * Created on Jun 20, 2007
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.exilant.eGov.src.domain;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.exilant.exility.updateservice.PrimaryKeyGenerator;

/**
 * @author Sapna
 * @version 1.0
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ActionDetails {
		private static final Logger LOGGER=Logger.getLogger(ActionDetails.class);

		// Fields

		private String id;
		private String moduletype;
		private String moduleid;

		private String actionDoneBy;
		private String actionDoneOn;
		private String actionDetcomments="";
		private String createdby;

		private String lastmodifieddate;
		private String actionType ;

		/**
		 * @return Returns the actionDetcomments.
		 */
		public String getActionDetcomments() {
			return actionDetcomments;
		}
		/**
		 * @param actionDetcomments The actionDetcomments to set.
		 */
		public void setActionDetcomments(final String actionDetcomments) {
			this.actionDetcomments = actionDetcomments;
		}
		/**
		 * @return Returns the actionDoneBy.
		 */
		public String getActionDoneBy() {
			return actionDoneBy;
		}
		/**
		 * @param actionDoneBy The actionDoneBy to set.
		 */
		public void setActionDoneBy(final String actionDoneBy) {
			this.actionDoneBy = actionDoneBy;
		}
		/**
		 * @return Returns the actionDoneOn.
		 */
		public String getActionDoneOn() {
			return actionDoneOn;
		}
		/**
		 * @param actionDoneOn The actionDoneOn to set.
		 */
		public void setActionDoneOn(final String actionDoneOn) {
			this.actionDoneOn = actionDoneOn;
		}
		/**
		 * @return Returns the actionType.
		 */
		public String getActionType() {
			return actionType;
		}
		/**
		 * @param actionType The actionType to set.
		 */
		public void setActionType(final String actionType) {
			this.actionType = actionType;
		}
		/**
		 * @return Returns the created by.
		 */
		public String getCreatedby() {
			return createdby;
		}
		/**
		 * @param createdby The createdby to set.
		 */
		public void setCreatedby(final String createdby) {
			this.createdby = createdby;
		}
		/**
		 * @return Returns the id.
		 */
		public String getId() {
			return id;
		}
		/**
		 * @param id The id to set.
		 */
		public void setId(String id) {
			this.id = id;
		}
		/**
		 * @return Returns the lastmodifieddate.
		 */
		public String getLastmodifieddate() {
			return lastmodifieddate;
		}
		/**
		 * @param lastmodifieddate The lastmodifieddate to set.
		 */
		public void setLastmodifieddate(String lastmodifieddate) {
			this.lastmodifieddate = lastmodifieddate;
		}
		/**
		 * @return Returns the moduleid.
		 */
		public String getModuleid() {
			return moduleid;
		}
		/**
		 * @param moduleid The moduleid to set.
		 */
		public void setModuleid(final String moduleid) {
			this.moduleid = moduleid;
		}
		/**
		 * @return Returns the moduletype.
		 */
		public String getModuletype() {
			return moduletype;
		}
		/**
		 * @param moduletype The moduletype to set.
		 */
		public void setModuletype(final String moduletype) {
			this.moduletype = moduletype;
		}
		/**
		 * This method inserts the record in the EGW_SATUSCHANGE table
		 * @param connection
		 * @return
		 */
				public boolean insert(final Connection connection)
					{
						String insertQuery="";
						Statement statement = null;
						setId(String.valueOf(PrimaryKeyGenerator.getNextKey("eg_actiondetails")) );
						LOGGER.debug("getID()---"+ getId());
						insertQuery = "INSERT INTO EG_ACTIONDETAILS (ID, MODULETYPE, MODULEID, ACTIONDONEBY,ACTIONDONEON,COMMENTS,CREATEDBY,LASTMODIFIEDDATE,ACTIONTYPE)"
							+ "VALUES("+this.id+",'"+this.moduletype+"',"+this.moduleid+","+this.actionDoneBy +",to_date('"+this.actionDoneOn+"','dd-Mon-yyyy HH24:MI:SS'), '"+this.actionDetcomments +"',"+this.createdby+", to_date('"+this.lastmodifieddate+"','dd-Mon-yyyy HH24:MI:SS'),'"+this.actionType +"')";
						LOGGER.debug("insertQuery: "+ insertQuery);
						try
						{
						 statement = connection.createStatement();
						 statement.executeUpdate(insertQuery);
						}
						catch(Exception insert){
							LOGGER.error("Exception in inserting EGW_SATUSCHANGE :"+insert);
							return false;
							}
						finally{
							try{
								statement.close();
							}catch(Exception e){LOGGER.error("Exp in finally");}
						}
						return true;
			}
}
