<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>      
<%@page import = "java.sql.*"%>
<%
String backUrl = "" ;
String alertMsg = "" ;
boolean allowDB = true ;
String sql = "";
String getSQL = "" ;
try {
    String account = new String(request.getParameter("Account"));
    String password = new String(request.getParameter("Password"));
    String rePassword = new String(request.getParameter("Repassword"));
    String email = new String(request.getParameter("email"));
    String gender = new String(request.getParameter("sex"));
    if(account == null || account.length() == 0){
        alertMsg = "account is Null";
        allowDB = false ;
    }
    if(email == null || email.length() == 0){
        alertMsg = "email is Null";
        allowDB = false ;
    }
    if(password == null || password.length() == 0){
        alertMsg = "password is Null";
        allowDB = false ;
    }
    if(!password.equals(rePassword)){
        alertMsg = "[25] Password and RePassword isn't match." + password +" | " + rePassword;
        allowDB = false ;
    }
    if(allowDB){
        sql = "INSERT INTO `final-demo`.`member` ( `Account`,  `Password`, `email`, `gender`) VALUES ('" + account + "', '" + password + "', '" + email + "', '" + gender + "');" ;
        getSQL = "SELECT * FROM `final-demo`.`member` WHERE `Account` ='" + account + "';" ;
        //out.println(sql); 
    }
}
catch(Exception e) {
    alertMsg = "[29] Form Data convert error." ;
}
if(allowDB){
    try{
        //載入資料庫驅動程式 
        Class.forName("com.mysql.jdbc.Driver");	  
        try {
            //建立連線 
            String url="jdbc:mysql://localhost/";
            Connection con=DriverManager.getConnection(url,"root","1234");   				
            if(con.isClosed())
                out.println("連線建立失敗");
            else{	
                //選擇資料庫
                con.createStatement().execute("use `final-demo`");
                //SQL語法，這裡需要用單引號
                
                ////////////
                // Check Member.account is not registered
                ////////////
                ResultSet tmp =  con.createStatement().executeQuery(getSQL);
                boolean hadRepeat = false ;
                while(tmp.next()){		
                    hadRepeat = true ;
                }
                if(hadRepeat) {
                    out.println("ACCOUNT已重複無法註冊.");
                    response.setHeader("refresh","2;URL=Creat.jsp") ;
                }
                else {
                    ////////////
                    // Add to Member DB.
                    ////////////
                    boolean no= con.createStatement().execute(sql); //執行成功傳回false
                    //int no=con.createStatement().executeUpdate(sql); //可回傳異動數
                    if (!no){
                        //顯示結果 
                        out.println("新增成功");
                        alertMsg = "[成功] 會員成功新增";
                        backUrl = "Creat.jsp" ; 
                        //response.sendRedirect("index.jsp") ;               
                    }
                    else{
                        out.println("新增失敗"); 
                        alertMsg = "[69] 會員新增失敗";
                        backUrl = "" ;
                        response.sendRedirect("Creat.jsp") ;
                    }
                    out.println(alertMsg);
                    out.println(backUrl);
                }                
                con.close();
            }
        }        
        catch (SQLException sExec) {
            out.println("SQL錯誤:"+sExec.toString());
        }
    }
    catch (ClassNotFoundException err) {
        out.println("class錯誤 :"+err.toString());
    }
}
else{
    out.println(alertMsg); 
}
%>