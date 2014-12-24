<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@ taglib prefix="egov" tagdir="/WEB-INF/tags"%>
<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<link href="/EGF/cssnew/budget.css" rel="stylesheet" type="text/css" />
<link href="/EGF/cssnew/commonegovnew.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/EGF/cssnew/tabber.css" TYPE="text/css">
<script type="text/javascript" src="/EGF/javascript/tabber.js"></script>
<script type="text/javascript" src="/EGF/javascript/tabber2.js"></script>
</head>
<script>

function validateTab(indexx)
{
	if(indexx==0)
	{
		document.getElementById('buttondiv').style.display='none';
		document.getElementById('paginationdiv').style.display='none';
	}
	else
	{
		document.getElementById('buttondiv').style.display='block';
		document.getElementById('paginationdiv').style.display='block';
	}
	return true;
}

var temp = window.setInterval(load,1);
function load()
{
	try{document.getElementById('tabber1').onclick(); window.clearInterval(temp);}catch(e){}
}

function checkMiscAttributes(obj)
{
	if(obj.checked)
	{
		var id = obj.id.substring(10,obj.id.length);
		var prefix = obj.name.substring(0, obj.name.indexOf("["));
		var fundName = prefix+"["+id+"].fundName";
		var deptName = prefix+"["+id+"].deptName";
		var functionaryName = prefix+"["+id+"].functionaryName";
		var fundsourceName = prefix+"["+id+"].fundsourceName";
		var schemeName = prefix+"["+id+"].schemeName";
		var subschemeName = prefix+"["+id+"].subschemeName";
		var fieldName = prefix+"["+id+"].fieldName";
		//var schemeName = prefix+"["+id+"].schemeName";
		var mis = '';
		if(document.getElementsByName(fundName) && document.getElementsByName(fundName).item(0) != null )
			mis = ( document.getElementsByName(fundName).item(0)).value;
		if(document.getElementsByName(deptName) && document.getElementsByName(deptName).item(0) != null )
			mis = mis+'#'+( document.getElementsByName(deptName).item(0)).value;
		if(document.getElementsByName(functionaryName) && document.getElementsByName(functionaryName).item(0) != null)
			mis = mis+'#'+( document.getElementsByName(functionaryName).item(0)).value;	
		if(document.getElementsByName(fundsourceName) && document.getElementsByName(fundsourceName).item(0) != null)
			mis = mis+'#'+( document.getElementsByName(fundsourceName).item(0)).value;	
		if(document.getElementsByName(schemeName) && document.getElementsByName(schemeName).item(0) != null)
			mis = mis+'#'+( document.getElementsByName(schemeName).item(0)).value;
		if(document.getElementsByName(subschemeName) && document.getElementsByName(subschemeName).item(0) != null)
			mis = mis+'#'+( document.getElementsByName(subschemeName).item(0)).value;
		if(document.getElementsByName(fieldName) && document.getElementsByName(fieldName).item(0) != null)
			mis = mis+'#'+( document.getElementsByName(fieldName).item(0)).value;

		if(document.getElementById('miscattributes').value=='')
			document.getElementById('miscattributes').value = mis;
		
		if(mis!=document.getElementById('miscattributes').value)
		{
			alert('Selected bills do not have same attributes. Please select bills with same attributes');
			obj.checked =false;
			return;
			
		}
		document.getElementById('miscount').value=parseInt(document.getElementById('miscount').value)+1;		
	}
	else
	{
		document.getElementById('miscount').value=parseInt(document.getElementById('miscount').value)-1;
		if(document.getElementById('miscount').value==0)
			document.getElementById('miscattributes').value='';
	}
}
function check()
{
	if(document.getElementById('miscount').value==0)
	{
		alert('Please select a bill before making the payment');
		return false;
	}
	if(document.getElementById('vouchermis.departmentid'))
		document.getElementById('vouchermis.departmentid').disabled=false;
	return true;
}
function loadBank(obj){}
function search()
{
	if(document.getElementById('vouchermis.departmentid'))
		document.getElementById('vouchermis.departmentid').disabled=false;
	return true;
}
function selectAllContractors(element){
	var length = 0;
	<s:if test="%{contractorList!=null}">
		length = <s:property value="%{contractorList.size()}"/>;
	</s:if>
	
	if(element.checked == true)	{
		var concnt=checkcontractorForSameMisAttribs('contractorList',length);
		if(concnt!=0)
		 alert("Selected Bills doesnot have same attributes");
		else
		checkAll('contractorList',length);
	}
	else
		uncheckAll('contractorList',length);
}
function selectAllSuppliers(element){
	var length = 0;
	<s:if test="%{supplierList!=null}">
		length = <s:property value="%{supplierList.size()}"/>;
	</s:if>
	if(element.checked == true)
	{
		var supcnt= checkSupplierForSameMisAttribs('supplierList',length);
	    if(supcnt!=0)
	     alert("Selected Bills doesnot have same attributes");
	     else
	     checkAll('supplierList',length);
	}
	else
		uncheckAll('supplierList',length);
}
function selectAllContingent(element){
	var length = 0;
	<s:if test="%{contingentList!=null}">
		length = <s:property value="%{contingentList.size()}"/>;
	</s:if>
	
	if(element.checked == true){
		 
		 var expcnt=checkContingentForSameMisAttribs('contingentList',length);
		 if(expcnt!=0)
		  alert("Selected Bills doesnot have same attributes" );
		  else
		  checkAll('contingentList',length); 
		}
	else
		uncheckAll('contingentList',length);
}

function checkAll(field,length){
	for (i = 0; i < length; i++){
		document.getElementsByName(field+'['+i+'].isSelected')[0].checked = true;
		document.getElementById('miscount').value=parseInt(document.getElementById('miscount').value)+1;
	}
}
function uncheckAll(field,length){
	for (i = 0; i < length; i++){
		document.getElementsByName(field+'['+i+'].isSelected')[0].checked = false;
		document.getElementById('miscount').value=parseInt(document.getElementById('miscount').value)-1;
	}
}
function checkcontractorForSameMisAttribs(obj,len)
{
		var fund1=document.getElementsByName(obj+"[0].fundName");
		var dept1=document.getElementsByName(obj+"[0].deptName");
		var scheme1=document.getElementsByName(obj+"[0].schemeName");
		var subscheme1=document.getElementsByName(obj+"[0].subschemeName");
		var fundsource1=document.getElementsByName(obj+"[0].fundsourceName");
		var field1=document.getElementsByName(obj+"[0].fieldName");
		var functionaryName1=document.getElementsByName(obj+"[0].functionaryName");
		var concount=0;
		for(i=0;i<len;i++)
		{
		   if(document.getElementsByName(obj+"["+i+"].fundName")[0].value!=null)
		   if(fund1[0].value != null && fund1[0].value !=(document.getElementsByName(obj+"["+i+"].fundName").item(0)).value) {
		   	document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		  	concount++; break;}
		   
		   if(document.getElementsByName(obj+"["+i+"].deptName")[0].value!=null)  	
		   if(dept1[0].value != null &&  dept1[0].value !=(document.getElementsByName(obj+"["+i+"].deptName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   concount++; break;}
		   
		   if(document.getElementsByName(obj+"["+i+"].schemeName")[0].value!=null)
		   if(scheme1[0].value != null  && scheme1[0].value !=( document.getElementsByName(obj+"["+i+"].schemeName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   concount++; break;}
		 
		    if(document.getElementsByName(obj+"["+i+"].subschemeName")[0].value!=null)
		   if(subscheme1[0].value !=  null && subscheme1[0].value!=(document.getElementsByName(obj+"["+i+"].subschemeName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;  
		   concount++; break;}
		 
		   if(document.getElementsByName(obj+"["+i+"].fundsourceName")[0].value!=null)
		   if(fundsource1[0].value != null &&  fundsource1[0].value !=(document.getElementsByName(obj+"["+i+"].fundsourceName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   concount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].fieldName")[0].value!=null)
		   if(field1[0].value !=  null &&  field1[0].value != (document.getElementsByName(obj+"["+i+"].fieldName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   concount++; break;}
		   
		   if(document.getElementsByName(obj+"["+i+"].functionaryName")[0].value!=null)
		   if(functionaryName1[0].value != null && functionaryName1[0].value != (document.getElementsByName(obj+"["+i+"].functionaryName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   concount++; break;}
				  
		   }
		   return concount;
}
 
function checkSupplierForSameMisAttribs(obj,len)
{
		
		var fund1=document.getElementsByName(obj+"[0].fundName");
		var dept1=document.getElementsByName(obj+"[0].deptName");
		var scheme1=document.getElementsByName(obj+"[0].schemeName");
		var subscheme1=document.getElementsByName(obj+"[0].subschemeName");
		var fundsource1=document.getElementsByName(obj+"[0].fundsourceName");
		var field1=document.getElementsByName(obj+"[0].fieldName");
		var functionaryName1=document.getElementsByName(obj+"[0].functionaryName");
		var suppcount=0;
		for(i=0;i<len;i++)
		{
		    if(document.getElementsByName(obj+"["+i+"].fundName")[0].value!=null)
		    if(fund1[0].value != null && fund1[0].value !=(document.getElementsByName(obj+"["+i+"].fundName").item(0)).value) {
		   	document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		  	suppcount++; break;}
		   
		   if(document.getElementsByName(obj+"["+i+"].deptName")[0].value!=null)  	
		   if(dept1[0].value != null && dept1[0].value !=(document.getElementsByName(obj+"["+i+"].deptName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   suppcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].schemeName")[0].value!=null)
		   if(scheme1[0].value != null && scheme1[0].value !=( document.getElementsByName(obj+"["+i+"].schemeName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   suppcount++; break;}
		 
			if(document.getElementsByName(obj+"["+i+"].subschemeName")[0].value!=null)		 
		   if(subscheme1[0].value !=  null && subscheme1[0].value!=(document.getElementsByName(obj+"["+i+"].subschemeName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;  
		   suppcount++; break;}
		 
		 if(document.getElementsByName(obj+"["+i+"].fundsourceName")[0].value!=null)
		   if(fundsource1[0].value != null && fundsource1[0].value !=(document.getElementsByName(obj+"["+i+"].fundsourceName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   suppcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].fieldName")[0].value!=null)
		   if(field1[0].value !=  null && field1[0].value != (document.getElementsByName(obj+"["+i+"].fieldName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   suppcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].functionaryName")[0].value!=null)
		   if(functionaryName1[0].value != null && functionaryName1[0].value != (document.getElementsByName(obj+"["+i+"].functionaryName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   suppcount++; break;}
				  
		   }
		   return suppcount;
}
 
function checkContingentForSameMisAttribs(obj,len)
{
   
		var fund1=document.getElementsByName(obj+"[0].fundName");
		var dept1=document.getElementsByName(obj+"[0].deptName");
		var scheme1=document.getElementsByName(obj+"[0].schemeName");
		var subscheme1=document.getElementsByName(obj+"[0].subschemeName");
		var fundsource1=document.getElementsByName(obj+"[0].fundsourceName");
		var field1=document.getElementsByName(obj+"[0].fieldName");
		var functionaryName1=document.getElementsByName(obj+"[0].functionaryName");
		var expcount=0;
		for(i=0;i<len;i++)
		{
		 	if(document.getElementsByName(obj+"["+i+"].fundName")[0].value!=null)
		    if(fund1[0].value != null && fund1[0].value !=(document.getElementsByName(obj+"["+i+"].fundName").item(0)).value) {
		   	document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		  	expcount++; break;}
		   
		   if(document.getElementsByName(obj+"["+i+"].deptName")[0].value!=null)  	
		   if(dept1[0].value != null && dept1[0].value !=(document.getElementsByName(obj+"["+i+"].deptName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   expcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].schemeName")[0].value!=null)
		   if(scheme1[0].value != null && scheme1[0].value !=( document.getElementsByName(obj+"["+i+"].schemeName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;
		   expcount++; break;}
		 
		   if(document.getElementsByName(obj+"["+i+"].subschemeName")[0].value!=null)
		   if(subscheme1[0].value !=  null && subscheme1[0].value!=(document.getElementsByName(obj+"["+i+"].subschemeName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false;  
		   expcount++; break;}
		 
		   if(document.getElementsByName(obj+"["+i+"].fundsourceName")[0].value!=null)		 
		   if(fundsource1[0].value != null && fundsource1[0].value !=(document.getElementsByName(obj+"["+i+"].fundsourceName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   expcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].fieldName")[0].value!=null)
		   if(field1[0].value !=  null && field1[0].value != (document.getElementsByName(obj+"["+i+"].fieldName").item(0)).value) {
		   document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   expcount++; break;}
		  
		   if(document.getElementsByName(obj+"["+i+"].functionaryName")[0].value!=null)		  
		   if(functionaryName1[0].value != null && functionaryName1[0].value != (document.getElementsByName(obj+"["+i+"].functionaryName").item(0)).value) {
		    document.getElementsByName(obj+"["+i+"].isSelected")[0].checked = false; 
		   expcount++; break;}
				  
		   }
		   return expcount;
		
}

</script>

</head>
<body>
	<s:form action="payment" theme="simple" >
		<jsp:include page="../budget/budgetHeader.jsp">
        	<jsp:param name="heading" value="Bill Payment Search" />
		</jsp:include>
		<span class="mandatory">
			<s:actionerror/>  
			<s:fielderror />
			<s:actionmessage />
		</span>
		
		<div class="formmainbox"><div class="subheadnew">Bill Payment</div>
		<div id="budgetSearchGrid" style="display:block;width:100%;border-top:1px solid #ccc;" >
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
				<td>
				<div align="left"><br/>
  					<table border="0" cellspacing="0" cellpadding="0" width="100%">
        			<tr>
        			<td> 
		            <div class="tabber">
		            <div class="tabbertab" id="searchtab">
               			<h2>Search Bill</h2>
	                	<span>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr><td align="center" colspan="6" class="serachbillhead">Search Bill</td></tr>
							<tr>
								<td class="bluebox" width="30%"><s:text name="payment.billnumber"/> </td>
								<td class="bluebox"><s:textfield name="billNumber" id="billNumber" maxlength="25" value="%{billNumber}" /></td>
							</tr>
							<tr>
								<td class="greybox" width="30%"><s:text name="payment.billdatefrom"/> </td>
								<td class="greybox"><s:textfield name="fromDate" id="fromDate" maxlength="20" value="%{fromDate}"/><a href="javascript:show_calendar('forms[0].fromDate');" style="text-decoration:none">&nbsp;<img src="${pageContext.request.contextPath}/image/calendaricon.gif" border="0"/></a><br/>(dd/mm/yyyy)</td>
								<td class="greybox" width="30%"><s:text name="payment.billdateto"/> </td>
								<td class="greybox"><s:textfield name="toDate" id="toDate" maxlength="20" value="%{toDate}"/><a href="javascript:show_calendar('forms[0].toDate');" style="text-decoration:none">&nbsp;<img src="${pageContext.request.contextPath}/image/calendaricon.gif" border="0"/></a>(dd/mm/yyyy)</td>
							</tr>
							<tr>
								<td class="bluebox" width="30%"><s:text name="payment.expendituretype"/> </td>
								<td class="bluebox"><s:select name="expType" id="expType" list="#{'-1':'---Select---','Purchase':'Purchase','Works':'Works', 'Expense':'Expense'}" value="%{expType}"/></td>
							</tr>
							<jsp:include page="../voucher/vouchertrans-filter.jsp"/>
							<tr>
								<td align="center" colspan="6">
									<div class="buttonbottom">
									  <s:submit method="search" value="Search" cssClass="buttonsubmit" onclick="return search()"/>
									  <input type="submit" value="Close" onclick="javascript:window.close()" class="button"/>
									  <s:hidden name="miscount" id="miscount"/>
									  <s:hidden  name="miscattributes" id="miscattributes" value=""/>
									</div>
								</td>
							</tr>  
						</table>
                		</span>                  
              		</div>
           			<div class="tabbertab" id="contractortab">
           			<h2>Contractor Bill</h2>
                	<span>
					<table name ="contractortable" align="center" border="0" cellpadding="0" cellspacing="0" class="newtable">
						<tr><td colspan="6"><div class="subheadsmallnew">Contractor Bill</div></td></tr>
						<tr>
							<td colspan="6">
							<div  style="float:left; width:100%;">
							<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>  
    								<th class="bluebgheadtdnew">Select<input type="checkbox" onclick="selectAllContractors(this)" name="conSelectAll"  id="conSelectAll"/></th> 
    								
							        <jsp:include page="billdetails-header.jsp"/>
								    <s:iterator var="p" value="contractorList" status="s">  
					        </tr>
					        <tr>
					        
							  	  <td  class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].csBillId" id="csBillId%{#s.index}" value="%{csBillId}"/><s:checkbox name="contractorList[%{#s.index}].isSelected" id="isSelected%{#s.index}" onclick="checkMiscAttributes(this)"></s:checkbox></td>
							  	  <td align="left"  class="blueborderfortdnew"/> <s:property value="#s.index+1" /> </td>  
							  	  <td align="left"  class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].expType" id="expType%{#s.index}" value="%{expType}"/><s:hidden   name="contractorList[%{#s.index}].billNumber" id="billNumber%{#s.index}" value="%{billNumber}"/><s:property value="%{billNumber}" /></td>
							      <td class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].billDate" id="billDate%{#s.index}" value="%{billDate}"/><s:date name="%{billDate}" format="dd/MM/yyyy"/></td>
							      
							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="contractorList[%{#s.index}].billVoucherNumber" id="billVoucherNumber%{#s.index}" value="%{billVoucherNumber}"/><s:property value="%{billVoucherNumber}"/></td>
							      <td style="text-align:left"  class="blueborderfortdnew"><s:hidden   name="contractorList[%{#s.index}].billVoucherDate" id="billVoucherDate%{#s.index}" value="%{billVoucherDate}"/><s:date name="%{billVoucherDate}" format="dd/MM/yyyy"/></td>

							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="contractorList[%{#s.index}].payTo" id="payTo%{#s.index}" value="%{payTo}"/><s:property value="%{payTo}"/></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].netAmt" id="netAmt%{#s.index}" value="%{netAmt}"/><s:text name="payment.format.number" ><s:param value="%{netAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].earlierPaymentAmt" id="earlierPaymentAmt%{#s.index}" value="%{earlierPaymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{earlierPaymentAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden  name="contractorList[%{#s.index}].payableAmt" id="payableAmt%{#s.index}" value="%{payableAmt}"/><s:hidden  name="contractorList[%{#s.index}].paymentAmt" id="paymentAmt%{#s.index}" value="%{paymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{payableAmt}"/></s:text></td>
								  <s:if test="%{!isFieldMandatory('fund')}"><td class="blueborderfortdnew"  id="fund<s:property value="#s.index"/>"><s:hidden  name="contractorList[%{#s.index}].fundName" id="fundName%{#s.index}" value="%{fundName}"/><s:property value="%{fundName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('department')}"><td class="blueborderfortdnew" id="dept<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].deptName" id="deptName%{#s.index}" value="%{deptName}"/><s:property value="%{deptName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('functionary')}"><td class="blueborderfortdnew"  id="functionary<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].functionaryName" id="functionaryName%{#s.index}" value="%{functionaryName}"/><s:property value="%{functionaryName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('fundsource')}"><td class="blueborderfortdnew" id="fundsource<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].fundsourceName" id="fundsourceName%{#s.index}" value="%{fundsourceName}"/><s:property value="%{fundsourceName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('scheme')}"><td class="blueborderfortdnew" id="scheme<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].schemeName" id="schemeName%{#s.index}" value="%{schemeName}"/><s:property value="%{schemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('subscheme')}"><td class="blueborderfortdnew" id="subscheme<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].subschemeName" id="subschemeName%{#s.index}" value="%{subschemeName}"/><s:property value="%{subschemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('field')}"><td class="blueborderfortdnew" id="field<s:property value="#s.index"/>"><s:hidden   name="contractorList[%{#s.index}].fieldName" id="fieldName%{#s.index}" value="%{fieldName}"/><s:property value="%{fieldName}" /></td></s:if>
								</tr>
								</s:iterator>
							</table>
							<s:if test="contractorList == null || contractorList.size==0">
								<div class="subheadsmallnew">No Records Found</div>
							</s:if>
						</div>
						</td>
					</tr>
					</table>                    
               		</span>                
                	</div>
          			<div class="tabbertab" id="suppliertab">
           			<h2>Supplier Bill</h2>
                	<span>
					<table align="center" border="0" cellpadding="0" cellspacing="0" class="newtable" name="supSelectAll" id="supSelectAll">
					<tr><td colspan="6"><div class="subheadsmallnew">Supplier Bill</div></td></tr>
					<tr>
						<td colspan="6">
						<div  style="float:left; width:100%;">
							<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>  
    								<th class="bluebgheadtdnew">Select<input type="checkbox" onclick="selectAllSuppliers(this)"/></th>  
							
								<jsp:include page="billdetails-header.jsp"/>
								<s:iterator var="p" value="supplierList" status="s">  
								</tr>
					        	<tr>  
							  	  <td  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].csBillId" id="csBillId%{#s.index}" value="%{csBillId}"/><s:checkbox name="supplierList[%{#s.index}].isSelected" id="isSelected%{#s.index}" onclick="checkMiscAttributes(this)"></s:checkbox></td>
							  	   <td align="left"  class="blueborderfortdnew"/><s:property value="#s.index+1" /> </td> 
						    	  <td align="left"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].expType" id="expType%{#s.index}" value="%{expType}"/><s:hidden   name="supplierList[%{#s.index}].billNumber" id="billNumber%{#s.index}" value="%{billNumber}"/><s:property value="%{billNumber}" /></td>
							      <td class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].billDate" id="billDate%{#s.index}" value="%{billDate}"/><s:date name="%{billDate}" format="dd/MM/yyyy"/></td>
							      
							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].billVoucherNumber" id="billVoucherNumber%{#s.index}" value="%{billVoucherNumber}"/><s:property value="%{billVoucherNumber}"/></td>
							      <td style="text-align:left"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].billVoucherDate" id="billVoucherDate%{#s.index}" value="%{billVoucherDate}"/><s:date name="%{billVoucherDate}" format="dd/MM/yyyy"/></td>

							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].payTo" id="payTo%{#s.index}" value="%{payTo}"/><s:property value="%{payTo}"/></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden  name="supplierList[%{#s.index}].netAmt" id="netAmt%{#s.index}" value="%{netAmt}"/><s:text name="payment.format.number" ><s:param value="%{netAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].earlierPaymentAmt" id="earlierPaymentAmt%{#s.index}" value="%{earlierPaymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{earlierPaymentAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden   name="supplierList[%{#s.index}].payableAmt" id="payableAmt%{#s.index}" value="%{payableAmt}"/><s:hidden   name="supplierList[%{#s.index}].paymentAmt" id="paymentAmt%{#s.index}" value="%{paymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{payableAmt}"/></s:text></td>
								  <s:if test="%{!isFieldMandatory('fund')}"><td class="blueborderfortdnew"  id="fund<s:property value="#s.index"/>"><s:hidden  name="supplierList[%{#s.index}].fundName" id="fundName%{#s.index}" value="%{fundName}"/><s:property value="%{fundName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('department')}"><td class="blueborderfortdnew" id="dept<s:property value="#s.index"/>"><s:hidden   name="supplierList[%{#s.index}].deptName" id="deptName%{#s.index}" value="%{deptName}"/><s:property value="%{deptName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('functionary')}"><td class="blueborderfortdnew"  id="functionary<s:property value="#s.index"/>"><s:hidden  name="supplierList[%{#s.index}].functionaryName" id="functionaryName%{#s.index}" value="%{functionaryName}"/><s:property value="%{functionaryName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('fundsource')}"><td class="blueborderfortdnew" id="fundsource<s:property value="#s.index"/>"><s:hidden   name="supplierList[%{#s.index}].fundsourceName" id="fundsourceName%{#s.index}" value="%{fundsourceName}"/><s:property value="%{fundsourceName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('scheme')}"><td class="blueborderfortdnew" id="scheme<s:property value="#s.index"/>"><s:hidden   name="supplierList[%{#s.index}].schemeName" id="schemeName%{#s.index}" value="%{schemeName}"/><s:property value="%{schemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('subscheme')}"><td class="blueborderfortdnew" id="subscheme<s:property value="#s.index"/>"><s:hidden   name="supplierList[%{#s.index}].subschemeName" id="subschemeName%{#s.index}" value="%{subschemeName}"/><s:property value="%{subschemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('field')}"><td class="blueborderfortdnew" id="field<s:property value="#s.index"/>"><s:hidden   name="supplierList[%{#s.index}].fieldName" id="fieldName%{#s.index}" value="%{fieldName}"/><s:property value="%{fieldName}" /></td></s:if>
								</tr>
								</s:iterator>
							</table>
							<s:if test="supplierList == null || supplierList.size==0">
								<div class="subheadsmallnew">No Records Found</div>
							</s:if>
						</div>
						</td>
					</tr>
					</table>                   
               		</span>
                </div>
                <div class="tabbertab" id="cbilltab">
           			<h2>Expense Bill</h2>
                	<span>
					<table align="center" border="0" cellpadding="0" cellspacing="0" class="newtable" name="expSelectAll">
					<tr><td colspan="6"><div class="subheadsmallnew">Expense Bill</div></td></tr>
					<tr>
						<td colspan="6">
						<div  style="float:left; width:100%;">
							<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>  
    								<th class="bluebgheadtdnew">Select<input type="checkbox"  id="expSelectAll" onclick="selectAllContingent(this)" /></th>  
									<jsp:include page="billdetails-header.jsp"/>
									<s:iterator var="p" value="contingentList" status="s">  
									</tr>
								<tr>
					        	  
							  	  <td  class="blueborderfortdnew"><s:hidden  name="contingentList[%{#s.index}].csBillId" id="csBillId%{#s.index}" value="%{csBillId}"/><s:checkbox name="contingentList[%{#s.index}].isSelected" id="isSelected%{#s.index}" onclick="checkMiscAttributes(this)"></s:checkbox></td>
							  	   <td align="left"  class="blueborderfortdnew"/><s:property value="#s.index+1" /> </td>
							  	  <!-- <td align="left"  class="blueborderfortdnew"/><s:hidden  name="contingentList[%{#s.index}].csBillId" id="csBillId%{#s.index}" value="%{csBillId}"/><s:property value="#s.index" /> </td> -->
						    	  <td align="left"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].expType" id="expType%{#s.index}" value="%{expType}"/><s:hidden   name="contingentList[%{#s.index}].billNumber" id="billNumber%{#s.index}" value="%{billNumber}"/><s:property value="%{billNumber}" /></td>
							      <td class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].billDate" id="billDate%{#s.index}" value="%{billDate}"/><s:date name="%{billDate}" format="dd/MM/yyyy"/></td>

							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].billVoucherNumber" id="billVoucherNumber%{#s.index}" value="%{billVoucherNumber}"/><s:property value="%{billVoucherNumber}"/></td>
							      <td style="text-align:left"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].billVoucherDate" id="billVoucherDate%{#s.index}" value="%{billVoucherDate}"/><s:date name="%{billVoucherDate}" format="dd/MM/yyyy"/></td>

							      <td align="left"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].payTo" id="payTo%{#s.index}" value="%{payTo}"/><s:property value="%{payTo}"/></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].netAmt" id="netAmt%{#s.index}" value="%{netAmt}"/><s:text name="payment.format.number" ><s:param value="%{netAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].earlierPaymentAmt" id="earlierPaymentAmt%{#s.index}" value="%{earlierPaymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{earlierPaymentAmt}"/></s:text></td>
							      <td style="text-align:right"  class="blueborderfortdnew"><s:hidden   name="contingentList[%{#s.index}].payableAmt" id="payableAmt%{#s.index}" value="%{payableAmt}"/><s:hidden   name="contingentList[%{#s.index}].paymentAmt" id="paymentAmt%{#s.index}" value="%{paymentAmt}"/><s:text name="payment.format.number" ><s:param value="%{payableAmt}"/></s:text></td>
								  <s:if test="%{!isFieldMandatory('fund')}"><td class="blueborderfortdnew"  id="fund<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].fundName" id="fundName%{#s.index}" value="%{fundName}"/><s:property value="%{fundName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('department')}"><td class="blueborderfortdnew" id="dept<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].deptName" id="deptName%{#s.index}" value="%{deptName}"/><s:property value="%{deptName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('functionary')}"><td class="blueborderfortdnew"  id="functionary<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].functionaryName" id="functionaryName%{#s.index}" value="%{functionaryName}"/><s:property value="%{functionaryName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('fundsource')}"><td class="blueborderfortdnew" id="fundsource<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].fundsourceName" id="fundsourceName%{#s.index}" value="%{fundsourceName}"/><s:property value="%{fundsourceName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('scheme')}"><td class="blueborderfortdnew" id="scheme<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].schemeName" id="schemeName%{#s.index}" value="%{schemeName}"/><s:property value="%{schemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('subscheme')}"><td class="blueborderfortdnew" id="subscheme<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].subschemeName" id="subschemeName%{#s.index}" value="%{subschemeName}"/><s:property value="%{subschemeName}" /></td></s:if>
							      <s:if test="%{shouldShowHeaderField('field')}"><td class="blueborderfortdnew" id="field<s:property value="#s.index"/>"><s:hidden   name="contingentList[%{#s.index}].fieldName" id="fieldName%{#s.index}" value="%{fieldName}"/><s:property value="%{fieldName}" /></td></s:if>
								</tr>
								</s:iterator>
							</table>
							<s:if test="contingentList == null || contingentList.size==0">
								<div class="subheadsmallnew">No Records Found</div>
							</s:if>
						</div>
						</td>
					</tr>
					</table>                   
               		</span>
                </div><!-- individual tab div -->
			</div> <!-- tabber div -->
			</td>
       		</tr>
      		</table>
		</div>
		</td>
		</tr>
		</table>
	</div>
	</div>
	<div id="paginationdiv" align="center" style="padding-top:10px;">
		<!-- <a href="#"><<</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">>></a>&nbsp;&nbsp;&nbsp;
		<select name="select">
			<option>Show 50</option>
			<option>Show 100</option>
			<option>Show All</option>
		</select> -->
	</div>
	<div id="buttondiv" align="center" style="display:visible">
	<table align="center" width="100%">
		<tr><font size="small" color="red">*Maximum of 500 records are displayed here</font></tr>
		<tr>
			<td class="modeofpayment">
				<strong><s:text name="payment.mode"/><span class="mandatory">*</span></strong>
				<input name="paymentMode" id="paymentModecheque" checked="checked" value="cheque" type="radio"><label for="paymentModecheque">Cheque</label>
				<input name="paymentMode" id="paymentModecash" value="cash" type="radio"><label for="paymentModecash"><s:text name="cash.consolidated.cheque"/></label>
				<input name="paymentMode" id="paymentModertgs" value="rtgs" type="radio"><label for="paymentModertgs">RTGS</label>
			</td>
		</tr>
		<tr>
			<td  class="buttonbottomnew" align="center"><br><s:submit method="generatePayment" value="Generate Payment" cssClass="buttonsubmit" onclick="return check()" /></td>
		</tr>
	</table>
	</div>
	<s:if test="%{!validateUser('createpayment')}">
		<script>
			document.getElementById('searchBtn').disabled=true;
			document.getElementById('errorSpan').innerHTML='<s:text name="payment.invalid.user"/>';
			if(document.getElementById('vouchermis.departmentid'))
			{
				var d = document.getElementById('vouchermis.departmentid');
				d.options[d.selectedIndex].text='----Choose----';
				d.options[d.selectedIndex].text.value=-1;
			}
		</script>
		</s:if>
		<s:if test="%{validateUser('deptcheck')}">
			<script>
				if(document.getElementById('vouchermis.departmentid'))
				{
					document.getElementById('vouchermis.departmentid').disabled=true;
				}
			</script>
		</s:if>
	</s:form>
</body>
</html>	
