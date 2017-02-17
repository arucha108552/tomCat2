<%@ page import ="java.sql.*" %>
<%@ page import ="io.muic.ooc.thienthai.tomCat.hashProg" %>
<%
    String user = request.getParameter("add_uname");
    String pwd = hashProg.hashPassword(request.getParameter("add_pwd"));
    String fname = request.getParameter("add_fname");
    String lname = request.getParameter("add_lname");
    String email = request.getParameter("add_email");
    if(user.length() == 0 || pwd.length() == 0 || fname.length() == 0 || lname.length() == 0 || email.length() == 0){
        request.setAttribute("add_error", "Some fill is missing please fill them all or Duplicate Username");
        RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
        rd.forward(request, response);
        response.sendRedirect("success.jsp");
    }else {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB",
                "root", "");
        Statement st = con.createStatement();
        try {
            int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
            if (i > 0) {
                //session.setAttribute("userid", user);
                response.sendRedirect("success.jsp");
                // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
            } else {
                request.setAttribute("add_error", "Some fill is missing please fill them all or Duplicate Username");
                RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
                rd.forward(request, response);
                response.sendRedirect("success.jsp");
            }
        } catch (Exception e) {
            request.setAttribute("add_error", "Some fill is missing please fill them all or Duplicate Username");
            RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
            rd.forward(request, response);
            response.sendRedirect("success.jsp");
        }
    }
%>