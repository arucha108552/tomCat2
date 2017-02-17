<%@ page import ="java.sql.*" %>
<%@ page import ="io.muic.ooc.thienthai.tomCat.hashProg" %>
<%
    String userid = request.getParameter("uname");
    String pwd = hashProg.hashPassword(request.getParameter("pass"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iceDB",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        session.invalidate();
        request.setAttribute("errorMessage", "Invalid user or password");
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
        response.sendRedirect("index.jsp");
    }
%>
