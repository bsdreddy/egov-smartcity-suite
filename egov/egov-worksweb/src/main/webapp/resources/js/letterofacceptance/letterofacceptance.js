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
$(document).ready(function(){
	calculateAgreementAmount();
	if($('#engineerInchargeId').val()!="")
		$('#engineerIncharge').val($('#engineerInchargeId').val());
	var contractorSearch = new Bloodhound({
        datumTokenizer: function (datum) {
            return Bloodhound.tokenizers.whitespace(datum.value);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/egworks/letterofacceptance/ajaxcontractors-loa?name=%QUERY',
            filter: function (data) {
                return $.map(data, function (ct) {
                    return {
                        name: ct.name,
                        value: ct.id,
                        code: ct.code
                    };
                });
            }
        }
    });
	   
	contractorSearch.initialize();
		var contractorSearch_typeahead = $('#contractorSearch').typeahead({ 
			hint : true,
			highlight : true,
			minLength : 3
		}, {
			displayKey : 'name',
			source : contractorSearch.ttAdapter()
		}).on('typeahead:selected typeahead:autocompleted', function(event, data){            
			$("#contractorCode").val(data.code);    
			$("#contractor").val(data.value);   
	    });		

		$('.number-sign li a').click(function(e){
			
			$('.number-sign span.sign-text').html($(this).html());
			$('#percentageSign').val($(this).html());
			calculateAgreementAmount();
			
		});
		
		if($('#tenderFinalizedPercentage').val() <= 0) 
			$('#tenderFinalizedPercentage').val('');
		if($('#workOrderAmount').val() <= 0) 
			$('#workOrderAmount').val('');
		if($('#securityDeposit').val() <= 0) 
			$('#securityDeposit').val('');
		if($('#emdAmountDeposited').val() <= 0) 
			$('#emdAmountDeposited').val('');
		if($('#defectLiabilityPeriod').val() <= 0) 
			$('#defectLiabilityPeriod').val('');
		$('#estimateAmount').val(roundTo($('#estimateAmount').val()));
		
		$('#save').click(function() {
			var flag = false;
			$("#createLetterOfAcceptanceForm").find('input, select, textarea').each(function() {
				if($(this).attr('required') == 'required' && $(this).val() == '') {
					flag = true;
				}
			});
			if(!flag && $('#spillOverFlag').val() == 'true' && $('#workOrderCreated').val() == 'true') {
				var technicalSanctionDate = $('#technicalSanctionDate').data('datepicker').date;
				var fileDate = $('#fileDate').data('datepicker').date;
				var workOrderDate = $('#workOrderDate').data('datepicker').date;
				
				if(fileDate < technicalSanctionDate) {
					bootbox.alert($('#errorFileDate').val());
					return false;
				}
				if(workOrderDate < fileDate) {
					bootbox.alert($('#errorWorkOrderDate').val());
					return false;
				}
			}
		});
	
		$("form").submit(function() {
			if($('form').valid())	{
				$('.loader-class').modal('show', {backdrop: 'static'});
				loadDefaultsOnSubmit();
			}
			else 
				$('.loader-class').modal('hide');
		});
		
		function loadDefaultsOnSubmit()	{
			if($('#tenderFinalizedPercentage').val() == '' || $('#tenderFinalizedPercentage').val() < 0) 
				$('#tenderFinalizedPercentage').val(0);
			if($('#workOrderAmount').val() == '' || $('#workOrderAmount').val() < 0) 
				$('#workOrderAmount').val(0);
			if($('#securityDeposit').val() == '' || $('#securityDeposit').val() < 0) 
				$('#securityDeposit').val(0);
			if($('#emdAmountDeposited').val() == '' || $('#emdAmountDeposited').val() < 0) 
				$('#emdAmountDeposited').val(0);
			if($('#defectLiabilityPeriod').val() == '' || $('#defectLiabilityPeriod').val() < 0) 
				$('#defectLiabilityPeriod').val(0);
		 }
		

		$('#tenderFinalizedPercentage').blur(function(){
			calculateAgreementAmount();		
		});
		
		$('#workOrderAmount').blur(function(){
			calculateTenderFinalizedPercentage();		
		});
		
		function calculateAgreementAmount() {
			//Appconfig of percentage_on_estimaterate_or_workvalue 
			//if the value is 'yes'
				//then 
					//Application has to read the estimated rate and apply the Tender finalized percentage for the total work value.
			//else 
				//Application has to read apply the Tender finalized percentage on each and every SOR and arrive at the Agreement value.
			if($('#percentage_on_estimaterate_or_workvalue').val() == 'Yes'){
		    	var tenderFinalizedPercentage = $('#tenderFinalizedPercentage').val();
		    	$('#tenderFinalizedPer').html(tenderFinalizedPercentage);
				if(tenderFinalizedPercentage != ''){
				    	percentageVal = assignSignForTenderFinalizedPercentage(tenderFinalizedPercentage);
				    	var agreementAmount = eval($('#workValue').val())+(eval($('#workValue').val())*percentageVal)/100;
					   $('#workOrderAmount').val(roundTo(agreementAmount));
					   $('#agreementValue').html(roundTo(agreementAmount));
				}
				else 
						$('#workOrderAmount').val('');
			}
		}
		
		function calculateTenderFinalizedPercentage() {
	    	var agreementValue =eval($('#workOrderAmount').val());
	    	var workValue = eval($('#workValue').val());
	    	var tenderFinalizedPercentage =roundTo((eval(agreementValue - workValue)/workValue)*100);
	    	$('#tenderFinalizedPercentage').val(Math.abs(tenderFinalizedPercentage));
	    	if(tenderFinalizedPercentage<0)
	    		$('.number-sign button').html('<span class="sign-text">-</span> &nbsp;<span class="caret"></span>');
	    	else
	    		$('.number-sign button').html('<span class="sign-text">+</span> &nbsp;<span class="caret"></span>');
	    	calculateAgreementAmount();	
		}

		function assignSignForTenderFinalizedPercentage(tenderFinalizedPercentage){
			var percentageSign = $('#percentageSign').val();
			if(percentageSign=='-'){
			      return -tenderFinalizedPercentage;
			  }else{
			     return tenderFinalizedPercentage;
			  }
		}
		
		function roundTo(value,decimals,decimal_padding){
			  if(!decimals) decimals=2;
			  if(!decimal_padding) decimal_padding='0';
			  if(isNaN(value)) value=0;
			  value=Math.round(value*Math.pow(10,decimals));
			  var stringValue= (value/Math.pow(10,decimals)).toString();
			  var padding=0;
			  var parts=stringValue.split(".");
			  if(parts.length==1) {
			  	padding=decimals;
			  	stringValue+=".";
			  } 
			  else 
				 padding=decimals-parts[1].length;
			  for(var i=0;i<padding;i++)
			  {
				  stringValue+=decimal_padding;
			  }
			  return stringValue;
			}
});

function searchContractor() {
	window.open("/egworks/letterofacceptance/contractorsearchform", '', 'height=650,width=980,scrollbars=yes,left=0,top=0,status=yes');
}

function validateWorkFlowApprover(name) {
	document.getElementById("workFlowAction").value = name;
	var approverPosId = document.getElementById("approvalPosition");
	var button = document.getElementById("workFlowAction").value;
	
	var flag = true;
	
	if (button != null && button == 'Approve') {
		$('#approvalComent').removeAttr('required');
	}
	if (button != null && button == 'Reject') {
		$('#approvalDepartment').removeAttr('required');
		$('#approvalDesignation').removeAttr('required');
		$('#approvalPosition').removeAttr('required');
		$('#approvalComent').attr('required', 'required');
	}
	if (button != null && button == 'Cancel') {
		$('#approvalDepartment').removeAttr('required');
		$('#approvalDesignation').removeAttr('required');
		$('#approvalPosition').removeAttr('required');
		$('#approvalComent').attr('required', 'required');
		
		if(!$("form").valid())
		{
			return false;
		}
		
	}
	if (button != null && button == 'Forward') {
		$('#approvalDepartment').attr('required', 'required');
		$('#approvalDesignation').attr('required', 'required');
		$('#approvalPosition').attr('required', 'required');
		$('#approvalComent').removeAttr('required');
		
		if(!$("form").valid())
		{
			return false;
		}
	}
	
	if(flag) {
		document.forms[0].submit;
		return true;
	} else
		return false;
}