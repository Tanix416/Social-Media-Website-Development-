<link rel="stylesheet" href="./s_view_upic.css">
<%@ include file="connect.jsp" %>
<%!
	String uimage="";
%>
<%
	String email=(String)session.getAttribute("email");
	PreparedStatement pst=con.prepareStatement("select picture from sm_user_info where email=?");
	pst.setString(1,email);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	 uimage=rs.getString(1);
	
%>
<div class="card-container">
<a href="pic_upload.jsp"><img src="./image/<%=uimage%>" class="round" height=50 width=50></img></a>
</div>