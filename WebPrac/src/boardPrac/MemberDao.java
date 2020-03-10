package boardPrac;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;
	String pattern = "{'mId' : '%s' , 'mName' : '%s' , " + " 'rDate': '%s', 'grade' : '%s'},";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String sql="";
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDao() {
		conn = DBConn.getConn();
	}

	public int Insert(MemberVo vo) {
		
		sql = "insert into member values(?,?,?,?,?,sysdate)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUserId());
			ps.setString(2, vo.getUserPwd());
			ps.setString(3, vo.getUserName());
			ps.setString(4, vo.getUserGender());
			ps.setString(5, vo.getUserEmail());
			
			return ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return -1;
	}
	
	public List<MemberVo> select(String findStr) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		sql = "select * from member where userId like ? or userName like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+findStr+"%");
			ps.setString(2, "%"+findStr+"%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setUserId(rs.getString(1));
				vo.setUserPwd(rs.getString(2));
				vo.setUserName(rs.getString(3));
				vo.setUserGender(rs.getString(4));
				vo.setUserEmail(rs.getString(5));
				vo.setEnroll_date(rs.getString(6));
				
				list.add(vo);
			}
			return list;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
		
	}
}