package mongo;

import java.util.List;
import java.util.regex.Pattern;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class MongoMember {
	DB db;
	DBCollection dbc;
	public MongoMember() {
		MongoClient client = new MongoDBConn().getClient();
		db = client.getDB("m1907");
		dbc = db.getCollection("member");
	}
	
	public String insert(DBObject obj) {
		// basicDBObject가 매개변수로 들어갔지만,
		// basic은 DBObject를 상속받았기 때문에 DBObject로 받아도 무관함
		
		//db.member.insert([{}])
		System.out.println(obj.get("mId"));
		String msg = "";
		try {
			dbc.insert(obj);
			msg = "회원 정보가 정상적으로 등록되었습니다.";
		}catch(Exception ex) {
			msg = "저장 중 오류 발생 -> "+ex.toString();
		}finally {
			return msg;
		}
	}
	
	public String modify(DBObject data) {
		BasicDBObject query = new BasicDBObject();
		query.put("mId", data.get("mId"));
		
		BasicDBObject update = new BasicDBObject();
		update.put("mName", data.get("mName"));
		update.put("rDate", data.get("rDate"));
		update.put("grade", data.get("grade"));
		
		BasicDBObject result = new BasicDBObject();
		result.put("$set", update);
		
		try {
			dbc.update(query, result);
			return "회원정보가 정상적으로 수정되었습니다.";
		}catch(Exception ex) {
			return ex.toString();
		}
	}
	
	public String delete(String mId) {
		BasicDBObject db = new BasicDBObject();
		db.put("mId", mId);
		
		try {
			dbc.remove(db);
			return "회원정보가 정상적으로 삭제되었습니다.";
		}catch(Exception ex) {
			return "정보삭제 중 오류 발생 ==> "+ex.toString();
		}
	}
	
	public DBObject view(String mId) {
		DBObject o = null;
		BasicDBObject db = new BasicDBObject();
		db.put("mId", mId);
		DBCursor cursor = dbc.find(db);
		
		if(cursor.hasNext()) {
			o = cursor.next();
		}
		
		return o;
	}
	
	public List<DBObject> select(String findStr) {
		// select.jsp 에서 호출
		DBCursor cursor = null;
		// 쿼리결과 저장 (resultSet)
		
		if(findStr != null) {
			BasicDBObject filter = new BasicDBObject();
			BasicDBObject filter2 = new BasicDBObject();
			BasicDBList or = new BasicDBList();
			// BasicDBList : 정확하게는 리스트, 배열구조를 만들어줌
			
			filter.put("mName", Pattern.compile(findStr));
			filter2.put("mId", Pattern.compile(findStr)); // 정규식으로 바꿈
			// filter에 조건 넣어준다 (where mId = findStr)
			// {"mId" : findStr} <- 이런 json 형태로 저장된다
			
			or.add(filter);
			or.add(filter2);
			// 두 필터를 배열로 만들기
			
			// or = > 대괄호 [ ] (안에 filter1, filter2 있음)
			
			BasicDBObject query = new BasicDBObject();
			query.put("$or", or); // {$or : [{{filter1},{filter2}]}
			cursor = dbc.find(query);
			// filter 씌워서 find
			
			
			//db.member.find({$or : [{'mName' : /a/},{'grade' : 3}]})
		}else {
			cursor = dbc.find();
		}
		
		/*
		while(cursor.hasNext()) {
			DBObject obj = cursor.next();
			// 반환타입 DBObject에 json타입으로 값이 넘어온다
			System.out.println(obj);
		}
		=> String 타입으로 반환할때 필요한 코드
		아니면 그냥 cursor.toArray로 반환
		*/
		
		return cursor.toArray();
	}
	
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		
		// member collection의 모든 데이터를 조회
		List<DBObject> list = mm.select(null);
		
		// member collection 중 mId='a001'인 데이터를 조회
		System.out.println("------a001로 검색된 데이터 조회-----");
		//json = mm.select("a001");
		
		for(DBObject o : list) {
			//System.out.println(o);
			System.out.println(o.get("mId"));
			System.out.println(o.get("mName"));
			System.out.println(o.get("rDate"));
			System.out.println(o.get("grade"));
		}
		
	}
	
}
