package itemlist;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ItemDAO(){
		try {
			String dbURL = "jdbc:mysql://localhost:3306/websoftware?characterEncoding=UTF-8&severTimezone=UTC&useSSL=false";
			String dbID="root";
			String dbPassword = "moon5130$";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Items> GetItemList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getString("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(ps != null) try { ps.close(); } catch(SQLException ex) {}
		    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
		return Result;
	}
}
