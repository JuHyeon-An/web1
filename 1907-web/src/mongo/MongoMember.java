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
		// basicDBObject�� �Ű������� ������,
		// basic�� DBObject�� ��ӹ޾ұ� ������ DBObject�� �޾Ƶ� ������
		
		//db.member.insert([{}])
		System.out.println(obj.get("mId"));
		String msg = "";
		try {
			dbc.insert(obj);
			msg = "ȸ�� ������ ���������� ��ϵǾ����ϴ�.";
		}catch(Exception ex) {
			msg = "���� �� ���� �߻� -> "+ex.toString();
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
			return "ȸ�������� ���������� �����Ǿ����ϴ�.";
		}catch(Exception ex) {
			return ex.toString();
		}
	}
	
	public String delete(String mId) {
		BasicDBObject db = new BasicDBObject();
		db.put("mId", mId);
		
		try {
			dbc.remove(db);
			return "ȸ�������� ���������� �����Ǿ����ϴ�.";
		}catch(Exception ex) {
			return "�������� �� ���� �߻� ==> "+ex.toString();
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
		// select.jsp ���� ȣ��
		DBCursor cursor = null;
		// ������� ���� (resultSet)
		
		if(findStr != null) {
			BasicDBObject filter = new BasicDBObject();
			BasicDBObject filter2 = new BasicDBObject();
			BasicDBList or = new BasicDBList();
			// BasicDBList : ��Ȯ�ϰԴ� ����Ʈ, �迭������ �������
			
			filter.put("mName", Pattern.compile(findStr));
			filter2.put("mId", Pattern.compile(findStr)); // ���Խ����� �ٲ�
			// filter�� ���� �־��ش� (where mId = findStr)
			// {"mId" : findStr} <- �̷� json ���·� ����ȴ�
			
			or.add(filter);
			or.add(filter2);
			// �� ���͸� �迭�� �����
			
			// or = > ���ȣ [ ] (�ȿ� filter1, filter2 ����)
			
			BasicDBObject query = new BasicDBObject();
			query.put("$or", or); // {$or : [{{filter1},{filter2}]}
			cursor = dbc.find(query);
			// filter ������ find
			
			
			//db.member.find({$or : [{'mName' : /a/},{'grade' : 3}]})
		}else {
			cursor = dbc.find();
		}
		
		/*
		while(cursor.hasNext()) {
			DBObject obj = cursor.next();
			// ��ȯŸ�� DBObject�� jsonŸ������ ���� �Ѿ�´�
			System.out.println(obj);
		}
		=> String Ÿ������ ��ȯ�Ҷ� �ʿ��� �ڵ�
		�ƴϸ� �׳� cursor.toArray�� ��ȯ
		*/
		
		return cursor.toArray();
	}
	
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		
		// member collection�� ��� �����͸� ��ȸ
		List<DBObject> list = mm.select(null);
		
		// member collection �� mId='a001'�� �����͸� ��ȸ
		System.out.println("------a001�� �˻��� ������ ��ȸ-----");
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
