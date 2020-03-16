package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;


public class MemberDao {
	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public String select(String findStr) {
		// db연결, state만들고 json타입으로 결과 리턴
		conn = DBConn.getConn();
		String data="abc";
		try {
		StringBuilder sb = new StringBuilder();
		String sql =
		"select mid, mname, to_char(rdate, 'rrrr-mm-dd') rdate, grade from member where mid like ? or mname like ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, "%"+findStr+"%");
		ps.setString(2, "%"+findStr+"%");
		ResultSet rs = ps.executeQuery();
		
		
		sb.append("[");
		
		while(rs.next()){
			String str = 
				String.format("{'mid':'%s', 'mname':'%s', 'rdate':'%s', 'grade':'%s'},",
						rs.getString("mid"),
						rs.getString("mname"),
						rs.getString("rdate"),
						rs.getString("grade")
					);
				sb.append(str);
		};
		data = sb.toString();
		data = data.replaceAll("\'", "\"");
		if(data.length()>1){
			// 데이터가 검색되었으면 그때 콤마를 지워라
			data = data.substring(0, data.length()-1);
		};
		
		data += "]";
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return data;
	}
	
	public String insert(MemberVo vo) {
	int r = 0;
	String str = "";
	try {
		conn = DBConn.getConn();
		String sql = "insert into member values (?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, vo.getmId());
		ps.setString(2, vo.getmName());
		ps.setString(3, sdf.format(vo.getrDate()));
		ps.setInt(4, vo.getGrade());
		conn.setAutoCommit(false);
		
		r = ps.executeUpdate();
		
		if(r>0) {
			conn.commit();
			str = vo.getmId()+"회원님이 성공적으로 추가되었습니다.";
		}else {
			conn.rollback();
			str = "오류발생";
		}
		
		ps.close();
		
		
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		return str;
	}
	}
	
	public String insertVo2(MemberVo2 vo) {
	int r = 0;
	String str = "";
	try {
		conn = DBConn.getConn();
		String sql = "insert into member values (?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, vo.getmId());
		ps.setString(2, vo.getmName());
		ps.setString(3, vo.getrDate());
		ps.setInt(4, vo.getGrade());
		conn.setAutoCommit(false);
		
		r = ps.executeUpdate();
		
		if(r>0) {
			conn.commit();
			str = vo.getmId()+"회원님이 성공적으로 추가되었습니다.";
		}else {
			conn.rollback();
			str = "오류발생";
		}
		
		ps.close();
		
		
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		return str;
	}
	}
	
	public int login(MemberVo3 vo) {
		String sql = "select pwd from member2 where mId=?";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmId());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(vo.getPwd())) {
					return 1;
					// 아이디 비밀번호 일치
				}
				return 0;
				// 아이디는 존재하지만 일치하지 않음
			}
			return -1;
			// 아이디 존재하지 않음
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return -2;
		//DB 오류
	}
	
public static void main(String[] args) {
//	MemberDao dao = new MemberDao();
//	System.out.println(dao.select("a"));
}
}
