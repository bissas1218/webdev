<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Oracle</title>
 
 <link rel="stylesheet" href="/study/main.css" type="text/css" />
 
</head>
<body>

	<header>
	Header <br/>
	<a href="/">Home</a> > <a href="/study">Study</a> > Oracle > 오라클 샘플 데이터 설치
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">오라클 샘플 데이터 설치</p>
				<p id="title_exp">
					https://github.com/oracle-samples/db-sample-schemas/releases/tag/v23.3</p>
				
				<p id="sub_title">Oracle Database 샘플 스키마 23c</p>
				<hr>
				<p>db-sample-schemas-23.3.zip파일 다운로드 human_resources폴더로 이동 hr_create.sql로 테이블 생성 hr_populate.sql파일로 데이터 생성</p>
				

			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>