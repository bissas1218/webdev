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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > Oracle SQL의 2가지 기본요소 > 데이터 유형 비교 규칙
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">데이터 유형 비교 규칙</p>
				<p>이 섹션에서는 Oracle Database가 각 데이터 유형의 값을 비교하는 방법에 대해 설명합니다.
				</p>
				
				<p id="sub_title">숫자 값</p>
				<p>더 큰 값은 작은 값보다 큰 것으로 간주됩니다. 모든 음수는 0보다 작고 모든 양수는 0보다 작습니다. 따라서 -1은 100보다 작습니다. -100은 -1보다 작습니다.</p>
				<p>부동 소수점 값(숫자가 아님)은 다른 숫자 값보다 크며 그 자체와 같습니다. NaN</p>

				<p>참조 항목: Numeric Precedence and Floating-Point Numbers(비교 의미론에 대한 자세한 정보)</p>

				<p id="sub_title">datetime형 값</p>
				<p>나중 날짜 또는 타임스탬프는 이전 날짜 또는 타임스탬프보다 큰 것으로 간주됩니다. 예를 들어 '29-MAR-2005'에 해당하는 날짜는 '05-JAN-2006'보다 작고, '05-JAN-2006 1:35pm'에 해당하는 타임스탬프는 
				'05-JAN-2005 10:09am'보다 큽니다.</p>

				<p>시간대가 있는 두 개의 타임스탬프를 비교할 때 먼저 UTC, 즉 시간대 오프셋 '+00:00'으로 정규화됩니다. 예를 들어 '16-OCT-2016 05:59am Europe/Warsaw'에 해당하는 시간대가 있는 타임스탬프는 
				'15-OCT-2016 08:59pm US/Pacific'의 타임스탬프와 같습니다. 둘 다 UTC로 표시되는 동일한 절대 시점을 나타내며 UTC는 2016년 10월 16일 오전 3시 59분입니다.</p>

				<p id="sub_title">이진 값</p>
				<p>데이터 형식의 이진 값 or은 바이트 시퀀스입니다. 두 개의 이진 값을 비교할 때 두 바이트 시퀀스의 해당 연속 바이트가 차례로 비교됩니다. 비교된 두 값의 첫 번째 바이트가 다르면 숫자 값이 더 낮은 바이트를 포함하는 
				이진 값이 더 작은 것으로 간주됩니다. 첫 번째 바이트가 같으면 두 번째 바이트도 유사하게 비교되며, 비교된 바이트가 다르거나 비교 프로세스가 값 중 하나의 끝에 도달할 때까지 계속됩니다. 후자의 경우 더 짧은 값이 더 작은 것으로 간주됩니다. RAWBLOB</p>

				<p>데이터 형식의 이진 값은 비교 조건에서 직접 비교할 수 없습니다. 그러나 PL / SQL 함수와 비교할 수 있습니다. BLOBDBMS_LOBCOMPARE</p>

				<p>참조 항목: 에 대한 자세한 내용은 Oracle Database PL/SQL 패키지 및 유형 참조를 참조하십시오. 기능 DBMS_LOBCOMPARE</p>

			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>