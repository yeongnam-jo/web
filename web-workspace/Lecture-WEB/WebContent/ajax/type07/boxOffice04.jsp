<%--
	http://kobis.or.kr/ 에서 제공하는 영화 정보 API를 활용한다.
	일별 박스오피스, 감독, 배우, 장르 등의 정보를 ajax 통신으로 가져온 뒤 화면의 일부만 수정해보자.
	
	조건 : 상세보기 버튼을 눌렀을  때 감독, 배우, 장르 정보가 나타나고, 다시 버튼을 누르면 사라지도록 구현
	
	추가조건 : 상세보기 버튼 없이 최초부터 상세보기 가져오기.

 --%>


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
	
	#searchResult div{
		border : 1px solid blue;
		display : none;
	} 
	
</style>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		$('#searchBtn').click(function(){
			let searchDate = $('#searchDate').val().split('-').join('');
			//alert(searchDate)
			
			$.ajax({
				url		: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type	: 'get',
				
				/* data	: 'key=--------------------&targetDt='+ searchDate + '&itemPerPage=3', */
				data 	: { // 파라미터
					key : '--------------------',
					targetDt : searchDate,
					itemPerPage : 3
				},
				
				datatype: 'jsonp', //cross domain 정책 . 이것을 해결해주는 것. (네이버에서 ajax로 갔다온 서버도 네이버여야 함.)
				/* success : function(result){
					alert('success')
				} */ 
				
				success : callback,
				error: function(error){
					alert('error')
				}
			})
		})
		
		/* $('#detailBtn').on('click', function(event){
			alert('테스트')
		})  */
		
		/* $('#detailBtn').addEventListener('click', function(event) {
			alert('dd')
		}) */
		
	})
	
	function callback(result) {
		let list = result.boxOfficeResult.dailyBoxOfficeList;
		let movieCdList = [];

		for(var i = 0; i < list.length; i++) {
			let movieInfo = list[i];
			let rank = movieInfo.rank;
			let name = movieInfo.movieNm;
			let audiCnt = movieInfo.audiCnt;
			movieCdList[i] = movieInfo.movieCd;

			$('#searchResult').append('<h4>' + rank + '위</h4>');
			$('#searchResult').append('<strong>' + name 
					+ '</strong>(' + audiCnt + '명)<br>')
				
			$('#searchResult').append("<button id = " + movieInfo.movieCd + ">상세보기</button>"); 
			/*
				상세보기 누르면 상세보기 div 태그가 나온다. 다시 클릭하면 사라진다.
				
				감독 : xxx
				배우정보 : xxx
				장르 : xxx
			
			*/
			$('#searchResult').append('<div id ="detail' + movieInfo.movieCd + '"></div>');
			$('#searchResult').append("<hr>");
			
			
			/* $('#searchResult button').click(function(){
				console.log(this)
			}) */
			
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