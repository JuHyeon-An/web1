package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DynamicSql {

	SqlSession session;
	public DynamicSql() {
	}
	
	public void ifTest() {
		session = boardFactory.getFactory().openSession();
		String findStr = "3";
		List<BoardVo> list = null;
		
		System.out.println("------------findStr이 특정문자일때-------------");
		list = session.selectList("dynamic.if_test", findStr);
		for(BoardVo vo : list) {
			System.out.println(vo.getId());
			System.out.println(vo.getContent());
			System.out.println(vo.getSubject());
			System.out.println("-------------");
		}
		
		findStr = null;
		list = session.selectList("dynamic.if_test", findStr);
		
		System.out.println("------------findStr이 null일때-------------");
		for(BoardVo vo : list) {
			System.out.println(vo.getId());
			System.out.println(vo.getContent());
			System.out.println(vo.getSubject());
			System.out.println("-----------------------------");
		}
		
	}
	public void chooseTest() {
		String findStr = "";
		int r = 0;
		findStr = "s";
		r = session.selectOne("dynamic.choose_test", findStr);
		System.out.println("findStr이 s일때  : "+r);
		
		findStr = "c";
		r = session.selectOne("dynamic.choose_test", findStr);
		System.out.println("findStr이 c일때  : "+r);
		

		findStr = "a";
		r = session.selectOne("dynamic.choose_test", findStr);
		System.out.println("findStr이 a일때  : "+r);
	}
	public void whereTest() {	}
	public void setTest() {}
	public void trimTest() {}
	public void foreachTest() {}
	
	public static void main(String[] args) {
		DynamicSql dynamic = new DynamicSql();
//		dynamic.ifTest();
		dynamic.chooseTest();
	}
}
