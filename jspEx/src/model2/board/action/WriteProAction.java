package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class WriteProAction implements CommandAction {

   @Override
   public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
      // 한글 확입얼을 위해 utf-8로 전환
      req.setCharacterEncoding("UTF-8");
      
      // writeForm에서 보내준 데이터 모두 받기
      BoardDTO dto = new BoardDTO();
      
      //num, ref, re_step, re_level, readcnt(readcount) 이 있으면 받아야함
      //writer, subject, content, passwd, email, attachNm
      dto.setNum(Integer.parseInt(req.getParameter("num")));
      dto.setRef(Integer.parseInt(req.getParameter("ref")));
      dto.setRe_step(Integer.parseInt(req.getParameter("re_step")));
      dto.setRe_level(Integer.parseInt(req.getParameter("re_level")));
      dto.setWriter(req.getParameter("writer"));
      dto.setSubject(req.getParameter("subject"));
      dto.setContent(req.getParameter("content"));
      dto.setEmail(req.getParameter("email"));
      dto.setPasswd(req.getParameter("passwd"));
      dto.setAttachNm(req.getParameter("attachNm"));
      
      
      
      //DAO를 통해서 받은 데이터 저장하기
         //DAO에 대한 인스턴스 받아오기
      BoardDAO dao = BoardDAO.getInstance();
      int r = dao.boardWrite(dto);
      
      return "/board2/writePro.jsp";
   }

}