package org.egov.ptis.actions.reports;

import static java.util.Calendar.YEAR;
import static org.egov.ptis.nmc.constants.NMCPTISConstants.REPORT_TEMPLATENAME_BAKAYAFERIST;
import static org.egov.ptis.nmc.constants.NMCPTISConstants.REVENUE_HIERARCHY_TYPE;
import static org.egov.ptis.nmc.constants.NMCPTISConstants.WARD_BNDRY_TYPE;
import static org.egov.ptis.nmc.constants.NMCPTISConstants.ZONE_BNDRY_TYPE;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.egov.commons.Installment;
import org.egov.infstr.reporting.engine.ReportRequest.ReportDataSourceType;
import org.egov.lib.admbndry.Boundary;
import org.egov.ptis.actions.common.CommonServices;
import org.egov.ptis.bean.AssesseeInfo;
import org.egov.ptis.bean.DemandCollInfo;
import org.egov.ptis.bean.ReportInfo;
import org.egov.ptis.bean.TaxInfo;
import org.egov.ptis.domain.entity.property.InstDmdCollMaterializeView;
import org.egov.ptis.domain.entity.property.PropertyMaterlizeView;
import org.egov.ptis.nmc.util.PropertyTaxUtil;
import org.egov.web.actions.ReportFormAction;
import org.egov.web.annotation.ValidationErrorPage;
import org.hibernate.Criteria;

@SuppressWarnings("serial")
@ParentPackage("egov")
public class BakayaFeristReportAction extends ReportFormAction {
	
	private static final String RESULT_NEW = "new";
	private static final Logger LOGGER = Logger.getLogger(BakayaFeristReportAction.class);
	
	private Integer zoneId;
	private Integer wardId;
	private Map<Integer, String> ZoneBndryMap;

	@Override
	public void prepare() {
		
		@SuppressWarnings("unchecked")
		List<Boundary> zoneList = persistenceService.findAllBy(
				"from BoundaryImpl BI where BI.boundaryType.name=? and BI.boundaryType.heirarchyType.name=? "
						+ "and BI.isHistory='N' order by BI.id", ZONE_BNDRY_TYPE, REVENUE_HIERARCHY_TYPE);
		
		setZoneBndryMap(CommonServices.getFormattedBndryMap(zoneList));
		prepareWardDropDownData(zoneId != null && !zoneId.equals(-1), wardId != null && !wardId.equals(-1));
	}
	
	public void prepareReport() {
		LOGGER.debug("Entered into prepareReport method");
		
		setDataSourceType(ReportDataSourceType.JAVABEAN);
		
		// Preparing the Bakaya Ferist report data
		
		ReportInfo reportInfo = prepareReportInfo();
		setReportData(reportInfo);
		
		LOGGER.debug("Exit from prepareReport method");
	}

	private ReportInfo prepareReportInfo() {		
		LOGGER.debug("Entered into prepareReportInfo method");
		
		ReportInfo reportInfo = new ReportInfo();
		
		Boundary zone = (Boundary) persistenceService.find(
				"from BoundaryImpl BI where BI.id = ? and BI.boundaryType.name=? and BI.boundaryType.heirarchyType.name=? "
						+ "and BI.isHistory='N' order by BI.id", getZoneId(), ZONE_BNDRY_TYPE, REVENUE_HIERARCHY_TYPE);
		Boundary ward = (Boundary) persistenceService.find(
				"from BoundaryImpl BI where BI.id = ? and BI.boundaryType.name=? and BI.boundaryType.heirarchyType.name=? "
						+ "and BI.isHistory='N' order by BI.id", getWardId(), WARD_BNDRY_TYPE, REVENUE_HIERARCHY_TYPE);
		
		reportInfo.setZoneNo(zone.getBoundaryNum().toString());
		reportInfo.setWardNo(ward.getBoundaryNum().toString());
		reportInfo.setPartNo("N/A");
		
		Installment currentInstallment = PropertyTaxUtil.getCurrentInstallment();
		
		Calendar installmentFromDate = Calendar.getInstance();
		installmentFromDate.setTime(currentInstallment.getFromDate());
		
		Calendar installmentToDate = Calendar.getInstance();
		installmentToDate.setTime(currentInstallment.getToDate());
		
		reportInfo.setCurrInstallment(installmentFromDate.get(YEAR) + "-" + installmentToDate.get(YEAR));
		
		List<AssesseeInfo> assesseeInfoList = prepareAssessees();
		List<DemandCollInfo> emptyDemandCollInfoList = Collections.emptyList();
		List<PropertyMaterlizeView> emptyPMVList = Collections.emptyList();
		
		reportInfo.setAssesseeInfoList(assesseeInfoList);
		reportInfo.setDemandCollInfoList(emptyDemandCollInfoList);
		//reportInfo.setPropMatViewList(emptyPMVList);
		
		LOGGER.debug("Exit from prepareReportInfo method");
		
		return reportInfo;
	}
	
	@SuppressWarnings("unchecked")
	private List<AssesseeInfo> prepareAssessees() {
		LOGGER.debug("Entered into prepareAssesseeInformation method");
		
		List<AssesseeInfo> assessees  = new ArrayList<AssesseeInfo>();
		List<PropertyMaterlizeView> properties = (List<PropertyMaterlizeView>) getPersistenceService()
				.getSession()
				.createQuery(
						"from PropertyMaterlizeView pmv left join fetch pmv.instDmdColl instDmdColl left join fetch instDmdColl.installment where pmv.wardID = ? order by pmv.propertyId asc")
				.setParameter(0, getWardId()).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		Installment currentInstallment = PropertyTaxUtil.getCurrentInstallment();
		//Module module = GenericDaoFactory.getDAOFactory().getModuleDao().getModuleByName(NMCPTISConstants.PTMODULENAME);
		/*Calendar installmentFromDate = Calendar.getInstance();
		Calendar installmentToDate = Calendar.getInstance();*/
		
		BigDecimal grandTotal = BigDecimal.ZERO;			
		
		for (PropertyMaterlizeView property : properties) {
			AssesseeInfo assessee = new AssesseeInfo();
			assessee.setIndexNo(property.getPropertyId());
			assessee.setHouseNo(property.getHouseNo());
			assessee.setOwnerName(property.getOwnerName());
			//assessee.setPropType(property.getPropertyType());
			
			Set<TaxInfo> taxInfos = new TreeSet<TaxInfo>(new Comparator<TaxInfo>() {

				@Override
				public int compare(TaxInfo o1, TaxInfo o2) {
					return o2.getInstallment().compareTo(o1.getInstallment());
				}
			});
			
			Set<InstDmdCollMaterializeView> demandDetailsAndInstallments = new TreeSet<InstDmdCollMaterializeView>(new Comparator<InstDmdCollMaterializeView>() {
				@Override
				public int compare(InstDmdCollMaterializeView o1, InstDmdCollMaterializeView o2) {
					return o1.getInstallment().compareTo(o2.getInstallment());
				}
			});
					
			demandDetailsAndInstallments.addAll(property.getInstDmdColl());
			
			grandTotal = BigDecimal.ZERO;
			
			for (InstDmdCollMaterializeView demandDetailsAndInstallment : demandDetailsAndInstallments) {
				TaxInfo taxInfo = new TaxInfo();

				/*
				 * Installment installment = (Installment) CommonsDaoFactory.getDAOFactory().getInstallmentDao()
				 * .findById(demandDetailsAndInstallment.getInstallment().getId(), true);
				 */

				/*
				 * installmentFromDate.setTime(installment.getFromDate());
				 * installmentToDate.setTime(installment.getToDate());
				 */

				// taxInfo.setInstallment(installmentFromDate.get(YEAR) + "-" + installmentToDate.get(YEAR));
				taxInfo.setInstallment(demandDetailsAndInstallment.getInstallment().toString());
				taxInfo.setConservancyTax(demandDetailsAndInstallment.getSewerageTax()
						.subtract(demandDetailsAndInstallment.getSewerageTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setGeneralTax(demandDetailsAndInstallment.getGeneralTax()
						.subtract(demandDetailsAndInstallment.getGeneralTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setWaterTax(demandDetailsAndInstallment.getWaterTax()
						.subtract(demandDetailsAndInstallment.getWaterTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setFireServiceTax(demandDetailsAndInstallment.getFireTax()
						.subtract(demandDetailsAndInstallment.getFireTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setLightTax(demandDetailsAndInstallment.getLightTax()
						.subtract(demandDetailsAndInstallment.getLightTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setEduCess(demandDetailsAndInstallment
						.getEduCessNonResdTax()
						.add(demandDetailsAndInstallment.getEduCessResdTax())
						.subtract(
								demandDetailsAndInstallment.getEduCessNonResdTaxColl().add(
										demandDetailsAndInstallment.getEduCessResdTaxColl()))
						.setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setEgsCess(demandDetailsAndInstallment.getEgsTax()
						.subtract(demandDetailsAndInstallment.getEgsTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setBigBuildingCess(demandDetailsAndInstallment.getBigBldgTax()
						.subtract(demandDetailsAndInstallment.getBigBldgTaxColl()).setScale(2, BigDecimal.ROUND_HALF_UP));
				taxInfo.setTotal(demandDetailsAndInstallment
						.getSewerageTax().subtract(demandDetailsAndInstallment.getSewerageTaxColl())
						.add(demandDetailsAndInstallment.getGeneralTax().subtract(
								demandDetailsAndInstallment.getGeneralTaxColl()))
						.add(demandDetailsAndInstallment.getWaterTax().subtract(
								demandDetailsAndInstallment.getWaterTaxColl()))
						.add(demandDetailsAndInstallment.getFireTax().subtract(
								demandDetailsAndInstallment.getFireTaxColl()))
						.add(demandDetailsAndInstallment.getLightTax().subtract(
								demandDetailsAndInstallment.getLightTaxColl()))
						.add(demandDetailsAndInstallment.getEduCessNonResdTax().subtract(
								demandDetailsAndInstallment.getEduCessNonResdTaxColl()))
						.add(demandDetailsAndInstallment.getEduCessResdTax().subtract(
								demandDetailsAndInstallment.getEduCessResdTaxColl()))
						.add(demandDetailsAndInstallment.getEgsTax().subtract(
								demandDetailsAndInstallment.getEgsTaxColl()))
						.add(demandDetailsAndInstallment.getBigBldgTax().subtract(
								demandDetailsAndInstallment.getBigBldgTaxColl())).setScale(2, BigDecimal.ROUND_HALF_UP));

				grandTotal = grandTotal.add(taxInfo.getTotal());

				if (currentInstallment.equals(demandDetailsAndInstallment.getInstallment())) {
					taxInfo.setGrandTotal(grandTotal.setScale(2, BigDecimal.ROUND_HALF_UP));
				}
				if (!taxInfo.getTotal().equals(BigDecimal.ZERO.setScale(2))) {
					taxInfos.add(taxInfo);
				}
			}
			assessee.setTaxInfoList(new ArrayList<TaxInfo>(taxInfos));
			assessees.add(assessee);
		}
		
		LOGGER.debug("Exit from prepareReportInfo method");
		
		return assessees;
	}
	
	@SuppressWarnings("unchecked")
	private void prepareWardDropDownData(boolean zoneExists, boolean wardExists) {
		LOGGER.debug("Entered into prepareWardDropDownData method");
		LOGGER.debug("Zone Exists ? : " + zoneExists + ", " + "Ward Exists ? : " + wardExists);
		if (zoneExists && wardExists) {
			List<Boundary> wardNewList = new ArrayList<Boundary>();
			wardNewList = getPersistenceService()
					.findAllBy(
							"from BoundaryImpl BI where BI.boundaryType.name=? and BI.parent.id = ? and BI.isHistory='N' order by BI.name ",
							WARD_BNDRY_TYPE, getZoneId());
			addDropdownData("wardList", wardNewList);
		} else {
			addDropdownData("Wards", Collections.EMPTY_LIST);
		}
		LOGGER.debug("Exit from prepareWardDropDownData method");
	}
	
	@SkipValidation
	public String newForm() {		
		return RESULT_NEW;
	}
	
	@ValidationErrorPage(value="new")
	public String report() {
		return super.report();
	}
	
	
	@Override
	public String criteria() {
		return null;
	}

	@Override
	protected String getReportTemplateName() {
		return REPORT_TEMPLATENAME_BAKAYAFERIST;
	}
	
	public void validateReport() {
		LOGGER.debug("Entered into validateReport method");
		
		if (getZoneId() == null || getZoneId() == -1) {
			addActionError(getText("mandatory.zone"));
		}
		
		if (getWardId() == null || getWardId() == -1) {
			addActionError(getText("mandatory.ward"));
		}
		
		LOGGER.debug("Exiting from validateReport method");
	}

	public Integer getZoneId() {
		return zoneId;
	}

	public void setZoneId(Integer zoneId) {
		this.zoneId = zoneId;
	}

	public Integer getWardId() {
		return wardId;
	}

	public void setWardId(Integer wardId) {
		this.wardId = wardId;
	}

	public Map<Integer, String> getZoneBndryMap() {
		return ZoneBndryMap;
	}

	public void setZoneBndryMap(Map<Integer, String> zoneBndryMap) {
		ZoneBndryMap = zoneBndryMap;
	}		
}
