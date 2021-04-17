package user;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import Util.DatabaseUtil;
import java.sql.ResultSet;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;
	
	public int join(String userName, String userID, String userPassword){
		String SQL = "INSERT INTO USER (userName, userID, userpassword) VALUES (?,?,?)"; 
		try { 
			// 각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			
			// 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
			pstmt.setString(1, userName); 
			pstmt.setString(2, userID);
			pstmt.setString(3, userPassword);
		
			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate(); 
			
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
			return -1;
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; // 로그인 성공
				else
					return 0; //비밀번호 불일치
				
			}
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미합니다.
	}
	
	public int Edit(String userName, String userID, String userPassword){
		String SQL = "UPDATE USER SET userPassword=? WHERE userID=? AND userName=?"; 
		try { 
			
			PreparedStatement pstmt1 = conn.prepareStatement(SQL); 
				
			pstmt1.setString(2, userID);
			pstmt1.setString(1, userPassword);
			pstmt1.setString(3, userName); 
		
			return pstmt1.executeUpdate(); 
			
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
			return -1;
	}
	
}
	
	
