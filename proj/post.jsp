<%@include file="connect.jsp" %>
<%
int mid=0;
PreparedStatement pst=con.prepareStatement("select max(mid) from sm_post");
ResultSet rs=pst.executeQuery();
if (rs.next())
    mid=rs.getInt(1);
    mid++;
    String sender=(String)session.getAttribute("email");
    java.util.Date dt=new java.util.Date();
    String dt1=dt.toString();
    String msg=request.getParameter("ps");
    PreparedStatement pst1=con.prepareStatement("insert into sm_post values(?,?,?,?)");
    pst1.setInt(1,mid);
    pst1.setString(2,sender);
    pst1.setString(3,dt1);
    pst1.setString(4,msg);
    pst1.executeUpdate();
    con.close();
    response.sendRedirect("Userhome.jsp");
    %>
    