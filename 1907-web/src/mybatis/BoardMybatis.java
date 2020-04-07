package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardMybatis {
	SqlSession sqlSession; // Connection 의 역할

	public BoardMybatis() {
		sqlSession = boardFactory.getFactory().openSession();
	}
	
	public List<BoardVo> select(Page p){
		List<BoardVo> list = null;
		
		try {
			list = sqlSession.selectList("board.select", p);
			// namespace가 board이고 id값이 select인것
			
			for(BoardVo vo : list) {
				System.out.println("------------------------");
				System.out.println(vo.getId());
				System.out.println(vo.getSubject());
				System.out.println(vo.getmDate());
				System.out.println("------------------------");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close(); // 반드시! close
			return list;
		}
	}
	
	public static void main(String[] args) {
		BoardMybatis bm = new BoardMybatis();
		Page p = new Page();
		p.setFindStr("a");
		bm.select(p);
	}
	
}
