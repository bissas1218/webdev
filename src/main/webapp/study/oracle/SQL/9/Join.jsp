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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > SQL 쿼리 및 하위 쿼리 > 조인
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">조인</p>
				<p>조인은 두 개 이상의 테이블, 뷰 또는 구체화된 뷰의 행을 결합하는 쿼리입니다. 오라클 데이터베이스는 쿼리의 FROM 절에 여러 개의 테이블이 나타말 때마다 조인을 수행합니다.
				쿼리의 선택 목록은 다음 테이블 중 어느 하나에서 열을 선택할 수 있습니다. 이 두 테이블 중 하나에 공통적으로 열 이름이 있는 경우, 모호하지 않도록 쿼리 전체에 걸쳐 이러한 열에 대한 모든 참조에 테이블 이름을 부여해야 합니다.
				</p>
				
				<p id="sub_title">조인조건</p>
				<p>대부분의 조인 쿼리에는 FROM 절 또는 WHERE 절에 하나 이상의 조인 조건이 포함되어 있습니다. 조인 조건은 각각 다른 테이블의 두 열을 비교합니다.
				조인을 실행하기 위해 오라클 데이터베이스는 각 테이블의 각 행이 하나씩 포함된 행 쌍을 결합하여 조인 조건이 TRUE로 평가됩니다. 조인 조건의 열은 선택 목록에 표시될 필요도 없습니다.	</p>
				
				<p>세 개 이상의 테이블로 구성된 조인을 실행하려면 먼저 두 개의 테이블을 비교한 조인 조건에 따라 결합한 다음, 결합된 테이블과 새 테이블의 열이 포함된 다른 테이블로 결과를 결합합니다.
					오라클은 모든 테이블이 결과에 결합될 때까지 이 프로세스를 계속합니다. 옵티마이저는 오라클이 조인 조건, 테이블의 인덱스 및 테이블에 대한 사용 가능한 통계를 기반으로 테이블을 결합하는 순서를 결정합니다.</p>
					
				<p>조인 조건이 포함된 WHERE 절에는 하나의 테이블 열만 참조하는 다른 조건도 포함될 수 있습니다. 이러한 조건은 조인 쿼리에서 반환되는 행을 더욱 제한할 수 있습니다.</p>
				
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>