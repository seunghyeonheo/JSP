<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*, addr.AddrDTO, utility.*" %>
<jsp:useBean id="dao" class="addr.AddrDAO" />
<%  

//검색관련--------------
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total"))word = "";

//페이징 관련---------------
int nowPage = 1;
if(request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage = 5;

int sno = ((nowPage -1) * recordPerPage);
int eno = recordPerPage;

Map map = new HashMap();
map.put("col",col);
map.put("word",word);
map.put("sno",sno);
map.put("eno",eno);

List<AddrDTO> list = dao.list(map);


%>  
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	function read(addressnum){
  	   let url = 'read.jsp?addressnum='+addressnum;
  	   location.href = url;
  	  
  	}
  	
  	function del(addressnum){
       if(confirm('정말 삭제 하겠습니까 ?')){
   	   		let url = 'deleteProc.jsp?addressnum='+addressnum;
   	   		location.href = url;
       }
   	}
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">주소록 목록</h1>
<form action="list.jsp" class='form-inline'>
<div class='form-group'>
 <select class='form-control' name='col'>
 	<option value="name" <%if(col.equals("name")) out.print("selected");%>>이름</option>
 	<option value="handphone" <%if(col.equals("handphone")) out.print("selected");%>>휴대폰</option>
 	<option value="address" <%if(col.equals("address")) out.print("selected");%> >주소</option>
 </select>
</div>
<div class="form-group">
	<input type='text' class='form-control' placeholder='Enter 검색어' name='word' value="<%=word%>">
</div>
<button class='btn btn-default'>검색</button>
<button class='btn btn-default' type='button' onclick="location.href='createForm.jsp'">등록</button>
</form>
<table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>휴대폰번호</th>
			<th>주소</th>
		</tr>
	</thead>
	
<tbody>
<%
				if (list.size() == 0) {
				%>
				<tr>
					<td colspan='7'>등록된 주소가 없습니다.</td>
				</tr>

				<%
				} else {
				for (int i = 0; i < list.size(); i++) {
					AddrDTO dto = list.get(i);
				%>

				<tr>
					<td><%=dto.getAddressnum()%></td>
					<td><a href="javascript:read('<%=dto.getAddressnum()%>')"><%=dto.getName()%></a></td>
					<td><%=dto.getHandphone()%></td>
					<td><%=dto.getAddress()%></td>
					<td><a href="javascript:del('<%=dto.getAddressnum()%>')">삭제</a></td>
				</tr>

				<%
				} //for end 
				} // if end
				%>
</tbody>
</table>
</div>
</body> 
</html> 