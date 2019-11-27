<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원목록</title>
  
  <script type="text/javascript">
  function read(board_num){
	  var url = "${pageContext.request.contextPath}/board_hap/read";
	  url += "?board_num=" + board_num;
	  url += "&col=${col}";
 	  url += "&word=${word}";
	  url += "&nowPage=${nowPage}";
	  location.href = url;
  }
  
  
  </script>

</head>
<body>
<div class="container">
 <h2 class = "col-sm-offset-2 col-sm-10">회원목록</h2>
 <br>
  <form class = "form" method = "post" action ="list">
  
   <div class = "form-group">
   	<select name = "col" class = "form-control">
   	 <option value = "mname"
   	 <c:if test="${col==mname}">selected</c:if>
   	 >성명</option>
   	 
   	 
   	 <option value = "id" 
   	 <c:if test="${col==id}">selected</c:if> 
   	 >아이디</option>
   	 
   	 
   	 <option value = "email"
   	 <c:if test="${col==email}">selected</c:if>
   	 >이메일</option>
   	 
   	 
   	 <option value = "total"
   	 <c:if test="${col==total}">selected</c:if>
   	 >전체출력</option>
   	 
   	 
   	</select>
   </div>
   
   <div class = "form-group">
   <input type = "text" class = "form-control" name = "word" required = "required" value = "${word }">
   </div>
   
   <button class = "btn">검색</button>
   <button class = "btn" type ="button" onclick = "location.href='${pageContext.request.contextPath}/board_hap/create'">업소등록</button>
   
  
  </form>
  

<c:forEach var="dto" items="${list }">

	<table class = "table table-bordered">
	 <tr>
	 	<td rowspan = "5" class = col-sm-2>
	   <img src = "${pageContext.request.contextPath}/storage/${dto.board_map}" class = "img-rounded "width = "400px" height = "400px"
	   onclick = "javascript:read('${dto.board_num}')">
	 </td>
	 	 <th class = "col-sm-2">업소명</th>
	  	 <td class = "col-sm-8">${dto.board_name}</td>
	 </tr>
	 
	 
	 <tr>
	 	 <th class = "col-sm-2">업소번호</th>
	  	 <td class = "col-sm-8">${dto.board_num}</td>
	 </tr>
	 
	 
	 <tr>
	  	 <th class = "col-sm-2">조회수</th>
	  	 <td class = "col-sm-8">${dto.board_cnt}</td>
	 </tr>
	 
	 <tr>
	  	 <th class = "col-sm-2">주소</th>
	  	 <td class = "col-sm-8">${dto.board_address }</td>
	 </tr>
 

	   </table>
	   
	   </c:forEach>

${paging }



</div>

</body>
</html>