<%@include file="connect.jsp" %>
<%
   PreparedStatement pst=con.prepareStatement("insert into sm_user_info values(?,?,?,?,?,?)");
   pst.setString(2,request.getParameter("uname"));
   pst.setString(4,request.getParameter("dt"));
   pst.setString(1,request.getParameter("email"));
   pst.setString(3,request.getParameter("tn"));
   pst.setString(5,request.getParameter("passwd"));
   pst.setString(6,"dpic.png");
   int t=pst.executeUpdate();
   if(t>0)
   {
    out.println("<h1>Registered successfully");
 %>
   <br><a href=index.html>Click Here for login</a>
<%
    }
    con.close();
%>
  
