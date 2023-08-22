<link rel="stylesheet" href="./s_comment1.css">
<title>Comment UI</title>
<%@ include file="connect.jsp" %>
<%@ include file="user_menu.jsp" %>
<%
try{
int mid= Integer.parseInt(request.getParameter("mid"));
%>
<center>
<div class="post_cmt"></div>
<form action="comment2.jsp" method=post >
<textarea name="msg" class="shadow" placeholder="Write Comment"></textarea>
<input type=hidden  name="mid" value="<%=mid%>">
<button type=submit class="shadow1">Comment</button>
</form>
</center>
<%
PreparedStatement pst= con.prepareStatement("select * from sm_comment where mid=?");
pst.setInt(1, mid);
ResultSet rs= pst.executeQuery();
while (rs.next()) {
    String nm= rs.getString(2);
    String msg= rs.getString(3);
    String name=" ";
    PreparedStatement pst1=con.prepareStatement("select * from sm_user_info where email=? ");
    pst1.setString(1, nm);
    ResultSet rs1= pst1.executeQuery();
    if(rs1.next()) {
    name=rs1.getString(2);
    String image=rs1.getString(6);
    %>
    <ul class="comment-section">
        <li class="comment user-comment">
            <div class="info">
                <a href="#"><%=name%></a>
            </div>
            <a class="avatar" href="#">
                <img src="./image/<%=image%>" width="35" alt="Profile Avatar" title="Anie Silverston" />
            </a>
            <p class="msg"><%=msg%></p>
        </li>
        </ul>
    <%
    }
}
}
catch(Exception e) {
    out.println(e);
}
con.close();
%>
