package bean;

public class MemberVo {
	String mId; // pk
	String mName; // not null
	String rDate; //입학일 not null
	String grade; //학년 (check)
	
	public MemberVo() {}
	public MemberVo(String id, String name, String d, String g) {
		this.mId = id;
		this.mName = name;
		this.rDate = d;
		this.grade = g;
	}
	
//	public String toString() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String d = sdf.format(rDate);
//		String str = String.format("%15s\t%10s\t%15s\t%4d\n", mId, mName, d, grade);
//		
//		return str;
//	}

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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
