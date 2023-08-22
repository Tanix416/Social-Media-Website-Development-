<%@ include file="connect.jsp" %>
<%
PreparedStatement pst = con.prepareStatement("Update sm_user_info set dob=?,phone_no=? where email=?");
pst.setString(1,request.getParameter("dob"));
pst.setString(2,request.getParameter("ph"));
pst.setString(3,request.getParameter("email"));
pst.executeUpdate();
con.close();
response.sendRedirect("e_profile.jsp");
%>