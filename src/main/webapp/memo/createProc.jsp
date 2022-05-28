<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="memo.*"%>
<%// 1.폼에서 넘긴 파라메터를 받는다. 2.파라메터를 DTO에 저장한다. 3. DTO값을 DB에 저장%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" /> 

<%
   
   boolean flag = dao.create(dto); //flag는 성공했는지 실패했는지 구분하기 위해 존재함. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class="container">
	<div class="well well-lg">
	 <%
	 	if(flag){
	 		out.print("글 등록 성공입니다.");
	 	}else{
	 		out.print("글 등록 실패입니다.");
	 	}
	 %>
	 </div>
	 
	 <button class='btn' onclick="location.href='createForm.jsp'">다시등록</button>
	 <button class='btn' onclick="location.href='list.jsp'">목록</button>
	
</div>	
</body>
</html>