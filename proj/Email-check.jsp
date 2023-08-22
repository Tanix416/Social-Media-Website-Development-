<%@ include file="connect.jsp" %>
<%
     PreparedStatement pst=con.prepareStatement("select * from sm_user_info where email=?");
      pst.setString(1,request.getParameter("email"));
       ResultSet rs=pst.executeQuery();
     if(rs.next())
     {
%>
1
<%
     }
     else
     {
%>
2
<%
     }
    con.close();
%>