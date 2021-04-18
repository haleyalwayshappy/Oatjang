package com.commu.dto;

import com.commu.dao.CommuDAO;

public class CommuPaging {

	int currentPage;   // 현재페이지
	int pageBlock;     // [이전][1][2][3][다음]
	int pageSize;      // 1페이 지당 5개씩 글 뿌리기
	StringBuffer pagingHTML;
	
	public CommuPaging(int currentPage, int pageBlock, int pageSize) {
		this.currentPage = currentPage;
		this.pageBlock = pageBlock;
		this.pageSize = pageSize;
	}
	
	public void makePagingHTML(){
		pagingHTML=new StringBuffer();
		System.out.println("currentPage:"+currentPage);
		CommuDAO commuDAO=CommuDAO.getInstance();
		int totalA=commuDAO.getTotalArticle();//총글수			
		int totalP=(totalA+pageSize-1)/pageSize;//총페이지수
	
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;		
		int endPage=startPage+pageBlock-1;
				
		if(endPage>totalP){
			endPage=totalP;
		}		
		
		//----------------------------------------------------------------
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='/oatjang/commuList.do?pg="
		+(startPage-pageBlock)+"'>"+"이전</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='/oatjang/commuList.do?pg="
			                     +i+"' id='a_back'>"+ i+ "</a>");
			
			}else{
				pagingHTML.append("<a href='/oatjang/commuList.do?pg="
			                      +i+"'>"+i+"</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='/oatjang/commuList.do?pg="
		+(startPage+pageBlock)+"'>"+"다음</a>");
		}
	}
	
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	
}
