<%@ include file="/includes/taglibs.jsp" %>
<%@page import="java.util.*" %>
<html>
<head>

	<title>Gratuity compute </title>

	<style type="text/css">
		#codescontainer {position:absolute;left:11em;width:9%}
		#codescontainer .yui-ac-content {position:absolute;width:80%;border:1px solid #404040;background:#fff;overflow:hidden;z-index:9050;}
		#codescontainer .yui-ac-shadow {position:absolute;margin:.3em;width:40%;background:#a0a0a0;z-index:9049;}
		#codescontainer ul {padding:5px 0;width:80%;}
		#codescontainer li {padding:0 5px;cursor:default;white-space:nowrap;}
		#codescontainer li.yui-ac-highlight {background:#ff0;}
		#codescontainer li.yui-ac-prehighlight {background:#FFFFCC;}
</style>

<%
	String mode = request.getParameter("mode");
	System.out.println("mode----------"+mode);
%>
<script language="JavaScript"  type="text/JavaScript">
	
	var yuiflag1 = new Array();
	var selectedEmpCode;	
	function onBodyLoad(){  		
	   loadEmpCodes(); 
			
	   
	   
	}	
	
    function autocompleteEmpCode(obj){
	 	// set position of dropdown
	 	var src = obj;
	 	var target = document.getElementById('codescontainer');
	 	var posSrc=findPos(src);
	 	target.style.left=posSrc[0];
	 	target.style.top=posSrc[1]+25;
	 	if(obj.name=='employeeCode') target.style.left=posSrc[0]+0;
	
	 	target.style.width=500;
	
	 	var currRow=getRow(obj);
	 	var coaCodeObj = obj;
	 	if(yuiflag1[currRow.rowIndex] == undefined)
	 	{
	 	//40 --> Down arrow, 38 --> Up arrow
	 	if(event.keyCode != 40 )
	 	{
	 		if(event.keyCode != 38 )
	 		{
 				var oAutoComp1 = new YAHOO.widget.AutoComplete(coaCodeObj,'codescontainer', selectedEmpCode);
 				oAutoComp1.queryDelay = 0;
 				oAutoComp1.useShadow = true;
 				oAutoComp1.maxResultsDisplayed = 15;
   				oAutoComp1.useIFrame = true;
	 		}
	 	}
	 	yuiflag1[currRow.rowIndex]=1;
	  }
   }
   
   function fillNeibrAfterSplit(obj,neibrObjName){
		var currRow=getRow(obj);	
		yuiflag1[currRow.rowIndex] = undefined;
		neibrObj=getControlInBranch(currRow,neibrObjName);
		var temp = obj.value;
		temp = temp.split("`-`");
		document.gratuityForm.checkEmpCode.value = temp[1];
		obj.value=temp[0];		
		if(temp[1]!=null){			
	  		document.getElementById("employeeName").value = temp[1];
			neibrObj.value = temp[2]
		}
		else{
			getEmployeeByEnteringCode(temp[0],neibrObj);
			document.getElementById("employeeName").value = "";
		}

 	}
 	
 	function loadEmpCodes() { 	
		 var type='getAllPensionEligibleEmployee';
			var url = "${pageContext.request.contextPath}/commons/process.jsp?type=" +type+ " ";
			var req2 = initiateRequest();
			 req2.onreadystatechange = function()
			 {
					  if (req2.readyState == 4)
					  {
						  if (req2.status == 200)
						  {
							var codes2=req2.responseText;
							var a = codes2.split("^");
							var codes = a[0];
							empCodeArray=codes.split("+");
							selectedEmpCode = new YAHOO.widget.DS_JSArray(empCodeArray);
						  }
					  }
			};
			req2.open("GET", url, true);
		req2.send(null);
 	}
 	
 	function getEmployeeByEnteringCode(code,empId){
		var url = "${pageContext.request.contextPath}/commons/process.jsp?type=getPensionEligibleEmployeeByCode&code="+code;
      	var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var glcodes=req.responseText;					
                   	var a = glcodes.split("^");
                   	var codes = a[0];								
					var emp = codes.split("`-`");					
					if(codes == ""){
						//alert("Enter correct glcode");
						//document.payheadForm.glcode.focus();
					}
					else{
						empId.value = emp[2];
						document.gratuityForm.checkEmpCode.value = emp[1];  	
				  		document.getElementById("employeeName").value = emp[1];
					}
	           }
	       }
        };
	   req.open("GET", url, true);
	   req.send(null);
  	}
	
   function getRow(obj){
		if(!obj)return null;
		tag = obj.nodeName.toUpperCase();
		while(tag != 'BODY'){
			if (tag == 'TR') return obj;
			obj=obj.parentNode;
			tag = obj.nodeName.toUpperCase();
		}
		return null;
	}
	

	function whichButtonNominee(e,tbl,obj,objr){
		var F2 = 113;
		var del = 46;
		var code;
		if ( !e )
		 var e = window.event;
		if ( e.keyCode ) code = e.keyCode ;
		else if ( e.which ) code = e.which ;		
	   if(objr=="nominee" && checkForNomineeSelection())
			addRowToTable(tbl,obj);
	}

	function deleteRow(table,obj){		
		if(table=='nomineeTable'){
			var tbl = document.getElementById(table);
			var rowNumber=getRow(obj).rowIndex;	
			//alert(tbl.rows.length);
		//	alert("{gratuityForm.nomineeName.length);
			if(tbl.rows.length > 3)
			   tbl.deleteRow(rowNumber);
			else{
				alert("You cannot delete this row");
				return false;
			}
		}		
	}

	function addRowToTable(tbl,obj){
		  tableObj=document.getElementById(tbl);
		  var rowObj1=getRow(obj);
		  var tbody=tableObj.tBodies[0];
		  var lastRow = tableObj.rows.length;		 
		  var checkRowLength = eval(getControlInBranch(tableObj.rows[rowObj1.rowIndex],'nomineeName').options.length) + 1;
		  if(tbl=='nomineeTable' && lastRow< checkRowLength){	
			   var rowObj = tableObj.rows[lastRow-1].cloneNode(true);
			   tbody.appendChild(rowObj);	
			   var remlen = document.gratuityForm.nomineeAmount.length;			  
			   document.gratuityForm.nomineeAmount[remlen-1].value="";
			   document.gratuityForm.nomineeMonthlyPensionPayable[remlen-1].value="";			   
		  }
		  else
		  {
			  if(tbl=='nomineeTable')
			  {
				alert("No nominee Available to insert");
				return false;
			  }
		  }	 
	}  

	function checkForPensionHeaderExist(){
		var type = "getPensionHeaderDetails";
		var empId = document.getElementById("employeeCodeId").value;		
		var url = "${pageContext.request.contextPath}/commons/gratuityAJAX.jsp?type="+type+ "&empId="+empId ;
		var isExist;
		var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var response = req.responseText
					var result = response.split("/");
                   	if(result[0]=="exist"){
                   		isExist = "exist";
					}
                   	else if(result[0]=="notExist"){
         				isExist = "notExist";
                   	}
	       		}
	       	}
        };
		req.open("GET", url, false);
		req.send(null);		
		return isExist;
	}
	
	function checkForPensionDetailsByEmp(){
		var type = "getPensionDetailsByEmp";
		var empId = document.getElementById("employeeCodeId").value;		
		var url = "${pageContext.request.contextPath}/commons/gratuityAJAX.jsp?type="+type+ "&empId="+empId ;
		var isExist;
		var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var response = req.responseText
					var result = response.split("/");
                   	if(result[0]=="exist"){
                   		isExist = "exist";
					}
                   	else if(result[0]=="notExist"){
         				isExist = "notExist";
                   	}
	       		}
	       	}
        };
		req.open("GET", url, false);
		req.send(null);		
		return isExist;
	}

	function checkForApprovedPensionDetailsByEmp(){
		var type = "getApprovedPensionDetailsByEmp";
		var empId = document.getElementById("employeeCodeId").value;		
		var url = "${pageContext.request.contextPath}/commons/gratuityAJAX.jsp?type="+type+ "&empId="+empId ;
		var isExist;
		var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var response = req.responseText
					var result = response.split("/");
                   	if(result[0]=="exist"){
                   		isExist = "exist";
					}
                   	else if(result[0]=="notExist"){
         				isExist = "notExist";
                   	}
	       		}
	       	}
        };
		req.open("GET", url, false);
		req.send(null);		
		return isExist;
	}

	function validateEmployeeGratuityEligibility(){
		alert("validate");
		var type = "validateEmployeeGratuityEligibility";
		var empId = document.getElementById("employeeCodeId").value;		
		var url = "${pageContext.request.contextPath}/commons/gratuityAJAX.jsp?type="+type+ "&empId="+empId ;
		var isExist;
		var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var response = req.responseText
					var result = response.split("/");
                   	if(result[0]=="true"){
                   		isExist = "ture";
					}
                   	else if(result[0]=="false"){
         				isExist = "false";
                   	}
	       		}
	       	}
        };
		req.open("GET", url, false);
		req.send(null);		
		return isExist;
	}
	
	function validateEmployeeRecordRecoveryEligibility(){
		alert("validate");
		var type = "validateRecordRecoveryEmp";
		var empId = document.getElementById("employeeCodeId").value;		
		var url = "${pageContext.request.contextPath}/commons/gratuityAJAX.jsp?type="+type+ "&empId="+empId ;
		var isExist;
		var req = initiateRequest();
      	req.onreadystatechange = function(){
	      if (req.readyState == 4){
	            if (req.status == 200){
                   	var response = req.responseText
					var result = response.split("/");
                   	if(result[0]=="true"){
                   		isExist = "ture";
					}
                   	else if(result[0]=="false"){
         				isExist = "false";
                   	}
	       		}
	       	}
        };
		req.open("GET", url, false);
		req.send(null);		
		return isExist;
	}

	function validateOnSearch(){			
		if(document.gratuityForm.employeeCode.value == ""){
			alert("Enter employee code");	
			document.gratuityForm.employeeCode.focus();
			return false;
		}
		if(document.gratuityForm.checkEmpCode.value == "undefined"){
			alert("Enter correct employee code");	
			document.gratuityForm.employeeCode.focus();
			return false;
		}
		if(checkForPensionDetailsByEmp() == "notExist"){
				alert("Gratuity computation not done for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
		}
		if(checkForApprovedPensionDetailsByEmp() == "exist"){
				alert("Gratuity already approved,Record recovery not possible for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
		}

/*	<%	if("create".equals(mode)){	%>
			if(checkForPensionDetailsByEmp() == "exist"){
				alert("Gratuity computation already done for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
			}
			if(validateEmployeeGratuityEligibility() == "false"){
				alert("Gratuity computation not possible for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
			}
			if(checkForPensionHeaderExist() == "notExist"){
				alert("Pension header is not there for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
			}
	<%	}	
		if("modify".equals(mode) || "view".equals(mode)){	%>    	 		
			if(checkForPensionDetailsByEmp() == "notExist"){
				alert("Gratuity computation not done for this employee");
				document.gratuityForm.employeeCode.focus();
				return false;
			}
	<%	}	%>		
*/
	   var mode = "<%= mode%>";
  	   document.forms("gratuityForm").action ="${pageContext.request.contextPath}/pension/gratuityAction.do?submitType=beforeRecovery&mode="+mode;
	   document.forms("gratuityForm").submit();
  	} 	

	


</script>

</head>
<body onLoad="onBodyLoad();">
<html:form action ="/pension/gratuityAction" >
	
 	<input type="hidden" name="checkEmpCode"/>
 	
 	
  <table style="width: 800; " align="center" cellpadding="0" cellspacing="0" border="1" id="employeeTable" >
   	<tr>
	    <td colspan="6" height=30 bgcolor=#bbbbbb align=middle  class="tablesubcaption"><p align="center"><b>
		<%	if("create".equals(mode)){	%>
    	 		Record Recovery 
			<%	}
			if("modify".equals(mode)){	%>
    	 		Recovery Modify 
			<%	}
			if("view".equals(mode)){	%>
    	 		Recovery View 
			<%	}	%>
		
		&nbsp;&nbsp;&nbsp;</b></td>
    	</tr>
   	<tr>
   		<td class="labelcellforbg" align="right" colspan="4">&nbsp</td>
   	</tr>  
   	 <tr>
	    <input type="hidden" name="employeeCodeId" id="employeeCodeId" value="${gratuityForm.employeeCodeId}" />
	 	<td class="labelcell"><b>Employee Code</b><font color="red">*</font></td>
	  	<td class="labelcell">
	  		<input type="text"  class="fieldcell" name="employeeCode" id ="employeeCode" autocomplete="off"
	  		 onkeyup="autocompleteEmpCode(this);" onblur="fillNeibrAfterSplit(this,'employeeCodeId');
	  		 trim(this,this.value);" value="${gratuityForm.employeeCode }" />
	  	</td>
	  	<td class="labelcell"><b>Employee Name</b></td>
	  	<td class="labelcell">
		  	<input type="text"  class="fieldcell" name="employeeName" id ="employeeName" value="${gratuityForm.employeeName }" readOnly />
	  	</td>
    </tr>
  	<tr>
  		<td><div id="codescontainer"></div></td>
    </tr>
    
   </table>
   
   <table style="width: 800; " align="center" cellpadding="0" cellspacing="0" border="0" id="sumbitTable" >
    <tr>
	    <td class="labelcell"></td>
    	<td class="labelcell" align="center">
			<%	if("create".equals(mode)){	%>
    	 		<html:submit property="actionType" value="Record Recovery" onclick="return validateOnSearch();"/>
			<%	}
				if("modify".equals(mode)){	%>
    	 		<html:submit property="actionType" value="Modify Recovery" onclick="return validateOnSearch();"/>
			<%	}
				if("view".equals(mode)){	%>
    	 		<html:submit property="actionType" value="View Recovery" onclick="return validateOnSearch();"/>
			<%	}	%>
    	</td>
   	</tr>
   </table>
   
</html:form>
</body>
</html>
