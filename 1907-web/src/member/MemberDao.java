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
	String upload = "c:/Users/Ellen/git/web1/1907-web/WebContent/upload/";
//	String upload = "c:/Users/JHTA/git/web1/1907-web/WebContent/upload/";
	String sql="";
	
	public String insert(MemberVo vo) {
		// 폼태그&파일 담겨진 vo가 서블릿으로부터 전달됨
		
	int r = 0;
	String str = "";
	sql = "insert into member2(mId, mName, rDate, grade, pwd) values(?, ?, ?, ?, ?)";
	MemberPhoto p = null;
	// 사진 제외하고 멤버 정보  insert하는 과정
	
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
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getmId());
				ps.setString(2, vo.getrDate());
				ps.setString(3, p.getOriFile());
				ps.setString(4, p.getSysFile());
				r = ps.executeUpdate();
				if(r>0) {
					conn.commit();
					str = vo.getmId()+"님이 정상적으로 등록되었습니다.";
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
		// 이미 폼태그의 값이 모두 들어있는 MemberVo를 서블릿으로부터 받는다
		
		/*
		 * 1. 사진이 없을때 사진을 추가
		 * 2. 사진이 없을때 내용만 업데이트
		 * 3. 사진이 있을때 업데이트 (변경)
		 * 		(기존파일 찾아서 삭제)
		 */
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberPhoto mp = null;
		int r = 0;
		String msg = "";
		conn = DBConn.getConn();
		
		String deleteFile = null; // 이미지를 수정한 경우 이전 파일 (삭제될대상)
		int serial = 0;
		List<MemberPhoto> list = vo.getPhotos();//사진정보가 없으면 값이 없을 것이다.
		
		if(list.size()>0) { //사진정보가 들어왔다면 (여러개라면 for문)
			mp = list.get(0);
		}
		
		try {
			conn.setAutoCommit(false);
			
			if(mp!=null) {
				// 사진정보가 있다면 (신규파일이 들어온 경우)
				sql = "select serial, sysFile from member_photo where mId=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getmId());
				
				rs = ps.executeQuery();
				
				if(rs.next()) {
					// mId로 조회했을 때 데이터가 있으면
					deleteFile = rs.getString("sysFile");
					serial = rs.getInt("serial");
				}
			}
			
			// 기본 정보 수정
			sql = "update member2 set mName=?, rDate=?, grade=?, pwd=? where mId=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, vo.getrDate());
			ps.setInt(3, vo.getGrade());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getmId());
			
			r = ps.executeUpdate();
			
				
			if(r<1) {
				throw new Exception("기본 정보 수정 중 오류 발생");
			}
			
			if(mp!=null) {
				// 첨부파일이 있는 경우
				if(deleteFile == null) {
					// 지워야할대상이 없는 경우 => insert 해줘야하는 경우
					// 처음 등록시 이미지를 등록하지 않고 첨부한 경우
						sql = "insert into member_photo(serial, mId, rDate, oriFile, sysFile) "
								+ "values(seq_member_photo.nextval, ?, ?, ?, ?)";
					
					ps = conn.prepareStatement(sql);
					ps.setString(1, vo.getmId());
					ps.setString(2, vo.getrDate());
					ps.setString(3, mp.getOriFile());
					ps.setString(4, mp.getSysFile());
					
					r = ps.executeUpdate();
					
					if(r<1) {
						throw new Exception("사진정보 추가 중 오류");
					}
				}else {
					sql = "update member_photo set rDate=?, oriFile=?, sysFile=? "
							+ "where serial=?";
					ps = conn.prepareStatement(sql);
					
					ps.setString(1, vo.rDate);
					ps.setString(2, mp.oriFile);
					ps.setString(3, mp.sysFile);
					ps.setInt(4, serial);
					
					r = ps.executeUpdate();
					if(r<1){
						throw new Exception("사진정보 업데이트 중 오류");
					}				
				}
			}
			msg = vo.getmId() + " 님의 정보가 정상적으로 수정 되었습니다.";
			conn.commit();
			ps.close();
		}catch(Exception ex) {
			conn.rollback();
			msg = ex.getMessage();
		}finally {
			if(deleteFile !=null) {
				delFile(deleteFile);
			}
			return msg;
		}
	}
	
	public void delFile(String fileName) {
		// 파일명을 넘겨받아서 파일 삭제하는 메소드
		File file = new File(upload + fileName);
		if(file.exists()) file.delete();
	}
	
	public MemberVo view(String mId) {
		MemberVo vo = new MemberVo();
		List<MemberPhoto> list = new ArrayList<MemberPhoto>();
		String sql = "select mName, to_char(m.rDate, 'rrrr-mm-dd') rDate, grade, orifile, sysfile, pwd "+ 
				"from member2 m left outer join member_photo p " + 
				"on m.mId = p.mId " + 
				"where m.mId = ?";
		
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
				vo.setPwd(rs.getString(6));
				list.add(new MemberPhoto(rs.getString(4), rs.getString(5)));
				vo.setPhotos(list);
				conn.commit();
				ps.close();
			}
		}catch(Exception ex) {
			conn.rollback();
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	
	public MemberVo viewT(String mId) { //선생님코드
		MemberVo vo = new MemberVo();
		List<MemberPhoto> list = new ArrayList<MemberPhoto>();
		String sql = "select mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade, pwd "
					+"from member2 where mId = ?";
		
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
				vo.setPwd(rs.getString(4));
			}
			
			sql = "select serial, sysFile, oriFile from member_photo "
					+"where mId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberPhoto mp = new MemberPhoto();
				mp.setSerial(rs.getInt("serial"));
				mp.setOriFile(rs.getString("oriFile"));
				mp.setSysFile(rs.getString("sysFile"));
				
				list.add(mp);
			}
			vo.setPhotos(list);
			conn.commit();
		}catch(Exception ex) {
			conn.rollback();
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public String delete(String mId, String pwd, String flag) {

		System.out.println("Dao로 넘어온 flag값 : "+flag);
		PreparedStatement ps = null;
		ResultSet rs = null;
		int r = 0;
		String msg = "";
		conn = DBConn.getConn();
		int serial = 0;
		
		String deleteFile = null; // 삭제될대상
		
		try {
			conn.setAutoCommit(false);
			
				sql = "select m.mId, m.mName, m.rDate, m.grade, p.serial, p.sysfile, p.orifile "
						+ "from member2 m left outer join member_photo p "
						+ "on m.mId = p.mId where m.mId = ? and m.pwd = ?";
			
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				ps.setString(2, pwd);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					serial = rs.getInt("serial");
					deleteFile = rs.getString("sysFile");
					// 폴더에서 삭제될 아이
				}
				
				// 사진삭제
				sql = "delete from member_photo where serial=?";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, serial);
				
				r = ps.executeUpdate();
				
				if(r<1) {
					throw new Exception("사진 삭제 중 오류 발생");
				}
				
				
				if(flag.equals("del")) {
					// 멤버 삭제
					sql = "delete from member2 where mId=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, mId);
					
					r = ps.executeUpdate();
					
					if(r<1) {
						throw new Exception("기본 정보 삭제 중 오류 발생");
					}
				}
				
			
				/*
						sql = "insert into member_photo(serial, mId, rDate, oriFile, sysFile) "
								+ "values(seq_member_photo.nextval, ?, ?, ?, ?)";
					
					ps = conn.prepareStatement(sql);
					ps.setString(1, vo.getmId());
					ps.setString(2, vo.getrDate());
					ps.setString(3, mp.getOriFile());
					ps.setString(4, mp.getSysFile());
					
					r = ps.executeUpdate();
					
					if(r<1) {
						throw new Exception("사진정보 추가 중 오류");
					}
				}else {
					sql = "update member_photo set rDate=?, oriFile=?, sysFile=? "
							+ "where serial=?";
					ps = conn.prepareStatement(sql);
					
					ps.setString(1, vo.rDate);
					ps.setString(2, mp.oriFile);
					ps.setString(3, mp.sysFile);
					ps.setInt(4, serial);
					
					r = ps.executeUpdate();
					if(r<1){
						throw new Exception("사진정보 업데이트 중 오류");
					}				
				}
			}
			*/
			msg = mId + " 님이 정상적으로 삭제되었습니다.";
			conn.commit();
			ps.close();
		}catch(Exception ex) {
			conn.rollback();
			msg = ex.getMessage();
		}finally {
			if(deleteFile !=null) {
				delFile(deleteFile);
			}
			return msg;
		}
	}
	
	public List<MemberVo> select(Page p){
		
		List<MemberVo> list = new ArrayList<MemberVo>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = DBConn.getConn();
		int totList = 0;
		
		try {
			// 전체 건수
			sql = "select count(mId) cnt from member2 where mId like ? or mName like ?";
					
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+p.getFindStr()+"%");
			ps.setString(2, "%"+p.getFindStr()+"%");
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				totList = rs.getInt(1);
			}
			p.setTotListSize(totList);
			p.pageCompute();
			
			System.out.println("totListSize : "+p.getTotListSize());
			System.out.println("startPage : "+p.getStartPage());
			System.out.println("endPage : "+p.getEndPage());
			System.out.println("startNo : "+p.getStartNo());
			System.out.println("endNo : "+p.getEndNo());
			
			sql = "select * from "
					+ "(select rownum rn, A.* from "
					+ "(select mId, pwd, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade from member2 "
					+ "where mId like ? or mName like ? "
					+ "order by mName)A )"
					+ " where rn between ? and ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+p.getFindStr()+"%");
			ps.setString(2, "%"+p.getFindStr()+"%");
			ps.setInt(3, p.getStartNo());
			ps.setInt(4, p.getEndNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setmId(rs.getString("mId"));
				vo.setPwd(rs.getString("pwd"));
				vo.setmName(rs.getString("mName"));
				vo.setrDate(rs.getString("rDate"));
				vo.setGrade(rs.getInt("grade"));
				
				list.add(vo);
			}
			
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
		
	}
	
	public String insertVo2(MemberVo vo) {
	int r = 0;
	String str = "";
	try {
		conn = DBConn.getConn();
		sql = "insert into member values (?, ?, ?, ?)";
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
		sql = "select pwd from member2 where mId=?";
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
