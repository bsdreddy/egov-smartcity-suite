/*
 * FloorWiseTaxDetails.java Created on Nov 24, 2005
 *
 * Copyright 2005 eGovernments Foundation. All rights reserved.
 * EGOVERNMENTS PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package org.egov.ptis.domain.entity.demand;

import java.math.BigDecimal;

import org.egov.commons.Area;

/**
 * Data Carrier for Floor Wise Demand and other factors. Used primarily during
 * Property Creation/Edit
 * 
 * @author Administrator
 * @version 1.00
 * @see
 * @see
 * @since 1.00
 */
public class FloorWiseTaxDetails {

	private Integer floorNum;
	private BigDecimal unitAreaTax = null;
	private Area floorArea = null;
	private Float ageFactor = null;
	private Float structFactor = null;
	private Float usageFactor = null;
	private Float occupanyFactor = null;
	private Float flatFactor = null;
	private BigDecimal floorTax = null;
	private BigDecimal netTax = null;

	/**
	 * @return Returns the netTax.
	 */
	public BigDecimal getNetTax() {
		return netTax;
	}

	/**
	 * @param netTax
	 *            The netTax to set.
	 */
	public void setNetTax(BigDecimal netTax) {
		this.netTax = netTax;
	}

	/**
	 * @return Returns the flatFactor.
	 */
	public Float getFlatFactor() {
		return flatFactor;
	}

	/**
	 * @param flatFactor
	 *            The flatFactor to set.
	 */
	public void setFlatFactor(Float flatFactor) {
		this.flatFactor = flatFactor;
	}

	/**
	 * @return Returns the occupanyFactor.
	 */
	public Float getOccupanyFactor() {
		return occupanyFactor;
	}

	/**
	 * @param occupanyFactor
	 *            The occupanyFactor to set.
	 */
	public void setOccupanyFactor(Float occupanyFactor) {
		this.occupanyFactor = occupanyFactor;
	}

	/**
	 * @return Returns the structFactor.
	 */
	public Float getStructFactor() {
		return structFactor;
	}

	/**
	 * @param structFactor
	 *            The structFactor to set.
	 */
	public void setStructFactor(Float structFactor) {
		this.structFactor = structFactor;
	}

	/**
	 * @return Returns the usageFactor.
	 */
	public Float getUsageFactor() {
		return usageFactor;
	}

	/**
	 * @param usageFactor
	 *            The usageFactor to set.
	 */
	public void setUsageFactor(Float usageFactor) {
		this.usageFactor = usageFactor;
	}

	/**
	 * @return Returns the ageFactor.
	 */
	public Float getAgeFactor() {
		return ageFactor;
	}

	/**
	 * @param ageFactor
	 *            The ageFactor to set.
	 */
	public void setAgeFactor(Float ageFactor) {
		this.ageFactor = ageFactor;
	}

	/**
	 * @return Returns the floorArea.
	 */
	public Area getFloorArea() {
		return floorArea;
	}

	/**
	 * @param floorArea
	 *            The floorArea to set.
	 */
	public void setFloorArea(Area floorArea) {
		this.floorArea = floorArea;
	}

	/**
	 * @return Returns the floorNum.
	 */
	public Integer getFloorNum() {
		return floorNum;
	}

	/**
	 * @param floorNum
	 *            The floorNum to set.
	 */
	public void setFloorNum(Integer floorNum) {
		this.floorNum = floorNum;
	}

	/**
	 * @return Returns the floorTax.
	 */
	public BigDecimal getFloorTax() {
		return floorTax;
	}

	/**
	 * @param floorTax
	 *            The floorTax to set.
	 */
	public void setFloorTax(BigDecimal floorTax) {
		this.floorTax = floorTax;
	}

	/**
	 * @return Returns the unitAreaTax.
	 */
	public BigDecimal getUnitAreaTax() {
		return unitAreaTax;
	}

	/**
	 * @param unitAreaTax
	 *            The unitAreaTax to set.
	 */
	public void setUnitAreaTax(BigDecimal unitAreaTax) {
		this.unitAreaTax = unitAreaTax;
	}

	@Override
	public String toString() {
		StringBuilder objStr = new StringBuilder();

		objStr.append("FloorNum: ").append(getFloorNum()).append("|UnitAreaTax: ").append(getUnitAreaTax());
		objStr = (getFloorArea() != null) ? objStr.append("|FloorArea: ").append(getFloorArea().getArea()) : objStr
				.append("");
		objStr.append("|AgeFactor: ").append(getAgeFactor()).append("|StructFactor: ").append(getStructFactor())
				.append("|UsageFactor: ").append(getUsageFactor()).append("|OccupFactor: ").append(getOccupanyFactor())
				.append("|FlatFactor: ").append(getFlatFactor()).append("|FloorTax: ").append(getFloorTax()).append(
						"|NetTax: ").append(getNetTax());

		return objStr.toString();
	}
}
