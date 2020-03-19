package member;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	// 파일 업로드하는 고유한 기능 갖도록
	
	String upload = "c:/Users/JHTA/git/web1/1907-web/WebContent/upload/";
	// 업로드되는 경로명
	String tempDir = "c:/temp/";
	// 파일이 전송되는 중간 중간 저장되는 장소
	
	int maxSize = 1024*1024*50; // 파일이 업로드 되는 최대 사이즈 (최대크기 50메가)
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public FileUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		// 업로드되는 폼이 정확하지 않으면 false 리턴
		// 결과값이 true일때 uploading이라는 메소드를 호출
		return flag;
	}
	
	public MemberVo uploading() {
		MemberVo vo = new MemberVo();
		List<MemberPhoto> photoList = new ArrayList<MemberPhoto>();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 아파치에서 파일을 업로드하기 위한 가장 기본적인 코드 (factory)
		factory.setSizeThreshold(4096);
		// 파일 업로드 환경 설정
		// 파일 업로드할때 사용하는 메모리의 크기 (버퍼 약 4k)
		// 50메가 중 4k씩 저장되는 것 (임시저장소에)
		
		factory.setRepository(new File(tempDir));
		// 파일이 업로드되면서 임시로 저장되는 공간 (temp)
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		// 실제로 파일 업로드하기 위한 클래스
		
		sf.setHeaderEncoding("utf-8"); // utf8로 인코딩
		sf.setFileSizeMax(maxSize);
		// 여기까지 고정된 코드
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			// form 태그에 들어가있는 input 태그들 parsing해서 처리한것이 list
			for(FileItem fi : list) {
				// list에 들어가있는 하나하나의 값을 파일아이템에
				String v = fi.getString("utf-8");
				// input 상자에 들어가있는 문자열(value값)이 한글인 경우에 utf-8로 인코딩을 해서 v에 넣기
				String k = fi.getFieldName();
				// input 태그의 name값 : getFieldName
				
				if(fi.isFormField()) {
					// input타입이 파일이 아닌가?
					switch (k) {
					case "mId": //<input type="text" name="mId"/>
					// input 상자의 name값이 mId면 v값을 vo의 mId에 집어넣어라
						vo.setmId(v);
						break;
						
					case "mName":
						vo.setmName(v);
						break;
					
					case "pwd":
						vo.setPwd(v);
						break;
						
					case "rDate":
						vo.setrDate(v);
						break;
						
					case "grade":
						vo.setGrade(Integer.parseInt(v));
						break;
						
					case "findStr":
						// 폼태그 이름이 findStr이면 value값을 attribute에 저장
						req.setAttribute("findStr", v);
						break;
						
					case "nowPage":
						req.setAttribute("nowPage", v);
						break;
						
					default:
						break;
					}
				}else { // <input type='file'/>인 경우
					if(fi.getSize()>0) {
						// file 태그가 여러개가 있다면 n번 돌게 될 것
						
						// file사이즈가 0이라면 파일이 넘어오지 않은 것
						// 파일을 선택하지 않고 등록버튼을 누른 경우 파일사이즈가 0
						
						String f = fi.getName();
						// file name을 가지고 오는 작업
						
						String sysFile = new Date().getTime() +"-"+f;
						// file명에 현재시간을 롱타입으로 바꿔서 집어넣어서 시스템파일명을 만들었다
						
						MemberPhoto p = new MemberPhoto();
						p.setOriFile(f);
						// getName에 의해서 만들어진 오리지널 파일
						p.setSysFile(sysFile);
						// 임의로 만든 시스템파일
						photoList.add(p);
						
						File file = new File(upload + sysFile);
						// upload 경로 안에 sysFile 더해서 만들고 : upload라는 path에 저장됨
						fi.write(file);
						// file을 실제로 저장
						
						fi.delete();
						// temp에 들어가있는 임시 파일을 지우는 작업
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		vo.setPhotos(photoList);
		return vo;
	}
}
