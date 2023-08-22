<%@ include file="connect.jsp" %>
<%
     PreparedStatement pst=con.prepareStatement("select * from sm_user_info where name=?");
      pst.setString(1,request.getParameter("name"));
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