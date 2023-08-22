  <title> Dashboard UI</title>
  <link rel="stylesheet" href="./s_Userhome.css">
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
<%@ include file="view_upic.jsp" %>
<center>
  <%@ include file="user_menu.jsp" %>
<br><br>
<form action="post.jsp" mathod=post >
<textarea class="shadow" name=ps placeholder="whats in your mind"  required="required"></textarea>
<input class="shadow1" type=submit value=post>
</form> 
<%
int mid=0;
PreparedStatement pst1=con.prepareStatement("select * from sm_post order by mid desc");
ResultSet rs1=pst1.executeQuery();
while(rs1.next()){
  mid=rs1.getInt(1);
  String owner_post=rs1.getString(2);
  String dt=rs1.getString(3);
  String msg=rs1.getString(4);
  int f=0;
  String owner=(String)session.getAttribute("email");
  if(owner_post.equals(owner))
    f=1;
  PreparedStatement pst2=con.prepareStatement("select * from sm_friend where flag=1 and (sender=? and receiver=?) or(sender=? and receiver=?)");
  pst2.setString(1,owner_post);
  pst2.setString(2,owner);
  pst2.setString(3,owner);
  pst2.setString(4,owner_post);
  ResultSet rs2=pst2.executeQuery();
  if(rs2.next())
    f=1;
  String name1=" ";
  if(f==1){
    PreparedStatement pst3=con.prepareStatement("select * from sm_user_info where email=?");
    pst3.setString(1,owner_post);
    ResultSet rs3=pst3.executeQuery();
    if(rs3.next()){
       name1=rs3.getString(2);
      String image=rs3.getString(6);
      PreparedStatement pst4=con.prepareStatement("select count(*),mid from sm_like where mid=? group by mid");
      pst4.setInt(1,mid);
      ResultSet rs4=pst4.executeQuery();
      int like=0;
      if(rs4.next())
        like=rs4.getInt(1);
      PreparedStatement pst5=con.prepareStatement("select count(*) from sm_comment where mid=? group by mid");
      pst5.setInt(1,mid);
      ResultSet rs5=pst5.executeQuery();
      int cmt=0;
      if(rs5.next())
         cmt=rs5.getInt(1);
    %>
    <br>
    <div class="cont-card">
      <div class="title">  
        <p><%=msg%></p>
      </div>
      <div class="footer">
        <img src="./image/<%=image%>">
        <div class="nm">
          <p> <%=name1%> </p>
      </div>
      </div>
      <form action="like.jsp" method=post>
        <input type=hidden name=mid value="<%=mid%>">
       <button type="submit" name="b1"><i class="fas fa-heart"><%=like%></i></button>
       </form>
        <form action="comment1.jsp" method=post>
        <input type=hidden name=mid value="<%=mid%>">
       <button type="submit" name="b1"><i class="fas fa-comment"><%=cmt%></i></button>
       </form>
    </div>
    <%
  
  }
  }
}
con.close();
%>
</center>


  