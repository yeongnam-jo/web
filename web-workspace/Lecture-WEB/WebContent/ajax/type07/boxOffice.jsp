<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult{
		width : 70%;
		height : 600px;
		border : 1px solid red;
	}
</style>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		$('#searchBtn').click(function(){
			let searchDate = $('#searchDate').val().split('-').join('');
			alert(searchDate)
			
			$.ajax({
				url		: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type	: 'get',
				
				/* data	: 'key=---------------&targetDt='+ searchDate + '&itemPerPage=3', */
				data 	: {
					key : '--------------',
					targetDt : searchDate,
					itemPerPage : 3
				},
				
				datatype: 'jsonp',
				/* success : function(result){
					alert('success')
				} */ 
				
				success : callback,
				error: function(error){
					alert('error')
				}
			})
		})
	})
	
	function callback(result) {
		let list = result.boxOfficeResult.dailyBoxOfficeList;

		for(var i = 0; i < list.length; i++) {
			let movieInfo = list[i];
			let rank = movieInfo.rank;
			let name = movieInfo.movieNm;
			let audiCnt = movieInfo.audiCnt;

			$('#searchResult').append('<h4>' + rank + '위</h4>');
			$('#searchResult').append('<strong>' + name 
					+ '</strong>(' + audiCnt + '명)<br>')
			$('#searchResult').append("<hr>");
		}
	}
	
</script>
</head>
<body>
	<h2>일일 박스오피스 조회서비스</h2>
	검색일 : <input type ="date" id = "searchDate">
	<button id = "searchBtn">검색</button>
	<h4>검색 결과</h4>
	<div id ="searchResult"></div>
</body>
</html>