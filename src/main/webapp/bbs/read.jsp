<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/> 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dao.upViewcnt(bbsno); //조회수 증가
	BbsDTO dto = dao.read(bbsno); //한건의 레코드 조회
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script>
  	function update(bbsno){ //수정페이지로 이동
  		//alert(bbsno);
  		let url = 'updateForm.jsp?bbsno='+bbsno;
  		location.href = url;
  	}
  	function del(bbsno){ //삭제페이지로 이동
  		//alert(bbsno);
  		let url = 'deleteForm.jsp?bbsno='+bbsno;
  		location.href = url;
  	}
  	function reply(bbsno){ //답변페이지로 이동
  		//alert(bbsno);
  		let url = 'replyForm.jsp?bbsno='+bbsno;
  		location.href = url;
  	}
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1>조회</h1>
<div class="panel panel-default">
	<div class="panel-heading">작성자</div>
	<div class="panel-body"><%=dto.getWname() %></div>
	<div class="panel-heading">제목</div>
	<div class="panel-body"><%=dto.getTitle() %></div>
	<div class="panel-heading">내용</div>
	<div class="panel-body" style='height:170px'><%=dto.getContent() %></div>
	<div class="panel-heading">조회수</div>
	<div class="panel-body"><%=dto.getViewcnt() %></div>
	<div class="panel-heading">등록일</div>
	<div class="panel-body"><%=dto.getWdate() %></div>
</div>
<div>
	<button onclick="location.href='createForm.jsp'">등록</button>
	<button onclick="update('<%=bbsno%>')">수정</button>
	<button onclick="del('<%=bbsno%>')">삭제</button>
	<button onclick="reply('<%=bbsno%>')">답변</button>
	<button onclick="location.href='list.jsp'">목록</button>
</div>
<br>
</div>
</body> 
</html> 