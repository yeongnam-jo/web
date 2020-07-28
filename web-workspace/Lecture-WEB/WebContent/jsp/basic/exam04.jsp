<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 선언문의 변수는 클래스내에 멤버변수를 선언 --%>
	<%!
		private int sum = 0;
	%>
	
	<%!
		public int getSum(int val1, int val2){
			int sum = 0;
			for (int i = val1; i <= val2; i++){
				sum += i;
			}
			return sum;
	}
	%>
	
	1 - 10 사이의 총합 : <%= sum %><br> 
	1 - 10 사이의 총합 : <%= getSum(1, 20) %><br>
	1 - 10 사이의 총합 : <%= sum %><br> 
	
	
</body>
</html>