<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doWrite(){
		let f = document.wForm;
		if(f.title.value  == ''){
			alert('제목을 입력하세요.')
			f.title.focus();
			return false;
		}
		
		/* if(f.writer.value  == ''){
			alert('글쓴이를 입력하세요.')
			f.writer.focus();
			return false;
		} */
		
		if(f.content.value  == ''){
			alert('내용을 입력하세요.')
			f.content.focus();
			return false;
		}
		
		
		return true;
	}
	
	
	function doList(){
		location.href = "list.jsp";
	}
	
	// 고전적 이벤트 모델
	window.onload = function(){ // body 까지 읽고 난 후에 실행될 부분...
		let btn = document.getElementById("btnList");
		btn.onclick = function(){
			alert('click...')
			location.href = "list.jsp"
		}
	}
	
	
</script>

</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		<div align = "center">
			<hr width = "80%">
			<h2>게시물 등록폼</h2>
			<hr width = "80%">
			<br>
			
			<form action = "write.jsp" method = "post" name ="wForm" onsubmit="return doWrite()"> <!-- url에 정보를 담지 않으려면, post 방식으로 보내야 한다. -->
				
				
				<table border = "1" style = "width : 80%">
					<tr>
						<th width = "23%">제목</th>
						<td><input type = "text" name = "title" size = "50"></td> <!-- name = value 형태로 보내야하니, name 속성을 반드시 정한다. -->
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${ userVO.id }</td>
						<input type="hidden" name="writer" value ="${ userVO.id }">
						<!-- <td><input type = "text" name = "writer" size = "50"></td> required = "required" 할 수도 있음. -->
						<!-- <td><input type = "text" name = "writer" size = "50" value = ${ userVO.id} readonly ></td> -->
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="7" cols="60" name="content"></textarea>
						</td>
					</tr>
					
				</table>
	
	
				<!-- <button type = "submit"></button> -->
				<input type = "submit" value = "등록">
				<!-- <input type = "button" value = "목록" onclick="doList()">   인라인 이벤트 모델(?) -->
				<input type = "button" value = "목록" id = "btnList">
				
			
			</form>
		</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
	
</body>
</html>