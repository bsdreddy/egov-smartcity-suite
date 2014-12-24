 package com.exilant.eGov.src.domain;

// Generated Jul 30, 2007 12:27:25 PM by Hibernate Tools 3.2.0.b9

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.exilant.eGov.src.common.EGovernCommon;
import com.exilant.exility.common.TaskFailedException;
import com.exilant.exility.updateservice.PrimaryKeyGenerator;

/**
 * EgBilldetails generated by hbm2java
 */
public class EGBillDetails  {
	private static final Logger LOGGER=Logger.getLogger(EGBillDetails.class);
	private String id;
	private String billId;
	private String functionId=null; 
	private String glcodeId;
	private String debitAmount;
	private String creditAmount;
	private String lastUpdatedTime;
	private String updateQuery="UPDATE EG_BILLDETAILS SET";
	private boolean isId=false,isField=false;
	private String narration = "";	
		
	public String insert(Connection connection) throws SQLException,TaskFailedException
	{
		EGovernCommon commommethods = new EGovernCommon();
		setId( String.valueOf(PrimaryKeyGenerator.getNextKey("EG_BILLDETAILS")));
		narration = commommethods.formatString(narration);
		String insertQuery = "INSERT INTO EG_BILLDETAILS (Id, BillId, functionid,GlcodeId, " +
						"debitamount, creditAmount,lastUpdatedTime,Narration) " +
						"VALUES (" + id + ", " + billId + ", " +functionId+", " + glcodeId + "," + debitAmount +"," + creditAmount + ",to_date('"+this.lastUpdatedTime+"','dd-Mon-yyyy HH24:MI:SS'),'"+narration+"')";
		LOGGER.info(insertQuery);
		Statement statement = connection.createStatement();
		statement.executeUpdate(insertQuery);
		statement.close();
		return id;
	}

	public String update (Connection connection) throws SQLException,TaskFailedException
	{
		if(isId && isField)
		{
			updateQuery = updateQuery.substring(0,updateQuery.length()-1);
			updateQuery = updateQuery + " WHERE id = " + id;

			LOGGER.info(updateQuery);
			Statement statement = connection.createStatement();
			statement.executeUpdate(updateQuery);
			statement.close();
			updateQuery="UPDATE EG_BILLDETAILS SET";
			
		}
		return id;
	}
	
	public void setId(String aId){ id = aId; isId=true;isField = true;}
	public int getId() {return Integer.valueOf(id).intValue(); }
	public void setBillId(String aBillId){ billId = aBillId; updateQuery = updateQuery + " billId=" + billId + ",";isField = true;}
	public void setGlcodeId(String aGlcodeId){glcodeId = aGlcodeId; updateQuery = updateQuery + " glcodeId=" + glcodeId + ","; isField = true;}
	public void setLastUpdatedTime(String aLastModifiedDate){ lastUpdatedTime = aLastModifiedDate; updateQuery = updateQuery + " lastUpdatedTime=to_date('" + lastUpdatedTime + "','dd-Mon-yyyy HH24:MI:SS')"+","; isField = true;}
	public void setDebitAmount(String aDebitAmount){ debitAmount=aDebitAmount;updateQuery=updateQuery+" debitAmount ="+debitAmount+" ,"; isField=true;}
	public void setCreditAmount(String aCreditAmount){ creditAmount=aCreditAmount;updateQuery=updateQuery+" creditAmount ="+creditAmount+" ,"; isField=true;}
	public void setFunctionId(String aFunctionId){ functionId=aFunctionId;updateQuery=updateQuery+" functionId ="+functionId+" ,"; isField=true;}
	public void setNarration(String aNarration){ narration = aNarration; updateQuery = updateQuery + " Narration='" + narration + "',"; isField = true;}

public void delete(Connection con)throws SQLException,TaskFailedException
{
	String delQuery="delete from EG_BILLDETAILS where id="+getId();
	LOGGER.info(delQuery);
	Statement statement = con.createStatement();
	statement.executeUpdate(delQuery);
	statement.close();

}
}

	
	
	

	

	