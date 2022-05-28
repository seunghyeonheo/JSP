<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="bbs.*, java.util.*"%>
<%// 1.폼에서 넘긴 파라메터를 받는다. 2.파라메터를 DTO에 저장한다. 3. DTO값을 DB에 저장%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" /> 

<%
   Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
    dao.upAnsnum(map);
    boolean flag = dao.createReply(dto); //답변
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
	 		out.print("글 답변을 성공했습니다.");
	 	}else{
	 		out.print("글 답변을 실패했습니다.");
	 	}
	 %>
	 </div>
	 
	
	 <button class='btn' onclick="location.href='createForm.jsp'">다시등록</button>
	 <button class='btn' onclick="location.href='list.jsp'">목록</button>
	
</div>	
</body>
</html>