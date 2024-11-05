<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>SQL의 역사</title>
 
 <link rel="stylesheet" href="/study/main.css" type="text/css" />
 
</head>
<body>

	<header>
	Header <br/>
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > Oracle SQL소개 > SQL의 역사
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">SQL의 역사</p>
				<p>EF Codd 박사는 1970년 6월 Association of Computer Machinery(ACM) 저널인 Communications of the ACM 에 "대규모 공유 데이터 뱅크를 위한 관계형 데이터 모델"이라는 논문을 발표했습니다 . Codd의 모델은 현재 관계형 데이터베이스 관리 시스템(RDBMS)의 확정적 모델로 받아들여지고 있습니다. 구조화된 영어 쿼리 언어(SEQUEL)라는 언어는 IBM Corporation, Inc.에서 Codd의 모델을 사용하기 위해 개발했습니다. SEQUEL은 나중에 SQL(여전히 "sequel"이라고 발음)이 되었습니다. 1979년 Relational Software, Inc.(현재 Oracle)는 최초로 상업적으로 이용 가능한 SQL 구현을 도입했습니다. 오늘날 SQL은 표준 RDBMS 언어로 받아들여지고 있습니다.</p>
				
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>