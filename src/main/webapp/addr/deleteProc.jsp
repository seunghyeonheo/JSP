<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="addr.*, java.util.*"%>
<%// 1.폼에서 넘긴 파라메터를 받는다. 2.파라메터를 DTO에 저장한다. 3. DTO값을 DB에 저장%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="addr.AddrDAO" />

<%
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	boolean flag = false;
	flag = dao.delete(addressnum);

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

	 <%
	 	if(flag){
	 		out.print("삭제를 성공했습니다.");
	 	}else{
	 		out.print("삭제를 실패했습니다.");
	 	}
	 %>


	 <button class='btn' onclick="location.href='list.jsp'">목록</button>
	
</div>	
</body>
</html>