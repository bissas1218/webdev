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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > 유사컬럼 > Hierarchical Query 의사 열(Hierarchical Query Pseudocolumns)
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">Hierarchical Query 의사 열(Hierarchical Query Pseudocolumns)</p>
				<p>hierarchical query 의사 열은 hierarchical queries에서만 유효합니다. 계층적 쿼리 의사 열은 다음과 같습니다.</p>

				<p>쿼리에서 계층적 관계를 정의하려면 이 절을 사용해야 합니다. CONNECTBY</p>
				
				<p id="sub_title">CONNECT_BY_ISCYCLE 의사 컬럼</p>
				<p>의사 컬럼은 현재 행에 조상이기도 한 자식이 있는 경우 1을 리턴합니다. 그렇지 않으면 0을 반환합니다. CONNECT_BY_ISCYCLE</p>
				<p>절의 매개변수를 지정한 경우에만 지정할 수 있습니다. Oracle이 데이터의 루프로 인해 실패할 수 있는 쿼리 결과를 반환할 수 있도록 합니다. CONNECT_BY_ISCYCLENOCYCLECONNECTBYNOCYCLECONNECTBY</p>
				<p>참조 항목:매개 변수에 대한 자세한 내용은 Hierarchical Queries를 참조하고, 가상 열을 사용하는 예제는 Hierarchical Query Examples를 참조하십시오 NOCYCLECONNECT_BY_ISCYCLE</p>

				<p id="sub_title">CONNECT_BY_ISLEAF 의사 컬럼</p>
				<p>의사 컬럼은 현재 행이 조건에 의해 정의된 트리의 리프인 경우 1을 리턴합니다. 그렇지 않으면 0을 반환합니다. 이 정보는 더 많은 계층을 표시하기 위해 지정된 행을 더 확장할 수 있는지 여부를 나타냅니다. 
				CONNECT_BY_ISLEAFCONNECTBY</p>
				
				<b>CONNECT_BY_ISLEAF 예시</b>
				<p>다음 예에서는 테이블의 처음 세 수준을 보여 주며 각 행에 대해 리프 행(열에서 1로 표시) 또는 자식 행(열에서 0으로 표시)이 있는지 여부를 나타냅니다. hr.employeesIsLeafIsLeaf</p>
				<div class="execute">
					<p>SELECT last_name "Employee", CONNECT_BY_ISLEAF "IsLeaf",<br/>
					       LEVEL, SYS_CONNECT_BY_PATH(last_name, '/') "Path"<br/>
					  FROM employees<br/>
					  WHERE LEVEL <= 3 AND department_id = 80<br/>
					  START WITH employee_id = 100<br/>
					  CONNECT BY PRIOR employee_id = manager_id AND LEVEL <= 4<br/>
					  ORDER BY "Employee", "IsLeaf";<br/>
					<br/>
					Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IsLeaf
					&nbsp;&nbsp;&nbsp;&nbsp;LEVEL 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Path<br/>
					--------------- ---------- ---------- -------------------------<br/>
					Abel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1          
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/King/Zlotkey/Abel<br/>
					Ande&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1          
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3 
					&nbsp;&nbsp;&nbsp;/King/Errazuriz/Ande<br/>
					Banda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1          
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3 
					&nbsp;&nbsp;/King/Errazuriz/Banda<br/>
					Bates&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1
					3 /King/Cambrault/Bates<br/>
					Bernstein                          1          3 /King/Russell/Bernstein<br/>
					Bloom                              1          3 /King/Cambrault/Bloom<br/>
					Cambrault                          0          2 /King/Cambrault<br/>
					Cambrault                          1          3 /King/Russell/Cambrault<br/>
					Doran                              1          3 /King/Partners/Doran<br/>
					Errazuriz                          0          2 /King/Errazuriz<br/>
					Fox                                1          3 /King/Cambrault/Fox<br/>
					. . . </p>
				</div>
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>