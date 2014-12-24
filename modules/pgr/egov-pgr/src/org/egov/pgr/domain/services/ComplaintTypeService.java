/*
 * @(#)ComplaintTypeService.java 3.0, 23 Jul, 2013 3:29:43 PM
 * Copyright 2013 eGovernments Foundation. All rights reserved. 
 * eGovernments PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package org.egov.pgr.domain.services;

import java.util.List;

import org.egov.pgr.domain.entities.ComplaintTypes;
import org.egov.pgr.services.persistence.EntityService;

public interface ComplaintTypeService extends EntityService<ComplaintTypes, Long> {

	public List<ComplaintTypes> getTop5Complaints();

}
