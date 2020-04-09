package mybatis;

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
			System.out.println(totList);
			p.setTotListSize(totList);
			p.pageCompute();
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
}
