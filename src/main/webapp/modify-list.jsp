<%@ page import ="java.sql.*" %>

<%
    if(request.getParameter("btn").equals("remove")){
%>
<%
        try {
            String delUser = request.getParameter("user");
            Class.forName("com.mysql.jdbc.Driver");
            String query = "DELETE FROM members WHERE uname ='" + delUser + "'";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.close();
            con.close();
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            out.println("Data Base have problem cannot connect");
            out.println("Goback to list menu <a href='success.jsp'>Go Back</a>");
            response.sendRedirect("success.jsp");
        }
%>

<%
    }else if(request.getParameter("btn").equals("edit")) {%>
        <h4> Edit Profile Here </h4>
        <form method = "post" action = "editEngine.jsp">
            First Name&nbsp;<input type="text" name="edit_fname" value="" placeholder="Edit Firstname" /><br /><br />
            Last Name&nbsp;<input type="text" name="edit_lname" value="" placeholder="Edit Lastname" /><br /><br />
            Email&nbsp;<input type="text" name="edit_email" value="" placeholder="Edit Email" /><br /><br />
            <input type="submit" value="submit" />
            <input type="hidden" name="user2" value="<%=request.getParameter("user")%>" />
        </form>
        <%--out.println("<h4> Edit Profile Here </h4>");--%>
        <%--out.println("<form method = \"post\" action = \"editEngine.jsp\">");--%>
        <%--out.println("First Name&nbsp;<input type=\"text\" name=\"edit_fname\" value=\"\" placeholder=\"Edit Firstname\" /><br /><br />");--%>
        <%--out.println("Last Name&nbsp;<input type=\"text\" name=\"edit_lname\" value=\"\" placeholder=\"Edit Lastname\" /><br /><br />");--%>
        <%--out.println("Email&nbsp;<input type=\"text\" name=\"edit_email\" value=\"\" placeholder=\"Edit Email\" /><br /><br />");--%>
        <%--out.println("<input type=\"submit\" value=\"submit\" />");--%>
        <%--out.println("<input type=\"hidden\" name=\"user2\" value="request.getParameter("uname")\" />");--%>
        <%--out.println("</form>");--%>
<%
    }
%>
