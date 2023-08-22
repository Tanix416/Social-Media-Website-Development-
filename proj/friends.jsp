<body>
<title> Friends UI</title>
<link rel="stylesheet" href="./s_friends.css">
<center>
<%@ include file="user_menu.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<form action="fsearch.jsp" class="frm" method=post>
<input class="shadow" type=text placeholder=Name name=fn>
<input class="shadow" type=submit value=search>
</form>

<%
    PreparedStatement pst=con.prepareStatement("select * from sm_friend where receiver=? and flag=0");
     pst.setString(1,(String)session.getAttribute("email"));
     ResultSet rs=pst.executeQuery();
      while(rs.next())
{
String senderid=rs.getString(1);
PreparedStatement pst1=con.prepareStatement("select * from sm_user_info where email=?");
pst1.setString(1,senderid);
ResultSet rs1=pst1.executeQuery();
if(rs1.next()){
String nm=rs1.getString(2);
String image=rs1.getString(6);
%>
<br><br>
<div class="author shadow">
<form action="req_acc_rej.jsp" method=post>
    <img class="author-image" src="./image/<%=image%>" height=60 width=60></img>
    <div class="author-content">
    <p class="author-name"><%=nm%></p>
   </div>
<input type=hidden name=senderid value=<%=senderid%>>
<input type=submit name=b1 value="Accept"><br>
<input type=submit name=b1 value="Reject">
</form>
</div>
<%
}
}
%>
<br><br>
<span class="shadow1" >Friends</span><br>
<%
String owner =(String)session.getAttribute("email");
PreparedStatement pst2=con.prepareStatement("select * from sm_friend where flag=1 and (sender=? or receiver=?)");
pst2.setString(1, owner);
pst2.setString(2, owner);
ResultSet rs2 = pst2.executeQuery();
String fid="";
while(rs2.next()){
    String sender=rs2.getString(1);
    String receiver=rs2.getString(2);
    if(sender.equals(owner))
        fid=receiver;
    else
        fid=sender;
    PreparedStatement pst3 = con.prepareStatement("select * from sm_user_info where email=?");
    pst3.setString(1,fid);
    ResultSet rs3 = pst3.executeQuery();
    if(rs3.next()){
        String name=rs3.getString(2);
        String image=rs3.getString(6);
        %>

       <!-- <br><br>
       <img src="./image/<%=image%>" height=60 width=60></img>
        Name: <%=name%>-->
        <br>
        <div class="author shadow">
            <img class="author-image" src="./image/<%=image%>" height=60 width=60></img>
            <div class="author-content">
              <p class="author-name"><%=name%></p>
             </div>           
        </div>

        <%
    }
}
con.close();
%>
</center>
</body>