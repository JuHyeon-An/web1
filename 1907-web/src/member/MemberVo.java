package member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MemberVo {
	String mId; // pk
	String pwd;
	String mName; // not null
	String rDate; // ������ not null
	int grade; // �г� (check)
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<MemberPhoto> photos;
	

	public MemberVo() {
	}

	public MemberVo(String id, String pwd, String name, String d, int g) {
		this.mId = id;
		this.mName = name;
		this.rDate = d;
		this.grade = g;
		this.pwd = pwd;
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
	
	public List<MemberPhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(List<MemberPhoto> photos) {
		this.photos = photos;
	}
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
