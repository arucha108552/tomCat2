<%@ page import ="java.sql.*" %>
<%@ page import ="io.muic.ooc.thienthai.tomCat.hashProg" %>
<%
    String user = request.getParameter("uname");
    String pwd = hashProg.hashPassword(request.getParameter("pass"));
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    if(user.length() == 0 || pwd.length() == 0 || fname.length() == 0 || lname.length() == 0 || email.length() == 0){
        response.sendRedirect("error.jsp");
    }else {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB",
                "root", "");
        Statement st = con.createStatement();
        //ResultSet rs;
        try {
            int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
            if (i > 0) {
                //session.setAttribute("userid", user);
                response.sendRedirect("welcome.jsp");
                // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("error.jsp");
        }
    }
%>