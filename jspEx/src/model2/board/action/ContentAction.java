package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;


public class ContentAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(req.getParameter("num"));
		
		
		// 현재 페이지
		int currentPage = 0;
		if(req.getParameter("currentPage") == null)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		
		// 현재 페이지 블럭 
		int currPageBlock = 0;
		if(req.getParameter("currPageBlock") == null)
			currPageBlock = 1;
		else
			currPageBlock = Integer.parseInt(req.getParameter("currPageBlock"));
		
		
		PageDTO pdto = new PageDTO();
		pdto.setCurrentPage(currentPage);
		pdto.setCurrPageBlock(currPageBlock);
		
		
		// 실제 데이터 가져오기
		// dao 사용 ... 인스턴스 얻어오기
		BoardDAO dao = BoardDAO.getInstance();
		
		// 해당 인스턴스에서 해당되는 메소드 가져오기 
		BoardDTO dto = 	dao.getArticle(num);
		

		// setAttribute 를 해줘야 됨 
	    req.setAttribute("dto", dto);
		req.setAttribute("pdto", pdto);
	    
		return "/board2/content.jsp";
	}
}
