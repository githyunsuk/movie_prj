package kr.co.yeonflix.dao;

import java.io.IOException;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class ConnectionTest extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/dbcp/3");
            Connection conn = ds.getConnection();

            response.getWriter().println("hi");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("no: " + e.getMessage());
        }
    }
}

