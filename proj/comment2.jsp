<%@ include file="connect.jsp" %>
<%
int mid=0;
try{
    mid=Integer.parseInt(request.getParameter("mid"));
    String msg=request.getParameter("msg");
    //out.println(mid);
    //out.println(msg);
    PreparedStatement pst=con.prepareStatement("insert into sm_comment values(?,?,?)");
    pst.setInt(1,mid);
    pst.setString(2,(String)session.getAttribute("email"));
    pst.setString(3,msg);
    pst.executeUpdate();
    response.sendRedirect("comment1.jsp?mid="+mid);
     
}
catch (Exception e){
out.println(e);
}
con.close();
%>