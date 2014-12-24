<%@page import="org.egov.exceptions.EGOVRuntimeException"%>
<%@page import="org.hibernate.jdbc.ReturningWork"%>
<%@ page language="java" import="org.egov.infstr.security.utils.SecurityUtils,java.sql.*,org.egov.infstr.utils.HibernateUtil"%>
	<%
	
		StringBuilder qStr = new StringBuilder();
		final String type= request.getParameter("type");
		final String uppercase = request.getParameter("uppercase");
		final String lowercase = request.getParameter("lowercase");
		final String tablename = SecurityUtils.checkSQLInjection(request.getParameter("tablename"));
		final String columnname = SecurityUtils.checkSQLInjection(request.getParameter("columnname"));
		final String fieldvalue = SecurityUtils.checkSQLInjection(SecurityUtils.checkXSSAttack(request.getParameter("fieldvalue")));
		final String fieldvalue2 = SecurityUtils.checkSQLInjection(SecurityUtils.checkXSSAttack(request.getParameter("fieldvalue2")));
		final String columnname2 = SecurityUtils.checkSQLInjection(request.getParameter("columnname2"));
		
		if(type == null || type.equals("")) {
			qStr.append("SELECT ").append(columnname).append(" FROM ").append(tablename).append(" where ").append(columnname).append(" = ? ");
		} else if("compUniqueness".equals(type)) {
		   	qStr.append("SELECT ").append(columnname).append(" FROM ").append(tablename).append(" where ").append(columnname).append(" = ? and ").append(columnname2).append(" = ?");
		}
		final String sqlQuery = qStr.toString();
		final String resultStr = HibernateUtil.getCurrentSession().doReturningWork(new ReturningWork<String>(){
			public String execute(Connection con) {
				try {
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					if(type == null || type.equals("")) {
						if("yes".equalsIgnoreCase(uppercase)) {
					 		stmt.setString(1,fieldvalue.toUpperCase());
						} else if ("yes".equalsIgnoreCase(lowercase)) {
					 		stmt.setString(1,fieldvalue.toLowerCase());
						} else {
					 		stmt.setString(1,fieldvalue);
					 	}
					} else if("compUniqueness".equals(type)) {
					  	if ("yes".equalsIgnoreCase(uppercase)) {
					    	stmt.setString(1,fieldvalue.toUpperCase());
					    	stmt.setString(2,fieldvalue2.toUpperCase());
					    } else if ("yes".equalsIgnoreCase(lowercase)) {
					    	stmt.setString(1,fieldvalue.toLowerCase());
					    	stmt.setString(2,fieldvalue2.toLowerCase());
					    } else {
					     	stmt.setString(1,fieldvalue);
					    	stmt.setString(2,fieldvalue2);
					    }
					}
					ResultSet rs=stmt.executeQuery();
					StringBuffer resultStr = new StringBuffer();
					if(rs.next()) {
						resultStr.append("false");
					} else {
						resultStr.append("true");
					}
					resultStr.append("^");
					return resultStr.toString();
				} catch (Exception e) {
					throw new EGOVRuntimeException("Error occurred while checking Uniquiness of Data");
				}
			}
		});
		
		
	response.setContentType("text/plain;charset=utf-8");
	response.setHeader("Cache-Control", "no-cache");
	response.getWriter().write(resultStr);
	%>
