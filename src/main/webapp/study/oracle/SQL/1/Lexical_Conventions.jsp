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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > Oracle SQL소개 > 어휘 규칙
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">어휘 규칙</p>
				<p>SQL 문을 실행하기 위한 다음 어휘 규칙은 특히 Oracle Database의 SQL 구현에만 적용되지만 일반적으로 다른 SQL 구현에서도 허용됩니다. 
				SQL 문을 실행할 때, 문장 정의 내에 공백이 있는 곳에 하나 이상의 탭, 캐리지 리턴, 공백 또는 주석을 포함할 수 있습니다. 따라서 Oracle Database는 
				다음 두 문장을 동일한 방식으로 평가합니다.</p>
				
				<div class="execute">
				<p>SELECT last_name,salary*12,MONTHS_BETWEEN(SYSDATE,hire_date) <br/>
					  FROM employees<br/>
					  WHERE department_id = 30<br/>
					  ORDER BY last_name;<br/>
					<br/>
					SELECT last_name,<br/>
					  salary * 12,<br/>
					        MONTHS_BETWEEN( SYSDATE, hire_date )<br/>
					FROM employees<br/>
					WHERE department_id=30<br/>
					ORDER BY last_name;</p>
				</div>
				<p>대소문자는 예약어, 키워드, 식별자 및 매개 변수에서 중요하지 않습니다. 그러나 대소문자는 텍스트 리터럴과 따옴표로 묶인 이름에서 중요합니다. Text Literals의 구문 설명에 대해서는 Text Literals를 참조하십시오.</p>
				<p>참고:SQL문은 프로그래밍 환경마다 다르게 종료됩니다. 이 설명서 세트는 기본 SQL*Plus 문자인 세미콜론(;).</p>
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>