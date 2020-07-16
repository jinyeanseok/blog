<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		var register = "${register}";
		if(register === "registerOK") {
			alert("등록 되었습니다.");
		}
		
		var result = "${result}";
		if(result === "deleteOK") {
			alert("삭제 되었습니다.");
		}
	</script>

</head>
<body>
	
	<table>
		<tr> <!-- 한줄 -->
			<th>번호</th> <!-- 첫번째 칸 -->
			<th>제목</th> <!-- 두번째 칸 -->
			<th>작성자</th> <!-- 세번째 칸 -->
			<th>작성일자</th> <!-- 네번째 칸 -->
			<th>조회수</th>
		</tr>
		
		<c:forEach items="${list}" var="boardVO">
			<tr>
				<td>${boardVO.board_number}</td>
				<td><a href="/board/read&{pageMaker.makeQuery(PageMaker.cri.page)}&board_number=${boardVO.board_number}">${boardVO.title}</a></td>
				<td>${boardVO.name}</td>
				<td><fmt:formatDate pattern="YYYY-MM-dd" value="${boardVO.create_date}"/></td>
				<td>${boardVO.view_count}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
