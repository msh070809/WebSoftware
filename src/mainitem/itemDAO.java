package mainitem;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class itemDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public itemDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/websoftware?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "tmddnr009";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
