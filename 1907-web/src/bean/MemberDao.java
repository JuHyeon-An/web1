package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class MemberDao {
	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public String select(String findStr) {
		// db占쏙옙占쏙옙, state占쏙옙占쏙옙占� json타占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
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
			// 占쏙옙占쏙옙占싶곤옙 占싯삼옙占실억옙占쏙옙占쏙옙 占쌓띰옙 占쌨몌옙占쏙옙 占쏙옙占쏙옙占쏙옙
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
			str = vo.getmId()+"회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌩곤옙占실억옙占쏙옙占싹댐옙.";
		}else {
			conn.rollback();
			str = "占쏙옙占쏙옙占쌩삼옙";
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
			str = vo.getmId()+"님이 추가되었습니다.";
		}else {
			conn.rollback();
			str = "DB오류발생";
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
					// 占쏙옙占싱듸옙 占쏙옙橘占싫� 占쏙옙치
				}
				return 0;
				// 占쏙옙占싱듸옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙치占쏙옙占쏙옙 占쏙옙占쏙옙
			}
			return -1;
			// 占쏙옙占싱듸옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return -2;
		//DB 占쏙옙占쏙옙
	}
	
	public List<MemberVo2> listAll(String mId) {
		String sql = "select * from member where mId like ?";
		List<MemberVo2> list = new ArrayList<MemberVo2>();
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+mId+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MemberVo2 vo = new MemberVo2(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
public static void main(String[] args) {
//	MemberDao dao = new MemberDao();
//	System.out.println(dao.select("a"));
}
}
