package org.egov.pims.model;

// Generated Jul 9, 2007 3:21:09 PM by Hibernate Tools 3.2.0.b9

import java.util.Date;

/**
 * TrainingPirticulars generated by hbm2java
 */
public class TrainingPirticulars implements java.io.Serializable
{

	private Integer trainingDetailsId;

	private PersonalInformation employeeId;

	private String course;

	private String institution;

	private String city;

	private Date potFrom;

	private Date potTo;

	public TrainingPirticulars()
	{
	}

	public TrainingPirticulars(
			String course,
			String institution, String city, Date potFrom, Date potTo)
	{

		this.course = course;
		this.institution = institution;
		this.city = city;
		this.potFrom = potFrom;
		this.potTo = potTo;
	}

	public Integer getTrainingDetailsId()
	{
		return this.trainingDetailsId;
	}

	public void setTrainingDetailsId(Integer trainingDetailsId)
	{
		this.trainingDetailsId = trainingDetailsId;
	}



	public String getCourse()
	{
		return this.course;
	}

	public void setCourse(String course)
	{
		this.course = course;
	}

	public String getInstitution()
	{
		return this.institution;
	}

	public void setInstitution(String institution)
	{
		this.institution = institution;
	}

	public String getCity()
	{
		return this.city;
	}

	public void setCity(String city)
	{
		this.city = city;
	}

	public Date getPotFrom()
	{
		return this.potFrom;
	}

	public void setPotFrom(Date potFrom)
	{
		this.potFrom = potFrom;
	}

	public Date getPotTo()
	{
		return this.potTo;
	}

	public void setPotTo(Date potTo)
	{
		this.potTo = potTo;
	}

	public PersonalInformation getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(PersonalInformation employeeId) {
		this.employeeId = employeeId;
	}

}
