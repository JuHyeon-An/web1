package bean_T;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class MemberDao {
	Connection conn;
	String pattern = "{'mId' : '%s' , 'mName' : '%s' , " + " 'rDate': '%s', 'grade' : '%s'},";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public MemberDao() {
		conn = DBConn.getConn();
	}

	public String select(String findStr) {
		String json = null;
		MemberVo vo = new MemberVo();
		String sql = " select mid, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade" + " from member "
				+ " where mId = ? or mName like ? " + " order by mName ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, "%" + findStr + "%");
			StringBuilder sb = new StringBuilder();
			sb.append("[");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String mId = rs.getString("mId");
				String mName = rs.getString("mName");
				String rDate = rs.getString("rDate");
				String grade = rs.getInt("grade") + "";
				String temp = String.format(pattern, mId, mName, rDate, grade);
				sb.append(temp);
			}
			json = sb.toString();
			if (json.length() > 1) {
				json = json.substring(0, json.length() - 1);
				json = json.replaceAll("\'", "\"");
			}
			json += "]";
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return json;
		}
	}

	public String insert(MemberVo vo) {
		String msg = "회원이 등록되었구먼~";
		try {
			String sql = "insert into member values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmId());
			ps.setString(2, vo.getmName());
			ps.setString(3, sdf.format(vo.getrDate()));
			ps.setInt(4, vo.getGrade());
			int r = ps.executeUpdate();
			if (r < 1) {
				throw new Exception();
			}
		} catch (Exception ex) {
			msg = ex.toString();
		} finally {
			return msg;
		}
	}

	public MemberVo view(String mId) {
		System.out.println("Mid=" + mId);
		MemberVo vo = new MemberVo();
		try {
			String sql = "select * from member where mId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				vo.setmId(rs.getString("mId"));
				vo.setmName(rs.getString("mName"));
				vo.setrDate(rs.getDate("rDate"));
				vo.setGrade(rs.getInt("grade"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

	public String update(MemberVo vo) {
		String msg = "자료가 수정되었습니다.";
		String sql = "update member set mName=?, rDate=?, grade=? where mId=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, sdf.format(vo.getrDate()));
			ps.setInt(3, vo.getGrade());
			ps.setString(4, vo.getmId());
			int r = ps.executeUpdate();
			if (r < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			msg = e.toString();
		} finally {
			return msg;
		}
	}

	public String delete(String mid) {
		String msg = "자료가 삭제되었습니다.";
		String sql = "delete from member where mId=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			int cnt = ps.executeUpdate();
			if (cnt < 1) {
				throw new Exception("자료 삭제중 예외 발생...");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
		} finally {
			return msg;
		}
	}
}