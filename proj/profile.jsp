<title>Profile UI </title>
<%@ include file="connect.jsp" %>
<%@ include file="user_menu.jsp" %>
<link rel="stylesheet" href="./s_profile.css">
<%
PreparedStatement pst =con.prepareStatement("select * from sm_user_info where email=?");
pst.setString(1,(String)session.getAttribute("email"));
ResultSet rs=pst.executeQuery();
if(rs.next()){
    String email = rs.getString(1);
    String name = rs.getString(2);
    String ph=rs.getString(3);
    String dob = rs.getString(4);
    String uimage=rs.getString(6);
%>
<div class="card-container">
	<a href="pic_upload.jsp"><img class="round" src="./image/<%=uimage%>" height=200 width=190 alt="user" /></a>
	<h3><%=name%></h3>
    <h6 class="em"><%=email%></h6>
	<h6>DOB: <%=dob%></h6>
    <h6>PHONE: <%=ph%></h6>
	<p><a class="link-12" href="e_profile.jsp">Update Profile</a></p>
</div>
<%
}


con.close();
%>
