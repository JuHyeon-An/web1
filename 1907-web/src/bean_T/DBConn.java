package bean_T;

import java.sql.Connection;
import java.sql.DriverManager;

//공통모듈 만들기
public class DBConn {

	public static Connection getConn() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "park";
		String dbPwd = "1234";
		
		Connection conn = null;
		try {
			Class.forName(driver).newInstance(); // newInstance는 옵션(하거나말거나)
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	
public static Connection getConnHr() { //hr에 접속하는 메소드
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "hr";
		String dbPwd = "hr";
		
		Connection conn = null;
		try {
			Class.forName(driver).newInstance(); // newInstance는 옵션(하거나말거나)
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
}
