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
		// ������� ���� (resultSet)
		
		if(findStr != null) {
			BasicDBObject filter = new BasicDBObject();
			filter.put("mId", findStr);
			// filter�� ���� �־��ش� (where mId = findStr)
			// {"mId" : findStr} <- �̷� json ���·� ����ȴ�
			cursor = dbc.find(filter);
			// filter ������ find
		}else {
			cursor = dbc.find();
		}
		
		while(cursor.hasNext()) {
			DBObject obj = cursor.next();
			// ��ȯŸ�� DBObject�� jsonŸ������ ���� �Ѿ�´�
			System.out.println(obj);
		}
		return rValue;
	}
	
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		
		// member collection�� ��� �����͸� ��ȸ
		String json = mm.select(null);
		
		// member collection �� mId='a001'�� �����͸� ��ȸ
		System.out.println("------a001�� �˻��� ������ ��ȸ-----");
		json = mm.select("a001");
	}
	
}
