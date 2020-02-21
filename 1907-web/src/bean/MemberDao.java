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
	
	public int insert(MemberVo vo) {
	int r = 0;
	try {
		conn = DBConn.getConn();
		String sql = "insert into member values (?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, vo.getmId());
		ps.setString(2, vo.getmName());
		ps.setString(3, vo.getrDate());
		ps.setString(4, vo.getGrade());
		conn.setAutoCommit(false);
		
		r = ps.executeUpdate();
		
		if(r>0) {
			conn.commit();
		}else {
			conn.rollback();
		}
		
		ps.close();
		
		
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		return r;
	}
	}
public static void main(String[] args) {
//	MemberDao dao = new MemberDao();
//	System.out.println(dao.select("a"));
}
}
