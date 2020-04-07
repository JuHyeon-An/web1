package mybatis;

public class Page {
	int totListSize; // 검색된 결과의 전체 건수
	int totPage;
	int listSize=10; // 10개씩
	int nowPage=1; // 현재페이지
	int startNo;
	int blockSize=5; // 게시판 페이지 몇번까지 표시할것인지
	int endNo;
	int startPage;
	int endPage;
	String findStr = "";
	
	public Page() {}
	
	public Page(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
		//  객체 생성되는 순간 바로 계산
	}
	
	public void pageCompute() {
		// 전체페이지 계산
		totPage = (int)Math.ceil(totListSize/(double)listSize);
		// 전체 게시글의 수를 10개씩 나눴을 때, 소수점 올리고 int로 형변환
		
		endNo = nowPage*listSize; // 1일때는 10까지, 2일때는 20까지...
		startNo = endNo-listSize+1;
		//startNo = endNo-(listSize+1);
		if(endNo>totListSize) endNo = totListSize;
		// endNo가 전체 게시글 건수보다 크면 같도록 만들어준다

		endPage = (int)Math.ceil(nowPage/(double)blockSize)*blockSize;
		//endPage = ((int)Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
		
		if(endPage>totPage) endPage = totPage;
	}
	
	public int getTotListSize() {
		return totListSize;
	}
	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
}
