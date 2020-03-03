package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import user.DBConn;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	private String sql;
	
	public BbsDAO() {
		try {
			conn = DBConn.getConn();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public String getDate() {
		// 현재 날짜를 반환해주는 함수
		// 시간까지 나오게 하려면 자꾸 DateFormat Exception 떠서 sysdate 바로 넣어버림
		sql = "select to_char(sysdate, 'rrrr-mm-dd') from dual";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		sql = "select bbsID from bbs order by bbsID desc";
		// bbsID를 기준으로 내림차순해서 가장 마지막에 올라온 번호 +1
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시글인 경우
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return -1;
		// 오류발생시
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sql = "insert into bbs values(?, ?, ?, sysdate, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, getNext());
			ps.setString(2, bbsTitle);
			ps.setString(3, userID);
			ps.setString(4, bbsContent);
			ps.setInt(5, 1);
			return ps.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return -1;
	}
	
	public Bbs showList() {
		Bbs bbs = new Bbs();
		sql = "select * from bbs";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return bbs;
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		sql = "select * from (select * from bbs where bbsID<? and bbsavailable=1 order by bbsID desc) where rownum <= 10";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, getNext()-(pageNumber-1)*10);
			rs = ps.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		//페이징처리
		sql = "select * from (select * from bbs where bbsID<? and bbsavailable=1 order by bbsID desc) where rownum <= 10";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, getNext()-(pageNumber-1)*10);
			rs = ps.executeQuery();
			while(rs.next()) {
				return true;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
		
	}
	
	public Bbs getBbs(int bbsId) {
		Bbs bbs = new Bbs();
		sql = "select * from bbs where bbsid=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bbsId);
			rs = ps.executeQuery();
			if(rs.next()) {
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	public int update(String bbscontent, String bbstitle, int bbsId) {
		sql = "update bbs set bbscontent = ?, bbstitle = ? where bbsID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bbscontent);
			ps.setString(2, bbstitle);
			ps.setInt(3, bbsId);
			 
			return ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int bbsId) {
		sql = "update bbs set bbsAvailable=0 where bbsID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bbsId);
			 
			return ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return -1;
	}
}
