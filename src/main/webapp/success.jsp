<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<center>
<table border="1" width="30%" cellpadding="3">
    <tr>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Email</td>
    </tr>
    <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String query="select * from members";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB",
                    "root", "");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

    %>
    <form method="post" action = "modify-list.jsp">
    <tr>

    <td><%=rs.getString("first_name")%>&nbsp;&nbsp;</td>
    <td><%=rs.getString("last_name") %>&nbsp;&nbsp;</td>
    <td><%=rs.getString("email") %>&nbsp;&nbsp;</td>
        <input type="hidden" name="user" value="<%=rs.getString("uname")%>" />
        <% if(!session.getAttribute("userid").equals(rs.getString("uname"))) {%>
        <%
                out.println("<td><input onclick=\"return confirm('Are you sure you want to remove')\" type=\"submit\" value = \"remove\" name = \"btn\"/>&nbsp;&nbsp;<input type=\"submit\" value = \"edit\" name = \"btn\"/></td>");
        }else if(session.getAttribute("userid").equals(rs.getString("uname"))){
            out.println("<td><input type=\"submit\" value = \"edit\" name = \"btn\"/></td>");
        }
        %>
    </tr>
    </form>
    <%

        }
    %>
    <form method = "post" action = "add.jsp">
    <tr>
        <td><input type="text" name="add_fname" value="" placeholder="Enter Firstname" /></td>
        <td><input type="text" name="add_lname" value="" placeholder="Enter Lastname" /></td>
        <td><input type="text" name="add_email" value="" placeholder="Enter Email" /></td>
        <td><input type="text" name="add_uname" value="" placeholder="Enter Username" /></td>
        <td><input type="password" name="add_pwd" value="" placeholder="Enter Password" /></td>
        <td><input onclick="return confirm('Are you sure you want to add')" type="submit" value = "add" name="btn" /></td>
    </tr>
    </form>
</table>
    <p><font color = "red">
    <%
        if(null!=request.getAttribute("add_error"))
        {
            out.println("*"+request.getAttribute("add_error"));
            session.removeAttribute("add_error");
        }
    %>
    </p></font>
</center>
<%
        rs.close();
        stmt.close();
        con.close();
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }




%>

<%
    }
%>