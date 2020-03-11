package mongo;

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
	
	public void insert(String json) {
		
	}
	
	public void modify(String json) {
		
	}
	
	public void delete(String json) {
		
	}
	
	public String view(String json) {
		String rValue = "";
		return rValue;
	}
	
	public String select(String findStr) {
		String rValue = "";
		DBCursor cursor = null;
		// 쿼리결과 저장 (resultSet)
		
		if(findStr != null) {
			BasicDBObject filter = new BasicDBObject();
			filter.put("mId", findStr);
			// filter에 조건 넣어준다 (where mId = findStr)
			// {"mId" : findStr} <- 이런 json 형태로 저장된다
			cursor = dbc.find(filter);
			// filter 씌워서 find
		}else {
			cursor = dbc.find();
		}
		
		while(cursor.hasNext()) {
			DBObject obj = cursor.next();
			// 반환타입 DBObject에 json타입으로 값이 넘어온다
			System.out.println(obj);
		}
		return rValue;
	}
	
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		
		// member collection의 모든 데이터를 조회
		String json = mm.select(null);
		
		// member collection 중 mId='a001'인 데이터를 조회
		System.out.println("------a001로 검색된 데이터 조회-----");
		json = mm.select("a001");
	}
	
}
