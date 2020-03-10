package boardPrac;

import java.text.SimpleDateFormat;

public class MemberVo {
	String userId;
	String userPwd;
	String userName;
	String userGender;
	String userEmail;
	String enroll_date;
	private transient SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	public MemberVo(String userId, String userPwd, String userName, String userGender, String userEmail,
			String enroll_date) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.enroll_date = enroll_date;
	}
	
	public MemberVo() {
		
	}
	
	public String getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(String enroll_date) {
		this.enroll_date = enroll_date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	private transient String pattern = "{'userId' : '%s', 'userPwd' : '%s', 'userName' : '%s', "
			+ "'userGender' : '%s', 'userEmail' : '%s', 'enroll_date' : '%s'}";
	
	public String toJSON() {
		String json = String.format(pattern, userId, userPwd, userName, userGender, userEmail, enroll_date);
		json = json.replaceAll("\'", "\"");
		return json;
	}
	

}
