package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public UserDAO() {
		try {
			conn = DBConn.getConn();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		sql = "select userPassword from member where userID = ?";
		System.out.println(userID);
		System.out.println(userPassword);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userID);
			rs = ps.executeQuery();
			if(rs.next()) {
				//아이디가 있는 경우
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디가 존재하지 않음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스오류
		
	}
	
	public int join(User user) {
		sql = "insert into member values (?,?,?,?,?)";
		System.out.println(user.getUserID());
		System.out.println(user.getUserPassword());
		System.out.println(user.getUserName());
		System.out.println(user.getUserGender());
		System.out.println(user.getUserEmail());
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserID());
			ps.setString(2, user.getUserPassword());
			ps.setString(3, user.getUserName());
			ps.setString(4, user.getUserGender());
			ps.setString(5, user.getUserEmail());
			
			return ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
