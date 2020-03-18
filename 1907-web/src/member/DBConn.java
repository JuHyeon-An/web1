package member;

import java.sql.Connection;
import java.sql.DriverManager;

//������ �����
public class DBConn {

	public static Connection getConn() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "park";
		String dbPwd = "1234";
		
		Connection conn = null;
		try {
			Class.forName(driver).newInstance(); // newInstance�� �ɼ�(�ϰų����ų�)
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	
public static Connection getConnHr() { //hr�� �����ϴ� �޼ҵ�
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "hr";
		String dbPwd = "hr";
		
		Connection conn = null;
		try {
			Class.forName(driver).newInstance(); // newInstance�� �ɼ�(�ϰų����ų�)
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
}
