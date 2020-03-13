package bean;

import java.text.SimpleDateFormat;

public class MemberVo2 {
	String mId; // pk
	String mName; // not null
	String rDate; // 입학일 not null
	int grade; // 학년 (check)
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
	public MemberVo2() {
	}

	public MemberVo2(String id, String name, String d, int g) {
		this.mId = id;
		this.mName = name;
		this.rDate = d;
		this.grade = g;
	}

	String pattern = "{'mId' : '%s' , 'mName' : '%s' , 'rDate': '%s', 'grade' : '%s'}";

	public String toString() {
		String d = sdf.format(rDate);
		String str = String.format("%10s\t%15s\t%15s\t%4d\n", mId, mName, d, grade);

		return str;
	}
	
	public String toJSON() {
		String d = sdf.format(rDate);
		String json = String.format(pattern, mId, mName, d, grade);
		json = json.replaceAll("\'", "\"");
		return json;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
}
