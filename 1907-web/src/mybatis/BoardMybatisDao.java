package mybatis;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardMybatisDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public BoardMybatisDao() {
		sqlSession = boardFactory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	
	public List<BoardVo> select(Page p) {
		List<BoardVo> list = null;
		
		try {
			int totList = sqlSession.selectOne("board.count", p);
			p.setTotListSize(totList);
			p.pageCompute();
			System.out.println(totList);
			System.out.println("마지막 페이지 : "+p.endPage);
			System.out.println("endNo : " +p.endNo);
			System.out.println("totPage : "+p.totPage);
			// 나머지 변수의 값이 설정됨
			list = sqlSession.selectList("board.select", p);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			// 오픈한 sqlSession을 반드시 close
			sqlSession.close();
			return list;
		}
	}
	
	public String insert(BoardVo vo, List<AttVo> attList) {
		String msg = "정상적으로 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("board.insert", vo);
			if(cnt<1) {
				throw new Exception("본문 저장 중 오류발생");
			}
			
			for(AttVo attVo : attList) {
				cnt = sqlSession.insert("board.att_insert", attVo);
				if(cnt<1) {
					throw new Exception("첨부 파일 저장 중 오류발생");
				}
			}
				
			sqlSession.commit();
		}catch(Exception ex){
			msg = ex.getMessage();
			ex.printStackTrace();
			
			sqlSession.rollback();
			delFile(attList);
		}finally {
			sqlSession.close();
			return msg;
		}
	}
	
	//insert, modify에서 sql 오류가 발생할 때, 삭제할 때 공통으로 사용하는 메소드
	public void delFile(List<AttVo> delList) {
		for(AttVo attVo : delList) {
			File f = new File(FileUpload.upload + attVo.getSysFile());
			if(f.exists()) f.delete();
		}
	}
	
	public BoardVo view(int serial) {
		BoardVo vo = null;
		try {
			vo = sqlSession.selectOne("board.view", serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			// 사진첨부에서 또 session을 불러와야하므로 close 시키면 안됨
			return vo;
		}
	}
	
	public List<AttVo> getAttList(int pserial){
		List<AttVo> list = null;
		try {
			list = sqlSession.selectList("board.att_list", pserial);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return list;
		}
	}
	
	public String modify(BoardVo vo, List<AttVo> attList, List<AttVo> delList) {
		String msg = "정상적으로 수정되었습니다.";
		try {
			// 본문 글 수정
			int cnt = sqlSession.update("board.update", vo);
			if(cnt<1) {
				throw new Exception("본문 수정 중 오류가 발생했습니다.");
			}
			
			// boardAtt에 첨부 파일 정보를 추가
			for(AttVo attVo : attList) {
				attVo.setSerial(vo.getSerial());
				cnt = sqlSession.insert("board.att_insert2", attVo);
				if(cnt<1) throw new Exception("첨부 데이터 정보 수정 중 오류 발생");
			}
			
			
			// boardAtt에 삭제파일 정보를 제거
			for(AttVo attVo : delList) {
				cnt = sqlSession.delete("board.att_delete", attVo);
				if(cnt<1) throw new Exception("파일 삭제 중 오류 발생");
			}
			
			// 파일을 삭제
			delFile(delList);
			
			sqlSession.commit();
		}catch(Exception ex) {
			delFile(attList);
			ex.printStackTrace();
			msg = ex.getMessage();
			sqlSession.rollback();
		}finally {
			sqlSession.close();
			return msg;
		}
	}
}
