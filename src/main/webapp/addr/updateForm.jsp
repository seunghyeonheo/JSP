<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="addr.*" %>
<jsp:useBean id="dao" class="addr.AddrDAO" />
<%  
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	AddrDTO dto = dao.read(addressnum); 
	
%> 
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 수정</h1>
<form class="form-horizontal" 
      action="updateProc.jsp"
      method="post"
      >
  <input type="hidden" name='addressnum' value="<%=addressnum %>">
  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="name" id="name" class="form-control" value="<%=dto.getName()%>">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">휴대폰</label>
    <div class="col-sm-6">
      <input type="text" name="phone" id="phone" class="form-control" value="<%=dto.getHandphone()%>">
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">주소</label>
    <div class="col-sm-6">
      <input type="text" name="addr" id="addr" class="form-control" value="<%=dto.getAddress()%>">
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">우편번호</label>
    <div class="col-sm-6">
      <input type="text" name="zipcode" id="zipcode" class="form-control" value="<%=dto.getZipcode()%>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">상세주소</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="addr2" name="addr2" class="form-control"><%=dto.getAddress2() %></textarea>
    </div>
  </div>
  

  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 