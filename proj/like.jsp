<%@ include file="connect.jsp" %>
<%
int mid= Integer.parseInt(request.getParameter("mid"));
String sender=(String)session.getAttribute("email");
PreparedStatement pst=con.prepareStatement("insert into sm_like values (?,?)");
pst.setInt(1,mid);
pst.setString(2, sender);
pst.executeUpdate();
response.sendRedirect("Userhome.jsp");
%>