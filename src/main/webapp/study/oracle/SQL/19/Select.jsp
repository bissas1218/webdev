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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > SQL 문 MERGE에서 UPATE로 > SELECT
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">SELECT</p>
				<p id="sub_title">목적</p>

				<p>SELECT 문 또는 하위 쿼리를 사용하여 하나 이상의 테이블, 객체 테이블, 뷰, 객체뷰, 구체화된 뷰, 분석 뷰 또는 계층에서 데이터를 검색합니다.</p>
				<p>SELECT 문 결과의 일부 또는 전부가 기존의 구체화된 보기와 동일한 경우, 오라클 데이터베이스는 SELECT 문에 지정된 하나 이상의 테이블 대신 구체화된 보기를 사용할 수 있습니다. 이러한 대체를 쿼리 재작성이라고 합니다.
				비용 최적화가 활성화되어 있고 QUERY_REWRITE_ENABLED 매개 변수가 TRUE로 설정된 경우에만 적용됩니다. 쿼리 재작성이 발생했는지 확인하려면 EXPLAIN PLAN 문을 사용합니다.</p>
				<br/>
				
				<p>참고항목</p>
				<ul>
					<li>쿼리 및 하위 쿼리에 대한 일반 정보를 확인할 수 있는 SQL 쿼리 및 하위 쿼리</li>
					<li>구체화된 보기, 쿼리 재작성, 분석 보기 및 계층에 대한 자세한 정보를 보려면 오라클 데이터베이스 데이터 웨어하우스 가이드</li>
					<li>JSON 데이터를 쿼리하는 경우 JSON 데이터 쿼리 참조</li>
					<li>XML 데이터를 쿼리하는 경우 오라클 XML DB에 저장된 XML 콘텐츠 쿼리를 참조하십시오</li>
					<li>EXPLAIN PLAN</li>
				</ul>
				
				<p id="sub_title">전제조건</p>
				<p>표, 구체화된 뷰, 분석 뷰 또는 계층 구조에서 데이터를 선택하려면 개체가 자신의 스키마에 있거나 표, 구체화된 뷰, 분석 뷰 또는 계층 구조에 대한 읽기 또는 선택 권한이 있어야 합니다.</p>
				<p>뷰의 기본 테이블에서 행을 선택하려면:</p>
				<ul>
					<li>개체가 자체 스키마에 있거나 읽기 또는 선택 권한이 있어야 하며</li>
					<li>개체가 포함된 스키마를 소유한 사람은 기본 테이블에 읽기 또는 선택 권한이 있어야 합니다.</li>
				</ul>
				<p>모든 TABLE 읽기 또는 모든 TABLE 선택 시스템 권한을 사용하면 모든 TABLE, 구체화된 뷰, 분석 뷰 또는 계층 구조 또는 구체화된 뷰, 분석 뷰 또는 계층 구조의 기본 TABLE에서 데이터를 선택할 수도 있습니다.</p>
				<p>FOR UPDATE 조항을 지정하려면 다음을 제외하고는 이전 전제 조건이 적용됩니다: 언급된 경우 모든 TABLE 읽기 및 읽기 권한은 FOR UPDATE 조항을 지정할 수 없습니다.</p>
				
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>