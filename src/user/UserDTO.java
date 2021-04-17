package user;

public class UserDTO {
	
	String userName;
	String userID;
	String userPassword;
	String userWallet;
	String Product_Name;
	String Product_Qu;
	String Product_Pr;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserID(){
		return userID; 
	} 
	public void setUserID(String userID){
		this.userID = userID; 
	} 
	
	public String getUserPassword(){
		return userPassword;
	} 
	public void setUserPassword(String userPassword){
		this.userPassword = userPassword; 
	}
	
	public String getuserWallet(){
		return userWallet; 
	}
	public void setuserWallet (String userWallet){
		this.userWallet = userWallet;
	}
	
	
}
