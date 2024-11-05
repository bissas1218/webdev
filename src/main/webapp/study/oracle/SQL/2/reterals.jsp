<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>SQL표준</title>
 
 <link rel="stylesheet" href="/study/main.css" type="text/css" />
 
</head>
<body>

	<header>
	Header <br/>
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > Oracle SQL의 2가지 기본요소 > 리터럴
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">리터럴</p>
				<p>리터럴 값과 상수 값이라는 용어는 동의어이며 고정된 데이터 값을 나타냅니다. 예를 들어 'JACK', 'BLUE ISLAND' 및 '101'은 모두 문자 리터럴입니다. 5001은 숫자 리터럴입니다. 
				문자 리터럴은 Oracle이 스키마 개체 이름과 구분할 수 있도록 작은따옴표로 묶여 있습니다.</p>

				<p>이 섹션에는 다음 항목이 포함되어 있습니다.</p>
				
				<p id="sub_title">텍스트 리터럴</p>
				<p>text 리터럴 표기법을 사용하여 이 참조의 다른 부분에 있는 표현식, 조건, SQL 함수 및 SQL문의 구문에 string이 나타날 때마다 값을 지정합니다. 이 참조에서는 text literal, character literal 및 
				string이라는 용어를 서로 바꿔 사용할 수 있습니다. 텍스트, 문자 및 문자열 리터럴은 항상 작은따옴표로 묶습니다. 구문에서 char라는 용어를 사용하는 경우 텍스트 리터럴 또는 문자 데이터로 확인되는 
				다른 표현식(예: 테이블의 열)을 지정할 수 있습니다. char가 구문에 나타나면 작은따옴표가 사용되지 않습니다. last_namehr.employees</p>

			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>