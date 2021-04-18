 <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String nickname = request.getParameter("nickname");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;

	try {
		Context context = new InitialContext();
		Context env = (Context) context.lookup("java:comp/env");
		ds = (DataSource)env.lookup("jdbc/ora");
		// ds-(DataSource)env.lookup("java:comp/env/jdbc/ora");

		conn = ds.getConnection();
		conn.setAutoCommit(false);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	/*	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521:XE", "edu", "1234");
		conn.setAutoCommit(false);
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	*/

	int n = 0;
	if (!nickname.equals("") && nickname != null) {
		try {
			String sql = "SELECT COUNT(NICKNAME) FROM USERS WHERE NICKNAME=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				n = rs.getInt(1); //컬럼명을 사용할 수 없을때는 인덱스 번호를 사용.
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	} // end if

	if (n > 0) {
	%>
	<span style="color: red; font-weight: bold">사용중</span>인 닉네임 입니다.
	<%
} else {
%>
	<span style="color: green; font-weight: bold">사용 가능</span>한 닉네임 입니다.
	<%
}
%>
</body>
</html>