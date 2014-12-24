/*
 * @(#)LicenseUtils.java 3.0, 29 Jul, 2013 1:24:26 PM
 * Copyright 2013 eGovernments Foundation. All rights reserved. 
 * eGovernments PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package org.egov.license.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;

import org.apache.log4j.Logger;
import org.egov.commons.ContractorGrade;
import org.egov.commons.Installment;
import org.egov.commons.dao.CommonsDaoFactory;
import org.egov.commons.dao.InstallmentDao;
import org.egov.demand.model.EgBill;
import org.egov.demand.model.EgBillDetails;
import org.egov.demand.model.EgDemand;
import org.egov.demand.model.EgDemandDetails;
import org.egov.erpcollection.integration.models.BillReceiptInfo;
import org.egov.erpcollection.integration.models.ReceiptInstrumentInfo;
import org.egov.erpcollection.integration.services.CollectionIntegrationService;
import org.egov.exceptions.EGOVRuntimeException;
import org.egov.infstr.commons.Module;
import org.egov.infstr.commons.dao.GenericDaoFactory;
import org.egov.infstr.commons.dao.ModuleHibDao;
import org.egov.infstr.config.AppConfigValues;
import org.egov.infstr.config.dao.AppConfigValuesDAO;
import org.egov.infstr.models.State;
import org.egov.infstr.services.PersistenceService;
import org.egov.infstr.services.SessionFactory;
import org.egov.infstr.utils.HibernateUtil;
import org.egov.lib.address.model.Address;
import org.egov.lib.admbndry.Boundary;
import org.egov.lib.admbndry.BoundaryDAO;
import org.egov.lib.admbndry.BoundaryType;
import org.egov.lib.admbndry.BoundaryTypeDAO;
import org.egov.lib.admbndry.HeirarchyType;
import org.egov.lib.admbndry.HeirarchyTypeDAO;
import org.egov.lib.rjbac.dept.Department;
import org.egov.lib.rjbac.dept.dao.DepartmentDAO;
import org.egov.lib.rjbac.role.Role;
import org.egov.lib.rjbac.user.User;
import org.egov.lib.rjbac.user.dao.UserDAO;
import org.egov.license.domain.entity.License;
import org.egov.license.domain.entity.LicenseStatus;
import org.egov.license.domain.entity.LicenseStatusValues;
import org.egov.license.domain.entity.SubCategory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

// import org.egov.works.services.ContractorService;

public class LicenseUtils {
	private static final Logger LOGGER = Logger.getLogger(LicenseUtils.class);
	public static final String ADMIN_HIERARCHY_TYPE = "ADMINISTRATION";
	private static final String ZONE_BOUNDARY_TYPE = "Zone";
	private static final String WARD_BOUNDARY_TYPE = "Ward";
	private static final String CITY_BOUNDARY_TYPE = "City";
	public static final String LOCATION_HIERARCHY_TYPE = "LOCATION";
	private static final String DEMAND_ID = "demandId";
	private PersistenceService persistenceService;
	private ModuleHibDao<Module, Integer> moduleDAO;
	private BoundaryDAO boundaryDAO;
	private BoundaryTypeDAO boundaryTypeDAO;
	private HeirarchyTypeDAO heirarchyTypeDAO;
	protected CollectionIntegrationService collectionIntegrationService;

	public void setHeirarchyTypeDAO(final HeirarchyTypeDAO heirarchyTypeDAO) {
		this.heirarchyTypeDAO = heirarchyTypeDAO;
	}

	public void setCollectionIntegrationService(final CollectionIntegrationService collectionIntegrationService) {
		this.collectionIntegrationService = collectionIntegrationService;
	}

	public void setBoundaryTypeDAO(final BoundaryTypeDAO boundaryTypeDAO) {
		this.boundaryTypeDAO = boundaryTypeDAO;
	}

	public void setBoundaryDAO(final BoundaryDAO boundaryDAO) {
		this.boundaryDAO = boundaryDAO;
	}

	public void setModuleDAO(final ModuleHibDao<Module, Integer> moduleDAO) {
		this.moduleDAO = moduleDAO;
	}

	public Module getModule(final String moduleName) {
		return this.moduleDAO.getModuleByName(moduleName);
	}

	public void setPersistenceService(final PersistenceService persistenceService) {
		this.persistenceService = persistenceService;
	}

	public LicenseUtils() {
		this.session = HibernateUtil.getCurrentSession();
	}

	public LicenseUtils(final SessionFactory factory) {
		this.sessionFactory = factory;
	}

	// private TradeIdGenerator generator;
	private Session session;
	private SessionFactory sessionFactory;
	// TODO move license should not depends on works
	// private ContractorService contractorService;
	private final HashMap<String, Object> contractorDetailsMap = new HashMap<String, Object>();

	protected Session getHibSession() {
		if (this.sessionFactory != null) {
			return this.sessionFactory.getSession();
		}
		return this.session;
	}

	public Boundary getBoundary(final String id) {
		return this.boundaryDAO.getBoundary(Integer.valueOf(id));
	}

	/**
	 * called while fetching the child boundaries for a given boundary
	 * @param String boundaryId
	 * @exception EGOVRuntimeException
	 * @return List<Boundary> child boundaries
	 */
	public List<Boundary> getChildBoundaries(final String boundaryId) {
		List<Boundary> cBoundaries = null;
		try {
			cBoundaries = this.boundaryDAO.getChildBoundaries(boundaryId);
		} catch (final Exception e) {
			LOGGER.error("getChildBoundaries()--Exception is thrown");
			throw new EGOVRuntimeException("Unable to load boundary information", e);
		}
		return cBoundaries;
	}

	public String findGlCodeForDemand(final EgDemand demand) {
		String glCode = Constants.EMPTY_STRING;
		for (final EgDemandDetails demandDetails : demand.getEgDemandDetails()) {
			if (!Constants.PENALTY_CODE.equals(demandDetails.getEgDemandReason().getEgDemandReasonMaster().getCode())) {
				final StringBuilder strBuf = new StringBuilder(2000);
				strBuf.append(" select ch.glcode from CChartOfAccounts ch, EgDemandDetails demDet where demDet.id=:demandId and demDet.egDemandReason.glcodeId.id=ch.id");
				final Query qry = this.getSession().createQuery(strBuf.toString()).setLong(LicenseUtils.DEMAND_ID, demandDetails.getId());
				glCode = (String) qry.uniqueResult();
			}
		}
		return glCode;
	}

	@SuppressWarnings("unchecked")
	public List<Boundary> getCrossHeirarchyChildren(final String hierarchyType, final String boundaryType, final int boundaryId) {
		HeirarchyType hType = null;
		try {
			hType = this.heirarchyTypeDAO.getHierarchyTypeByName(hierarchyType);
		} catch (final Exception e) {
			LOGGER.error("getCrossHeirarchyChildren()--Exception");
			throw new EGOVRuntimeException("Unable to load hierarchy information", e);
		}
		final BoundaryType childBoundaryType = this.boundaryTypeDAO.getBoundaryType(boundaryType, hType);
		final Boundary parentBoundary = this.boundaryDAO.getBoundaryById(boundaryId);
		return new LinkedList(this.boundaryDAO.getCrossHeirarchyChildren(parentBoundary, childBoundaryType));
	}

	// Fetch HeirarchyType
	@SuppressWarnings("unchecked")
	public List<Boundary> getAllZone() {
		HeirarchyType hType = null;
		try {
			hType = this.heirarchyTypeDAO.getHierarchyTypeByName(LicenseUtils.ADMIN_HIERARCHY_TYPE);
		} catch (final Exception e) {
			LOGGER.error("getAllZone()--Exception");
			throw new EGOVRuntimeException("Unable to load Heirarchy information", e);
		}
		List<Boundary> zoneList = null;
		final BoundaryType bType = this.boundaryTypeDAO.getBoundaryType(LicenseUtils.ZONE_BOUNDARY_TYPE, hType);
		zoneList = this.boundaryDAO.getAllBoundariesByBndryTypeId(bType.getId());
		return zoneList;
	}

	// Fetch HeirarchyType
	@SuppressWarnings("unchecked")
	public List<Boundary> getAllCity() {
		HeirarchyType hType = null;
		try {
			hType = this.heirarchyTypeDAO.getHierarchyTypeByName(LicenseUtils.ADMIN_HIERARCHY_TYPE);
		} catch (final Exception e) {
			LOGGER.error("getAllCity()--Exception");
			throw new EGOVRuntimeException("Unable to load Heirarchy information", e);
		}
		List<Boundary> cityList = null;
		final BoundaryType bType = this.boundaryTypeDAO.getBoundaryType(LicenseUtils.CITY_BOUNDARY_TYPE, hType);
		cityList = this.boundaryDAO.getAllBoundariesByBndryTypeId(bType.getId());
		return cityList;
	}

	// Fetch HeirarchyType
	@SuppressWarnings("unchecked")
	public List<Boundary> getAllWard() {
		HeirarchyType hType = null;
		try {
			hType = this.heirarchyTypeDAO.getHierarchyTypeByName(LicenseUtils.ADMIN_HIERARCHY_TYPE);
		} catch (final Exception e) {
			LOGGER.error("getAllWard()--Exception");
			throw new EGOVRuntimeException("Unable to load Heirarchy information", e);
		}
		List<Boundary> wardList = null;
		final BoundaryType bType = this.boundaryTypeDAO.getBoundaryType(LicenseUtils.WARD_BOUNDARY_TYPE, hType);
		wardList = this.boundaryDAO.getAllBoundariesByBndryTypeId(bType.getId());
		return wardList;
	}

	public static String getInstallmentString(final Date date) {
		final int Year = date.getYear() % 100;
		return (Year / 10 > 0 ? Year : "0" + Year) + "-" + (((Year + 1) % 100) / 10 > 0 ? (Year + 1) : "0" + ((Year + 1) % 100));
	}

	public static String getYearString(final Date date) {
		final int Year = date.getYear() % 100;
		final Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return (calendar.get(Calendar.YEAR)) + "-" + (((Year + 1) % 100) / 10 > 0 ? (Year + 1) : "0" + ((Year + 1) % 100));
	}

	/**
	 * Gets the predefined Application Configuration values for the requested Keys
	 * @param String key
	 * @param String moduleName
	 * @return the app config value for the key
	 */
	public String getAppConfigValue(final String key, final String moduleName) {
		String value = Constants.EMPTY_STRING;
		final AppConfigValuesDAO appConfValDao = GenericDaoFactory.getDAOFactory().getAppConfigValuesDAO();
		final AppConfigValues appConfigValues = appConfValDao.getAppConfigValueByDate(moduleName, key, new Date());
		value = appConfigValues.getValue();
		return value;
	}

	/**
	 * called while calculating the Total Bill Amount for Collecting TAX fetches the Demand Details & Installment
	 */
	protected Session getSession() {
		if (this.sessionFactory != null) {
			return this.sessionFactory.getSession();
		}
		return this.session;
	}

	public String getInstallDescription(final Installment dmdInstallment) {
		return "License Fee for " + LicenseUtils.getYearString(dmdInstallment.getFromDate());
	}

	public String getParameterValue(final String field, final Map<String, String[]> parameters) {
		final String[] fieldArray = parameters.get(field);
		return fieldArray != null ? fieldArray[0] : null;
	}

	public static boolean validateByRegex(final String value, final String regex) {
		if (value == null) {
			return false;
		}
		final java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
		final Matcher m = pattern.matcher(value);
		return m.matches();
	}

	public static String validateEffecFrom(final Date newEffecFrom, final Date oldEffecFrom) {
		if (!newEffecFrom.after(new Date()) || org.apache.commons.lang.time.DateUtils.isSameDay(newEffecFrom, new Date())) {
			return "tradelicense.error.effectivefrom.currentdate";
		}
		if (!newEffecFrom.after(oldEffecFrom)) {
			return "tradelicense.error.effectivefrom.after";
		}
		return null;
	}

	public boolean checkOverlap(final Long iFrom, final Long iFrom_Base, final Long iTo, final Long iTo_Base) {
		if ((iFrom >= iFrom_Base) && (iTo <= iTo_Base)) {
			return true;
		} else if ((iFrom <= iFrom_Base) && (iTo > iFrom_Base) && (iTo <= iTo_Base)) {
			return true;
		} else if ((iFrom >= iFrom_Base) && (iFrom < iTo_Base) && (iTo >= iTo_Base)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @param simpleName Simple name is the name of the license Subclass and same name should be inserted to EGL_MSTR_LICENSE_TYPE table
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SubCategory> getAllTradeNames(final String simpleName) {
		return this.persistenceService.findAllBy("from org.egov.license.domain.entity.SubCategory where licenseType.name=?", simpleName);
	}

	/**
	 * @param simpleName Simple name is the name of the license Subclass and same name should be inserted to EGL_MSTR_LICENSE_TYPE table
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SubCategory> getAllTradeNamesByLicenseSubType(final String subType) {
		return this.persistenceService.findAllBy("from org.egov.license.domain.entity.SubCategory where licenseSubType.code=?", subType);
	}

	/**
	 * @param simpleName Simple name is the name of the license Subclass and same name should be inserted to EGL_MSTR_LICENSE_TYPE table
	 * @return
	 */
	public LicenseStatus getLicenseStatusbyCode(final String statusCode) {
		return (LicenseStatus) this.persistenceService.find("FROM org.egov.license.domain.entity.LicenseStatus where statusCode=?", statusCode);
	}

	public LicenseStatusValues getCurrentStatus(final License license) {
		// Set licenseStatusValSet=license.getLicenseStatusValuesSet();
		return (LicenseStatusValues) this.persistenceService.find("from org.egov.license.domain.entity.LicenseStatusValues  where license=? and active=true", license);
	}

	public Map<Integer, String> getCancellationReasonMap() {
		final Map<Integer, String> reasonMap = new TreeMap<Integer, String>();
		reasonMap.put(Constants.REASON_CANCELLATION_NO_1, Constants.REASON_CANCELLATION_VALUE_1);
		reasonMap.put(Constants.REASON_CANCELLATION_NO_2, Constants.REASON_CANCELLATION_VALUE_2);
		reasonMap.put(Constants.REASON_CANCELLATION_NO_3, Constants.REASON_CANCELLATION_VALUE_3);
		return reasonMap;

	}

	public Map<Integer, String> getObjectionReasons() {
		final Map<Integer, String> objectionReasons = new TreeMap<Integer, String>();
		objectionReasons.put(Constants.REASON_OBJECTION_NO_1, Constants.REASON_OBJECTION_VALUE_1);
		objectionReasons.put(Constants.REASON_OBJECTION_NO_2, Constants.REASON_OBJECTION_VALUE_2);
		objectionReasons.put(Constants.REASON_OBJECTION_NO_3, Constants.REASON_OBJECTION_VALUE_3);
		return objectionReasons;
	}

	@SuppressWarnings("unchecked")
	public List<Department> getAllDepartments() {
		final DepartmentDAO deptDao = new DepartmentDAO();
		deptDao.getAllDepartments();
		return deptDao.getAllDepartments();
	}

	/**
	 * Returns the number of months between the the 2 given dates.
	 * @param startDate the start date
	 * @param endDate the end date
	 * @return the number of months
	 * @author Sapna
	 * @return
	 */
	public static int getNumberOfMonths(final java.util.Date expiryDate, final java.util.Date dateOfRenew) {
		// add one day to date of Expiry

		// assert startDate.before(endDate);
		final Calendar calendar = Calendar.getInstance();
		calendar.setTime(expiryDate);
		calendar.add(Calendar.DATE, 1);

		final int startMonth = calendar.get(Calendar.MONTH) + 1;
		final int startYear = calendar.get(Calendar.YEAR);
		calendar.setTime(dateOfRenew);
		int endMonth = calendar.get(Calendar.MONTH) + 1;
		final int endYear = calendar.get(Calendar.YEAR);
		int diffMonth = 0;
		if (startYear < endYear) {
			endMonth += (endYear - startYear) * 12;
		}
		diffMonth = endMonth - startMonth;
		// adding one month in the total difference of month as both dates are included
		return diffMonth + 1;
	}

	public static Installment getCurrInstallment(final Module module) {
		final InstallmentDao isntalDao = CommonsDaoFactory.getDAOFactory().getInstallmentDao();

		final Installment currentInstall = isntalDao.getInsatllmentByModuleForGivenDate(module, new Date());
		return currentInstall;

	}

	public List<Installment> getFinYearByDateRange(final Module module, final Date sDate, final Date eDate) {
		List<Installment> cFinancialYear = null;
		final Query query = getSession().createQuery("from Installment I where I.module=:module and (I.fromDate >= :fromYear AND I.toDate <=:toYear)");
		query.setEntity("module", module);
		query.setDate("fromYear", sDate);
		query.setDate("toYear", eDate);
		@SuppressWarnings("unchecked")
		final ArrayList<Installment> list = (ArrayList<Installment>) query.list();
		if (list.size() > 0) {
			cFinancialYear = list;
		}
		return cFinancialYear;
	}

	public Map<String, List<ReceiptInstrumentInfo>> getReceiptInfo(final License license) {
		// Set<EgBill> egBills = license.getLicenseDemand().getEgBills();
		final Set<EgBill> egBills = license.getCurrentDemand().getEgBills();

		final Set<String> egBillNumbers = new HashSet();
		String serviceCode = "";
		for (final EgBill bill : egBills) {
			egBillNumbers.add(bill.getId().toString());
			serviceCode = bill.getServiceCode();
		}
		final Map<String, List<BillReceiptInfo>> billReceipt = this.collectionIntegrationService.getBillReceiptInfo(serviceCode, egBillNumbers);
		List<BillReceiptInfo> billReceiptInfoList = null;
		List<ReceiptInstrumentInfo> instrumentInfoList = null;
		final Map<String, List<ReceiptInstrumentInfo>> map = new HashMap<String, List<ReceiptInstrumentInfo>>();

		for (final EgBill bill : egBills) {
			if (null != billReceipt.get(bill.getId().toString())) {
				billReceiptInfoList = billReceipt.get(bill.getId().toString());

				for (final EgBillDetails egd : bill.getEgBillDetails()) {

					egd.getEgBill().getId();

					for (final BillReceiptInfo billReceiptInfo : billReceiptInfoList) {
						if (billReceiptInfo.getBillReferenceNum().equalsIgnoreCase(String.valueOf(egd.getEgBill().getId()))) {
							for (final ReceiptInstrumentInfo instrumentInfo : billReceiptInfo.getInstrumentDetails()) {
								instrumentInfoList = new ArrayList<ReceiptInstrumentInfo>();
								instrumentInfoList.add(instrumentInfo);
							}
							map.put(egd.getEgDemandReason().getEgDemandReasonMaster().getCode(), instrumentInfoList);
						}
					}
				}
			}
		}
		return map;
	}

	public ContractorGrade getWorksEstimateDetailsForTradeName(final String tradeName) {
		ContractorGrade contractorGrade = null;
		try {
			final Query query = getSession().createQuery("from org.egov.commons.ContractorGrade cg where cg.code=:code");
			query.setString("code", tradeName);
			contractorGrade = (ContractorGrade) query.uniqueResult();
		} catch (final HibernateException e) {
			LOGGER.error("Error while loading getWorksEstimateDetailsForTradeName" + e.getMessage());
		}
		return contractorGrade;
	}

	public Map<String, BillReceiptInfo> getBillReceipt(final License license) {
		final Set<EgBill> egBills = license.getCurrentDemand().getEgBills();
		final Set<String> egBillNumbers = new HashSet();
		String serviceCode = "";
		for (final EgBill bill : egBills) {
			egBillNumbers.add(bill.getId().toString());
			serviceCode = bill.getServiceCode();
		}
		final Map<String, List<BillReceiptInfo>> billReceipt = this.collectionIntegrationService.getBillReceiptInfo(serviceCode, egBillNumbers);
		List<BillReceiptInfo> billReceiptInfoList = null;
		final Map<String, BillReceiptInfo> map = new HashMap<String, BillReceiptInfo>();

		for (final EgBill bill : egBills) {
			if (null != billReceipt.get(bill.getId().toString())) {
				billReceiptInfoList = billReceipt.get(bill.getId().toString());

				for (final EgBillDetails egd : bill.getEgBillDetails()) {

					egd.getEgBill().getId();

					for (final BillReceiptInfo billReceiptInfo : billReceiptInfoList) {
						if (billReceiptInfo.getBillReferenceNum().equalsIgnoreCase(String.valueOf(egd.getEgBill().getId()))) {
							map.put(egd.getEgDemandReason().getEgDemandReasonMaster().getCode(), billReceiptInfo);
						}
					}
				}
			}
		}
		return map;
	}

	public String getRolesForUserId(final Integer userId) {
		LOGGER.debug("Entered into getRolesForUserId method");
		LOGGER.debug("User id : " + userId);
		final UserDAO userDao = new UserDAO();
		String roleName;
		final List<String> roleNameList = new ArrayList<String>();
		final User user = userDao.getUserByID(userId);
		for (final Role role : user.getRoles()) {
			roleName = role.getRoleName() != null ? role.getRoleName() : "";
			roleNameList.add(roleName.toUpperCase());
		}
		LOGGER.debug("Exit from method getRolesForUserId with return value : " + roleNameList.toString().toUpperCase());
		return roleNameList.toString().toUpperCase();
	}

	/*
	 * public void createContractorForDepartment(License license, String status) throws ValidationException { contractorDetailsMap = createContractorDetailsMap(license, status); contractorService.createContractorForDepartment(contractorDetailsMap); }
	 */

	public HashMap<String, Object> createContractorDetailsMap(final License license, final String status) {
		HashMap<String, Object> contractorMap = new HashMap<String, Object>();
		contractorMap = new HashMap<String, Object>();
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getContractorCode()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getContractorCode())) {
			contractorMap.put(Constants.WORKS_KEY_CODE, license.getContractorCode());
		} else if (!org.apache.commons.lang.StringUtils.isBlank(license.getLicenseNumber()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getLicenseNumber())) {
			contractorMap.put(Constants.WORKS_KEY_CODE, license.getLicenseNumber());
		}
		String deptCode = null;
		if (license.getTradeName().getLicenseType().getModule().getModuleName().equalsIgnoreCase(Constants.PWDLICENSE_MODULENAME)) {
			deptCode = Constants.PWD_DEPT_CODE;
		} else if (license.getTradeName().getLicenseType().getModule().getModuleName().equalsIgnoreCase(Constants.ELECTRICALLICENSE_MODULENAME)) {
			deptCode = Constants.ELECTRICAL_DEPT_CODE;
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(deptCode) && !org.apache.commons.lang.StringUtils.isEmpty(deptCode)) {
			contractorMap.put(Constants.WORKS_KEY_DEPT_CODE, deptCode);
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getLicensee().getApplicantName()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getLicensee().getApplicantName())) {
			contractorMap.put(Constants.WORKS_KEY_NAME, license.getLicensee().getApplicantName());
		}
		final Address address = license.getLicensee().getAddress();
		if (!org.apache.commons.lang.StringUtils.isBlank(address.getHouseNo()) && !org.apache.commons.lang.StringUtils.isEmpty(address.getHouseNo())) {
			final String streetAddress = address.getHouseNo();
			if (address.getStreetAddress1() != null) {
				streetAddress.concat(address.getStreetAddress1());
			}
			contractorMap.put(Constants.WORKS_KEY_CORRES_ADDR, streetAddress);
		}
		// contractorMap.put(Constants.WORKS_KEY_PAYMENT_ADDR ,"");
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getLicensee().getApplicantName()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getLicensee().getApplicantName())) {
			contractorMap.put(Constants.WORKS_KEY_CONTACT_PERSON, license.getLicensee().getApplicantName());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getLicensee().getEmailId()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getLicensee().getEmailId())) {
			contractorMap.put(Constants.WORKS_KEY_EMAIL, license.getLicensee().getEmailId());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getRemarks()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getRemarks())) {
			contractorMap.put(Constants.WORKS_KEY_NARRATION, license.getRemarks());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getCompanyPanNumber()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getCompanyPanNumber())) {
			contractorMap.put(Constants.WORKS_KEY_PAN_NUMBER, license.getCompanyPanNumber());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getTinNumber()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getTinNumber())) {
			contractorMap.put(Constants.WORKS_KEY_TIN_NUMBER, license.getTinNumber());
		}
		// contractorMap.put(Constants.WORKS_KEY_BANK_CODE ,"");
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getBankIfscCode()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getBankIfscCode())) {
			contractorMap.put(Constants.WORKS_KEY_IFSC_CODE, license.getBankIfscCode());
		}
		// contractorMap.put(Constants.WORKS_KEY_BANK_ACCOUNT,"");
		// contractorMap.put(Constants.WORKS_KEY_APPROVAL_CODE ,"");
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getLicenseNumber()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getLicenseNumber())) {
			contractorMap.put(Constants.WORKS_KEY_REG_NUM, license.getLicenseNumber());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(status) && !org.apache.commons.lang.StringUtils.isEmpty(status)) {
			contractorMap.put(Constants.WORKS_KEY_STATUS, status);
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getTradeName().getName()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getTradeName().getName())) {
			final ContractorGrade contr = getWorksEstimateDetailsForTradeName(license.getTradeName().getName());
			contractorMap.put(Constants.WORKS_KEY_CLASS, contr.getGrade());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getDateOfCreation().toString()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getDateOfCreation().toString())) {
			contractorMap.put(Constants.WORKS_KEY_STARTDATE, license.getDateOfCreation());
		}
		if (!org.apache.commons.lang.StringUtils.isBlank(license.getDateOfExpiry().toString()) && !org.apache.commons.lang.StringUtils.isEmpty(license.getDateOfExpiry().toString())) {
			contractorMap.put(Constants.WORKS_KEY_END_DATE, license.getDateOfExpiry());
		}
		return contractorMap;
	}

	// TODO move
	/*
	 * public void updateContractorForDepartment(License license, String updateType, String status) throws ValidationException { contractorDetailsMap = createContractorDetailsMap(license, status); // Set any of these values to WORKS_KEY_CONTRACTOR_UPDATE_TYPE 'Renewal', 'Update', 'Upgrade',
	 * 'Inactive' contractorDetailsMap.put(Constants.WORKS_KEY_CONTRACTOR_UPDATE_TYPE,updateType); contractorService.updateContractorForDepartment(contractorDetailsMap); }
	 */

	/*
	 * public Boolean checkActiveContractorExistsForPwd(String contractorCode) { Boolean contractorExist = false; Long contractorId = contractorService.getActiveContractorForDepartment(contractorCode, Constants.PWD_DEPT_CODE); if(contractorId!=null) contractorExist = true; return contractorExist; }
	 */

	@SuppressWarnings("unchecked")
	public Boolean checkApprovedLicenseContractorExists(final String contractorCode, final String moduleName) {
		Boolean contractorExist = false;
		License license = null;
		final Query query = getSession().createQuery("from org.egov.license.domain.entity.License lic where lic.contractorCode is not null and lic.contractorCode=:contrCode and lic.tradeName.licenseType.module.moduleName =:moduleName");
		query.setString("contrCode", contractorCode);
		query.setString("moduleName", moduleName);
		final List licenseList = query.list();
		final Iterator itrLic = licenseList.iterator();
		while (itrLic.hasNext()) {
			license = (License) itrLic.next();
			if (license.getState() != null) {
				final List<State> states = license.getState().getHistory();
				for (final State state : states) {
					if (state.getValue().contains(Constants.WORKFLOW_STATE_TYPE_CREATENEWLICENSE + Constants.WORKFLOW_STATE_APPROVED)) {
						contractorExist = true;
						break;
					}
				}
			} else {
				if (license.getOldLicenseNumber() != null && license.getStatus().getStatusCode().equals("ACT")) {
					contractorExist = true;
				}
			}
			if (contractorExist == true) {
				break;
			}
		}
		return contractorExist;
	}

	// TODO Move
	/*
	 * public void setContractorService(ContractorService contractorService) { this.contractorService = contractorService; }
	 */
}
