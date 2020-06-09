<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="thumbnail.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    // C:\study\soldesk_git\jspEx\WebContent\thumbnail\images
	    
		String realFolder = "";
		
		//파일이 업로드 되는 폴더를 지정
		String saveFolder = "thumbnailImage";
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		
		ServletContext context = getServletContext();
		System.out.println(context);
		// org.apache.catalina.core.ApplicationContextFacade@9703ffd
		
		//현재 jsp 페이지의 웹 어플리케이션상의 절대 경로를 구한다
		realFolder = context.getRealPath(saveFolder);
		System.out.println(realFolder);
		// C:\study\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\jspEx\thumbnailImage

		
		try{
			MultipartRequest multi = null;
			
			// 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
			// 전송할 파일명을 가지고 있는 객체 , 서버상의 절대경로,
			// 최대 업로드될 파일크기 , 문자코드 , 기본 보안 적용
			
			multi = new MultipartRequest(request,realFolder,maxSize,encType,
					new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			int zoom = 5;
			
			//파일 정보가 있다면
			while(files.hasMoreElements())
			{
				//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터 이름 
				String name = (String)files.nextElement();
				
				// 서버에 저장된 파일 이름
				String filename = multi.getFilesystemName(name);
				
				String orgFileName = realFolder + "\\" + filename;
				String thumbFileName = realFolder + "\\small" + filename;
				
				Thumbnail.createImage(orgFileName, thumbFileName, zoom);
	%>			
				원본파일 저장경로 및 파일명 : <%= orgFileName %><br>
				<img src="<%=orgFileName%>" border="0"><br><br><br>
				"썸네일 이미지 저장경로및 파일명 : " <%= thumbFileName %><br>
				<img src="<%=thumbFileName %>" border="0">
	<%
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>