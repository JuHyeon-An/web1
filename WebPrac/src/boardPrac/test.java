package boardPrac;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class test {

	
	public static void main(String[] args) {
		
		MemberDao dao = new MemberDao();
		List<MemberVo> list = new ArrayList<MemberVo>();
		list = dao.select("ajh2042");
		String json = "";
		Gson gson = new Gson();
			json = gson.toJson(list);
		
		
		System.out.println(json);
	}
}
