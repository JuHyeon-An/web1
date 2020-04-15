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
		
		session.close();
	}
	public void chooseTest() {
		session = boardFactory.getFactory().openSession();
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
		
		session.close();
	}
	
	public void whereTest() {
		/*
		 * <where> ... </where>
		 * 만약에 만족하는 데이터가 없다면 불필요한 where절을 생략해줌.
		 * 만약에 where절 안에 시작을 and 나 or일 때 불필요한 and, or일 경우 생략
		 * 
		 */
		
		session = boardFactory.getFactory().openSession();
		int cnt = 0;
		
		BoardVo vo = new BoardVo();
		// 아이디도 없고, 시리얼도 없는 상태
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 1 : "+cnt);
		
		// 시리얼만 있는 상태
		vo.setSerial(200);
		vo.setId(null); // id가 null이 아니라 "" (공백값) 이 들어가서 강제로 null로 대입
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 2 : "+cnt);
		
		// 시리얼은 없고 아이디만 있는 상태
		vo.setSerial(0);
		vo.setId("ajh2042");
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 3 : "+cnt);
		
		// 시리얼도 있고 아이디도 있고 (or 연산자 -> 가장 많은 데이터)
		vo.setSerial(200);
		vo.setId("ajh2042");
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 4 : "+cnt);
		
		session.close();
	}
	
	public void setTest() {
		/*
		 * <set> ... </set>
		 * - update절의 set절을 동적으로 생성
		 * - 불필요한 , (콤마) 등을 제거하는 기능
		 * 
		 */
		int cnt = 0;
		session = boardFactory.getFactory().openSession();
		BoardVo vo = new BoardVo();
		
		/*vo.setSubject("동적 sql로 바꾼 제목...");
		vo.setContent(null);
		vo.setSerial(200);
		cnt = session.update("dynamic.set_test", vo);
		System.out.println("cnt 1 = "+cnt);*/
		
		vo.setSubject("동적 sql로 바꾼 제목...2");
		vo.setContent("동적 sql로 바꾼 내용");
		vo.setSerial(200);
		cnt = session.update("dynamic.set_test", vo);
		System.out.println("cnt 2 = "+cnt);

		session.commit();
		session.close();
	}
	public void trimTest() {
		/*
		 * <where/>, <set/>의 요소보다 보다 다양한 특정 요소들을 추가하거나 제거할 수 있다.
		 * <trim prefix = '앞에 붙일 단어' 
		 * 		 suffix = '뒤에 붙일 단어'
		 * 		 prefixOverrides = '제거할 단어1 | 제거할 단어2 ...' 
		 * 		 suffixOverrides = '뒤에서 제거할 단어1 | 뒤에서 제거할 단어2, ... '
		 * >
		 * </trim>
		 */
		int cnt = 0;
		
		session = boardFactory.getFactory().openSession();
		BoardVo vo = new BoardVo();
		vo.setSubject("h");
		
		cnt = session.selectOne("dynamic.trim_test", vo);
		
		System.out.println("cnt의 값 : "+cnt);
		
		session.close();
	}
	public void foreachTest() {
		/*
		 * <foreach collection='collection' item='변수' index='맵구조의 key값, 첨자값'
		 *  open='반복하기 전에 (foreach 실행하기 전에) 붙일 접두사' 
		 *  close='반복 후 붙일 문자'
		 *  separator = 'item 사이에 끼울 구분자 기호'
		 *  >
		 * 
		 * </foreach>
		 * -- index : collection의 종류가 Map이면 key, collection의 종류가 List이면 index값
		 * -- item : collection의 종류가 Map/List 이면 value
		 */
		
		session = boardFactory.getFactory().openSession();
		String findStr = "hong kim,lee, an , kang";
		String[] value2 = findStr.split(",| ");
		
		String[] value = {"hong", "kim", "lee"};
		
		for (int i = 0; i < value2.length; i++) {
			System.out.println(value2[i]);
		}
		
		//검색할때 아이디가 hong이거나 kim이거나 lee인 게시물을 조회
		List<BoardVo> list = session.selectList("dynamic.foreach_test", value);
		for(BoardVo v : list) {
			System.out.println(v.getId()+"-"+v.getSubject());
		}
		
		session.close();
	}
	
	public void plSqlTest() {
		session = boardFactory.getFactory().openSession();
		BoardVo vo = new BoardVo();
		vo.setSerial(3); // 1번 데이터를 반환받겠다
		session.selectOne("dynamic.pl_sql", vo);
		// 전달된 vo를 타고 다시 vo에 값이 들어옴
		
		System.out.println(vo.getId());
		System.out.println(vo.getSubject());
		System.out.println(vo.getmDate());
		System.out.println(vo.getHit());
		System.out.println(vo.getContent());
		
		session.close();
	}
	
	public static void main(String[] args) {
		DynamicSql dynamic = new DynamicSql();
//		dynamic.ifTest();
//		dynamic.chooseTest();
//		dynamic.whereTest();
//		dynamic.setTest();
//		dynamic.trimTest();
//		dynamic.foreachTest();
		dynamic.plSqlTest();
	}
}
