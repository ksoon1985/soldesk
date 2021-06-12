package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;

public class UpdateFormAction implements CommandAction{
	 @Override
	   public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable 
	 {

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
		 
		 String passwd = req.getParameter("passwd");
		 int num = Integer.parseInt(req.getParameter("num"));
		 //DAO를 통해서 해당 글 갖고오기
		 BoardDAO dao = BoardDAO.getInstance();
		 BoardDTO dto = dao.getArticle(num);

		 req.setAttribute("dto",dto);
		 req.setAttribute("pdto",pdto);
		 
		 return "/board2/updateForm.jsp";
	 }
}
