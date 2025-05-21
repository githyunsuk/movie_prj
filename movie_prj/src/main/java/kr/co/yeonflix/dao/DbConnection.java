package kr.co.yeonflix.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {

	private static DbConnection dbCon;
	private static Context ctx;
	
	private DbConnection() {
		
	}//DbConnection
	
	public static DbConnection getInstance() {
		if(dbCon == null) {
			dbCon = new DbConnection();
			try {
				ctx = new InitialContext();
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		return dbCon;
	}//getInstance
	
	public Connection getDbConn() {
		Connection con = null;
		
		DataSource ds;
		try {
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp/3");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return con;
	}//getDbConn
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		try {
			if(rs != null) { rs.close(); }
			if(stmt != null) { stmt.close(); }
		}finally {
			if(con != null) { con.close(); }
		}
	}//dbClose
	
}
