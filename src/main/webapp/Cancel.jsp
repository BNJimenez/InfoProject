<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//Get the database connection
try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			
			//String sch = request.getParameter("search");
			
			String cancel = request.getParameter("fCancel");
			String delTix = "";
			if(cancel != null){
				session.setAttribute("fCancel", cancel);
			}
			
			String str = "SELECT * FROM otrs.ticket";
			ResultSet result = stmt.executeQuery(str);
			
			%>
			<br>
			<form method="get" action="Cancel.jsp">
				<label>Enter a id number of ticket to cancel: <input name = "fCancel"/></label>
			  <input type="submit" value="Cancel Reservation" />
			</form>
			<br>
			<form method="get" action="AccountInfo.jsp">
			  <input type="submit" value="Back" />
			</form>
			
			


    
			<br>
		<% 
		
		
		boolean invalid = false;
		if(cancel!=null){
		while(result.next()){
			if(cancel.equals(result.getString("id_num"))){
				delTix = "DELETE FROM otrs.ticket WHERE id_num = " + result.getInt("id_num");
				PreparedStatement ps = con.prepareStatement(delTix);
				ps.executeUpdate();
				out.print("Deleted ticket with id number: " + result.getInt("id_num"));
				 invalid=true;
				break;
			}
				
			
			
			}
		}
		
		if(invalid == false){
			out.print("invalid");
		}
		
		
		
			
			
				
			
						
					
					
} catch (Exception e) {
	out.print(e);
}
			%>
			
</body>
</html>