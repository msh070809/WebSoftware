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
	public ArrayList<Items> GetPantsList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist WHERE itemId BETWEEN 1 AND 10";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemId(rs.getInt("itemId"));
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getInt("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Result;
	}
	public ArrayList<Items> GetShoesList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist WHERE itemId BETWEEN 11 AND 20";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemId(rs.getInt("itemId"));
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getInt("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Result;
	}
	public ArrayList<Items> GetShirtList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist WHERE itemId BETWEEN 21 AND 30";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemId(rs.getInt("itemId"));
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getInt("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Result;
	}
	public ArrayList<Items> GetGlovesList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist WHERE itemId BETWEEN 41 AND 50";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemId(rs.getInt("itemId"));
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getInt("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Result;
	}
	public ArrayList<Items> GetCapList() {
		ArrayList<Items> Result = new ArrayList<Items>();
		String SQL = "SELECT * FROM itemlist WHERE itemId BETWEEN 31 AND 40";
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Items a = new Items();
				a.setItemId(rs.getInt("itemId"));
				a.setItemTitle(rs.getString("itemTitle"));
				a.setItemContent(rs.getString("itemContent"));
				a.setItemPrice(rs.getInt("itemPrice"));
				a.setItemImage(rs.getString("itemImage"));
				Result.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Result;
	}
}
