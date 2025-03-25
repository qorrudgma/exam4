<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
		padding-right: 15px;
	}
</style>
</head>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from emp";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		%>
		<table border="1">
			<tr>
				<td>사원번호</td>
				<td>사원명</td>
				<td>직급</td>
				<td>상관번호</td>
				<td>입사일자</td>
				<td>급여</td>
				<td>커미션</td>
				<td>부서번호</td>
			</tr>
			
				<%
				while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt("EMPNO") %></td>
						<td><%=rs.getString("ENAME") %></td>
						<td><%=rs.getString("JOB") %></td>
						<td>
							<%
								rs.getInt("MGR");
								if(rs.wasNull()){
									out.print("null");
								}else{
									out.print(rs.getInt("MGR"));									
								}
							%>
						</td>
						<td><%=rs.getString("HIREDATE") %></td>
						<td>
							<%
								if(rs.getString("ENAME").equals("SMITH")){
									out.print(rs.getDouble("SAL"));
								}else{
									out.print(rs.getInt("SAL"));									
								}
							%>
						</td>
						<td>
							<%
								rs.getInt("COMM");
								if(rs.wasNull()){
									out.print("null");
								}else{
									out.print(rs.getInt("COMM"));									
								}
							%>
						</td>
						<td><%=rs.getInt("DEPTNO") %></td>
					</tr>
					<%
					}		
				%>
		</table>
<body>

</body>
</html>