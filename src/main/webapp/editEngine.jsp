<%@ page import="java.sql.*" %><%
    try {
        if (request.getParameter("edit_fname").length() != 0) {
            String update = request.getParameter("edit_fname");
            Class.forName("com.mysql.jdbc.Driver");
            String query = "UPDATE members SET first_name ='" + update + "' WHERE uname = '" + request.getParameter("user2") + "'";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.close();
            con.close();
        }

        if (request.getParameter("edit_lname").length() != 0) {
            String update = request.getParameter("edit_lname");
            Class.forName("com.mysql.jdbc.Driver");
            String query = "UPDATE members SET last_name ='" + update + "' WHERE uname = '" + request.getParameter("user2") + "'";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.close();
            con.close();
        }

        if (request.getParameter("edit_email").length() != 0) {
            String update = request.getParameter("edit_email");
            Class.forName("com.mysql.jdbc.Driver");
            String query = "UPDATE members SET email ='" + update + "' WHERE uname = '" + request.getParameter("user2") + "'";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.close();
            con.close();
        }
        %><script>alert("Success Editing");</script><%
        response.sendRedirect("success.jsp");
    }catch (Exception e){
        %><script>
            alert("Fail Editing");
        </script><%
        response.sendRedirect("success.jsp");
    }

%>