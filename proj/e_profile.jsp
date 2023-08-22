<%@ include file="connect.jsp" %>
<link rel="stylesheet" href="./user_style.css">
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
<div class="login">
    <form action="profile_update.jsp" method=post>
      <input type="text" name="email" value="<%=email%>"  readonly /><br>
      <input type="text" name="name" value="<%=name%>"  readonly /><br>
      <input type="text" name="ph" value="<%=ph%>"  required="required"/><br>
      <input type="date" name="dob" value="<%=dob%>" required="required"/><br>
    <button type="submit" class="btn btn-primary btn-block btn-large">profile_update</button>
      </form >
  </div>
<%
}


con.close();
%>
