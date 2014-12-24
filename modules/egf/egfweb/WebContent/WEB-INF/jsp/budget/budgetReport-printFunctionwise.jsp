<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<style type="text/css">
#container iframe {
width: 100%;
height: 2000px;
border: none;
}

#container {
width: 100%;
height: 550px;
padding: 0;
overflow-y: scroll; }

@media print {
input#btnPrint {
display: none;
}
}

@media print {
input#printPDF {
display: none;
}
}

@media print {
input#printXLS {
display: none;
}
}
</style>

<body>
<div id="container">
<iframe id="report" name="report" src='/EGF/budget/budgetReport!ajaxGenerateFunctionWiseHtml.action?model.financialYear.id=<s:property value="model.financialYear.id"/>&model.department.id=<s:property value="model.department.id"/>&model.function.id=<s:property value="model.function.id"/>&model.type=<s:property value="model.type"/>' ></iframe>
</div> 

<s:form name="budgetDetailReportForm" action="budgetReport" theme="simple" >
	<input type="hidden" name="model.financialYear.id" value='<s:property value="model.financialYear.id"/>'/>
	<input type="hidden" name="model.department.id" value='<s:property value="model.department.id"/>'/>
	<input type="hidden" name="model.function.id" value='<s:property value="model.function.id"/>'/>
	<input type="hidden" name="model.type" value='<s:property value="model.type"/>'/>
	<div id="buttons">
		<input type="button" id="btnPrint" onclick="javascript:parent.report.print();" value="PRINT" class="button"/>
		<s:submit id="printPDF" value="SAVE AS PDF" method="generateFunctionWisePdf" cssClass="buttonsubmit"/>
		<s:submit id="printXLS" value="SAVE AS EXCEL" method="generateFunctionWiseXls" cssClass="buttonsubmit"/>        
	</div>
</s:form>
</body>