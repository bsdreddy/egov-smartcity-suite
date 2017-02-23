/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 *    accountability and the service delivery of the government  organizations.
 *
 *     Copyright (C) <2015>  eGovernments Foundation
 *
 *     The updated version of eGov suite of products as by eGovernments Foundation
 *     is available at http://www.egovernments.org
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see http://www.gnu.org/licenses/ or
 *     http://www.gnu.org/licenses/gpl.html .
 *
 *     In addition to the terms of the GPL license to be adhered to in using this
 *     program, the following additional terms are to be complied with:
 *
 *         1) All versions of this program, verbatim or modified must carry this
 *            Legal Notice.
 *
 *         2) Any misrepresentation of the origin of the material is prohibited. It
 *            is required that all modified versions of this material be marked in
 *            reasonable ways as different from the original version.
 *
 *         3) This license does not grant any rights to any user of the program
 *            with regards to rights under trademark law for use of the trade names
 *            or trademarks of eGovernments Foundation.
 *
 *   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */
package org.egov.works.web.controller.estimatephotograph;

import java.util.List;

import org.egov.works.abstractestimate.entity.AbstractEstimate;
import org.egov.works.abstractestimate.entity.EstimatePhotographSearchRequest;
import org.egov.works.abstractestimate.service.EstimatePhotographService;
import org.egov.works.config.properties.WorksApplicationProperties;
import org.egov.works.lineestimate.entity.LineEstimateDetails;
import org.egov.works.web.adaptor.ViewAbstractEstimatePhotographJsonAdaptor;
import org.egov.works.web.adaptor.ViewEstimatePhotographJsonAdaptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/estimatephotograph")
public class AjaxEstimatePhotographController {

    @Autowired
    private EstimatePhotographService estimatePhotographService;

    @Autowired
    private ViewEstimatePhotographJsonAdaptor viewEstimatePhotographJsonAdaptor;

    @Autowired
    private ViewAbstractEstimatePhotographJsonAdaptor viewAbstractEstimatePhotographJsonAdaptor;

    @Autowired
    private WorksApplicationProperties worksApplicationProperties;

    @RequestMapping(value = "/searchestimatephotograph", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody String ajaxSearchEstimatePhotograph(final Model model,
            @ModelAttribute final EstimatePhotographSearchRequest estimatePhotographSearchRequest) {
        if (worksApplicationProperties.lineEstimateRequired()) {
            final List<LineEstimateDetails> searchResultList = estimatePhotographService
                    .searchEstimatePhotograph(estimatePhotographSearchRequest);
            return new StringBuilder("{ \"data\":").append(toSearchEstimatePhotograph(searchResultList)).append("}")
                    .toString();
        } else {
            final List<AbstractEstimate> searchResultList = estimatePhotographService
                    .searchEstimatePhotographFromAE(estimatePhotographSearchRequest);
            return new StringBuilder("{ \"data\":").append(toViewEstimatePhotograph(searchResultList)).append("}")
                    .toString();
        }
    }

    private Object toViewEstimatePhotograph(final Object object) {
        final GsonBuilder gsonBuilder = new GsonBuilder();
        final Gson gson = gsonBuilder
                .registerTypeAdapter(AbstractEstimate.class, viewAbstractEstimatePhotographJsonAdaptor).create();
        return gson.toJson(object);
    }

    public Object toSearchEstimatePhotograph(final Object object) {
        final GsonBuilder gsonBuilder = new GsonBuilder();
        final Gson gson = gsonBuilder.registerTypeAdapter(LineEstimateDetails.class, viewEstimatePhotographJsonAdaptor)
                .create();
        return gson.toJson(object);
    }

    @RequestMapping(value = "/getestimatenumbers-viewestimatephotograph", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<String> findEstimateNumbersForViewEstimatePhotograph(
            @RequestParam final String estimateNumber) {
        if (worksApplicationProperties.lineEstimateRequired())
            return estimatePhotographService.getEstimateNumbersForViewEstimatePhotograph(estimateNumber);
        else
            return estimatePhotographService.getEstimateNumbers(estimateNumber);
    }

    @RequestMapping(value = "/getwin-viewestimatephotograph", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<String> findWinForViewEstimatePhotograph(
            @RequestParam final String workIdentificationNumber) {
        if (worksApplicationProperties.lineEstimateRequired())
            return estimatePhotographService.getWinForViewEstimatePhotograph(workIdentificationNumber);
        else
            return estimatePhotographService.getWorkIdentificationNumbers(workIdentificationNumber);
    }

}
