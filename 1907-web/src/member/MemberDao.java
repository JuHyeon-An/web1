package member;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class MemberDao {
	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String upload = "c:/Users/JHTA/git/web1/1907-web/WebContent/upload/";
	
	public String insert(MemberVo vo) {
	int r = 0;
	String str = "";
	String sql = "insert into member2(mId, mName, rDate, grade, pwd) values(?, ?, ?, ?, ?)";
	MemberPhoto p = null;
	
	List<MemberPhoto> list = vo.getPhotos();
	if( list.size() > 0) {
		p = list.get(0);
	}
	
	try {
		conn = DBConn.getConn();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, vo.getmId());
		ps.setString(2, vo.getmName());
		ps.setString(3, vo.getrDate());
		ps.setInt(4, vo.getGrade());
		ps.setString(5, vo.getPwd());
		conn.setAutoCommit(false);
		
		r = ps.executeUpdate();
		
				if(r>0) {
				
				conn.commit();
				if(p.oriFile != null) {
					// 파일명이 존재하면
					sql = "insert into member_photo(serial, mId, rDate, oriFile, sysFile) "
							+"values(seq_member_photo.nextval, ?, ?, ?, ?)";
				}
				str = vo.getmId()+"님이 정상적으로 등록되었습니다.";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getmId());
				ps.setString(2, vo.getrDate());
				ps.setString(3, p.getOriFile());
				ps.setString(4, p.getSysFile());
				r = ps.executeUpdate();
				if(r>0) {
					conn.commit();
				}else {
					conn.rollback();
					throw new Exception("사진 추가 중 오류발생");
				}
			}else {
				throw new Exception("오류발생");
			}
		
		ps.close();
		
	}catch(Exception ex) {
		str = ex.getMessage();
		File delFile = new File(upload + p.getSysFile());
		if(delFile.exists()) delFile.delete();
		conn.rollback();
			// 경로에 업로드된 파일명
	}finally {
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return str;
	}
	}
	
	public String modify(MemberVo vo) {
		int r = 0;
		String sql = "update member2 set mName=?, rDate=?, grade=?, pwd=? where mId=?";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, sdf.format(vo.getrDate()));
			ps.setInt(3, vo.getGrade());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getmId());
			
			conn.setAutoCommit(false);
			
			r = ps.executeUpdate();
			
			if(r>0) {
				return vo.getmId()+" 님의 정보가 정상적으로 변경되었습니다.";
			}else {
				return "업데이트 중 오류발생";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return "DB오류발생";
	}
	
	public MemberVo view(String mId) {
		MemberVo vo = new MemberVo();
		String sql = "select mName, rDate, grade from member2 where mId=?";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo.setmId(mId);
				vo.setmName(rs.getString(1));
				vo.setrDate(rs.getString(2));
				vo.setGrade(rs.getInt(3));
				
				return vo;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	public List<MemberVo> select(String findStr){
		List<MemberVo> list = new ArrayList<MemberVo>();
		
		String sql = "select mId, mName, to_char(rDate, 'rrrr-mm-dd'), grade from member2 where mId like ? or mName like ?";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+findStr+"%");
			ps.setString(2, "%"+findStr+"%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setmId(rs.getString(1));
				vo.setmName(rs.getString(2));
				vo.setrDate(rs.getString(3));
				vo.setGrade(rs.getInt(4));
				
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public String insertVo2(MemberVo vo) {
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
	
	public int login(MemberVo vo) {
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
	
public static void main(String[] args) {
//	MemberDao dao = new MemberDao();
//	System.out.println(dao.select("a"));
}
}
