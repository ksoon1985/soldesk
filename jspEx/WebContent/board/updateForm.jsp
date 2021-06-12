<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/boardScript.js"></script>
</head>
<%

String passwd = request.getParameter("passwd");
int num = Integer.parseInt(request.getParameter("num"));
//DAO를 통해서 해당 글 갖고오기
BoardDAO dao = BoardDAO.getInstance();
BoardDTO dto = dao.getArticle(num);

request.setAttribute("dto",dto);
%>

<body>
    <form action="updatePro.jsp" method="post" name="writeForm" onsubmit="return sendData()">
      <table border=1>
         <thead>
            <tr>
               <th colspan=2>
                  <h3>글수정</h3>
               </th>
            </tr>
         </thead>

         <tbody>
            <tr>
               <th>제목:</th>
               <td><input type="text" size="100%" placeholder="제목을 입력하세요" name="subject" 
                                                   value='<c:out value="${dto.subject}"/>'/> </td>
            </tr>
            <tr>
               <th>내용:</th>
               <td>
               		<textarea cols="100" rows="20" placeholder="내용을 입력하세요" name="content">
               			<c:out value="${dto.content}"/>
               		</textarea>
               </td>
            </tr>
            <tr>
               <th>첨부파일:</th>
               <td><input type="file" placeholder="파일을 선택하세요." name="attachNm" 
                                                   value='<c:out value="${dto.attachNm}"/>'/> </td>
            <tr>
            <tr>
               <th>작 성 자:</th>
               <td><input type="text" placeholder="작성자를 입력하세요" name="writer"
                                                   value='<c:out value="${dto.writer}"/>'/> </td>
            <tr>
            <tr>
               <th>작 성 자:</th>
               <td><input type="text" placeholder="메일 주소를 입력하세요" name="email"
                                                   value='<c:out value="${dto.email}"/>'/> </td>
            <tr>
            <tr>
               <th>비밀번호:</th>
               <td>
               		<input type="password" placeholder="비밀번호를 입력하세요" name="passwd" value='<c:out value="${dto.passwd}"/>'/>                                
               		<input type="hidden" name="num" value='<c:out value="${dto.num}"/>'/>
               </td>
                      
            <tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="등록" />
                  <input type="button" value="글 목록으로...." id="List1"/> 
                     <!-- onclick="javascript:location.href='boardList.jsp'"> -->
               </td>
            </tr>
            
         </tbody>
      </table>
   </form>
   
<%-- /* 
   
     String cpass = request.getParameter("cpass");
      String passwd = request.getParameter("passwd");
      String num = request.getParameter("num");
      System.out.println(passwd);
      System.out.println(num);

      if (cpass != null) {
         System.out.println("2" + cpass);
         System.out.println("2" + passwd);
         System.out.println("2" + num);
      } else {
         System.out.println("1" + passwd);
         System.out.println("1" + num);
         request.setAttribute("passwd", passwd);
         request.setAttribute("num", num);
      }   
      
%>  --%>
      

</body>
</html>