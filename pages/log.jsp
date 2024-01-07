<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.* "%>
<%@ page import = "java.sql.*"%>
<%
	try
	{	
		Class.forName("com.mysql.jdbc.Driver");
		try
		{
			String url="jdbc:mysql://localhost/";
            Connection con=DriverManager.getConnection(url,"root","1234");   				
	        if(con.isClosed())
                out.println("連線建立失敗");
            else
            {
				String Account=request.getParameter("Account");
				String Password=request.getParameter("Password");
				Boolean no_in_data=true;
				
				con.createStatement().execute("USE `final-demo`");
				String sql="select * from `final-demo`.`member` where `Account` = '"+Account+"'";
				ResultSet tmp =  con.createStatement().executeQuery(sql);
				while(tmp.next())
				{
					no_in_data=false;
					String check_password=tmp.getString(4);
					if(check_password.equals(Password))
					{
						session.setAttribute("Account",request.getParameter("Account"));
						out.print("登入成功");
						response.sendRedirect("testlog.jsp") ; 
					}
					else
					{
						out.print("Your Input Hava Error");
					}
				}
				if(no_in_data)
				{
					out.print("去註冊");
				}
			}
			con.close();
		}
		catch(SQLException sExec)
		{
			out.print("SQL ERROR  :"+sExec.toString());
		}
	}
	catch(ClassNotFoundException err)
	{
		out.print("Class ERROR  :"+err.toString());
	}
%>