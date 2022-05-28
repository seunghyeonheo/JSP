<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="addr.*" %>
<jsp:useBean id="dao" class="addr.AddrDAO"/> 
<%
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	
	AddrDTO dto = dao.read(addressnum); //한건의 레코드 조회
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script>
  	function update(addressnum){ //수정페이지로 이동
  		//alert(bbsno);
  		let url = 'updateForm.jsp?bbsno='+bbsno;
  		location.href = url;
  	}
  	function del(addressnum){ //삭제페이지로 이동
  		//alert(bbsno);
  		let url = 'deleteForm.jsp?bbsno='+bbsno;
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
	<div class="panel-body"><%=dto.getName() %></div>
	<div class="panel-heading">휴대폰번호</div>
	<div class="panel-body"><%=dto.getHandphone() %></div>
	<div class="panel-heading">주소</div>
	<div class="panel-body" style='height:170px'><%=dto.getAddress() %></div>

</div>
<div>
	<button onclick="location.href='createForm.jsp'">등록</button>
	<button onclick="update('<%=addressnum%>')">수정</button>
	<button onclick="del('<%=addressnum%>')">삭제</button>
	<button onclick="reply('<%=addressnum%>')">답변</button>
	<button onclick="location.href='list.jsp'">목록</button>
</div>
<br>
</div>
</body> 
</html> 