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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > SQL 쿼리 및 하위 쿼리 > 계층적 쿼리
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">계층적 쿼리</p>
				<p>테이블에 계층적 데이터가 포함되어 있는 경우 계층적 쿼리 절을 사용하여 계층적 순서로 행을 선택할 수 있습니다.</p>
				
				<p id="sub_title">계층적 쿼리절::=</p>
				<p><img src="/study/oracle/img/hierarchical_query_clause.gif" /></p>
				 
				<p>condition조건에 설명된 대로 모든 조건이 될 수 있습니다.</p>
				<p>START WITH계층 구조의 루트 행을 지정합니다.</p>
				<p>CONNECT BY계층 구조의 부모 행과 자식 행 사이의 관계를 지정합니다.</p>
				
				<pre class="execute">
... PRIOR expr = expr
or
... expr = PRIOR expr
				</pre>

				<pre class="execute">
CONNECT BY last_name != 'King' AND PRIOR employee_id = manager_id ...
CONNECT BY PRIOR employee_id = manager_id and 
           PRIOR account_mgr_id = customer_id ...
				</pre>
				
				<p id="sub_title">계층적 쿼리 예제</p>
				<p>다음 계층적 쿼리는 CONNECT BY해당 절을 사용하여 직원과 관리자 간의 관계를 정의합니다.</p>

				<pre class="execute">
SELECT employee_id, last_name, manager_id
   FROM employees
   CONNECT BY PRIOR employee_id = manager_id;

EMPLOYEE_ID LAST_NAME                 MANAGER_ID
----------- ------------------------- ----------
        101 Kochhar                          100
        108 Greenberg                        101
        109 Faviet                           108
        110 Chen                             108
        111 Sciarra                          108
        112 Urman                            108
        113 Popp                             108
        200 Whalen                           101
        203 Mavris                           101
        204 Baer                             101
. . .				
				</pre>
				
				<p id="sub_title">LEVEL 예시</p>
				<p>다음 예는 앞의 예와 유사하지만 LEVEL가상 열을 사용하여 부모 행과 자식 행을 표시합니다.</p>
				<pre class="execute">
SELECT employee_id, last_name, manager_id, LEVEL
   FROM employees
   CONNECT BY PRIOR employee_id = manager_id;

EMPLOYEE_ID LAST_NAME                 MANAGER_ID      LEVEL
----------- ------------------------- ---------- ----------
        101 Kochhar                          100          1
        108 Greenberg                        101          2
        109 Faviet                           108          3
        110 Chen                             108          3
        111 Sciarra                          108          3
        112 Urman                            108          3
        113 Popp                             108          3
        200 Whalen                           101          2
        203 Mavris                           101          2
        204 Baer                             101          2
        205 Higgins                          101          2
        206 Gietz                            205          3
        102 De Haan                          100          1
...				
				</pre>
	
				<p id="sub_title">예제로 시작하세요</p>
				<p>다음 예에서는 START WITH계층 구조의 루트 행을 지정하는 절과 계층 구조 내에서 순서를 유지하기 위한 SIBLINGS키워드를 ORDER BY사용하는 절을 추가합니다. </p>
				<pre class="execute">
SELECT last_name, employee_id, manager_id, LEVEL
      FROM employees
      START WITH employee_id = 100
      CONNECT BY PRIOR employee_id = manager_id
      ORDER SIBLINGS BY last_name;

LAST_NAME                 EMPLOYEE_ID MANAGER_ID      LEVEL
------------------------- ----------- ---------- ----------
King                              100                     1
Cambrault                         148        100          2
Bates                             172        148          3
Bloom                             169        148          3
Fox                               170        148          3
Kumar                             173        148          3
Ozer                              168        148          3
Smith                             171        148          3
De Haan                           102        100          2
Hunold                            103        102          3
Austin                            105        103          4
Ernst                             104        103          4
Lorentz                           107        103          4
Pataballa                         106        103          4
Errazuriz                         147        100          2
Ande                              166        147          3
Banda                             167        147          3
...
				</pre>
				
				<p>표 에서 hr.employees직원 Steven King은 회사의 수장이며 관리자가 없습니다. 그의 직원 중에는 부서 80의 관리자인 John Singh이 있습니다.
				Singh을 King의 관리자로 설정하도록 employees표를 업데이트하면 데이터에 루프가 생성됩니다.</p>
				
				<pre class="execute">
UPDATE employees SET manager_id = 145
   WHERE employee_id = 100;

SELECT last_name "Employee", 
   LEVEL, SYS_CONNECT_BY_PATH(last_name, '/') "Path"
   FROM employees
   WHERE level <= 3 AND department_id = 80
   START WITH last_name = 'King'
   CONNECT BY PRIOR employee_id = manager_id AND LEVEL <= 4;

ERROR:
ORA-01436: CONNECT BY loop in user data
				</pre>
				
				<p>CONNECT BY조건의 NOCYCLE매개 변수로 인해 오라클은 루프에도 불구하고 행을 반환합니다. CONNECT_BY_ISCYCLE의사 열은 어떤 행에 사이클이 포함되어 있는지 보여줍니다:</p>
				
				<pre class="execute">
SELECT last_name "Employee", CONNECT_BY_ISCYCLE "Cycle",
   LEVEL, SYS_CONNECT_BY_PATH(last_name, '/') "Path"
   FROM employees
   WHERE level <= 3 AND department_id = 80
   START WITH last_name = 'King'
   CONNECT BY NOCYCLE PRIOR employee_id = manager_id AND LEVEL <= 4
   ORDER BY "Employee", "Cycle", LEVEL, "Path";

Employee                       Cycle      LEVEL Path
------------------------- ---------- ---------- -------------------------
Abel                               0          3 /King/Zlotkey/Abel
Ande                               0          3 /King/Errazuriz/Ande
Banda                              0          3 /King/Errazuriz/Banda
Bates                              0          3 /King/Cambrault/Bates
Bernstein                          0          3 /King/Russell/Bernstein
Bloom                              0          3 /King/Cambrault/Bloom
Cambrault                          0          2 /King/Cambrault
Cambrault                          0          3 /King/Russell/Cambrault
Doran                              0          3 /King/Partners/Doran
Errazuriz                          0          2 /King/Errazuriz
Fox                                0          3 /King/Cambrault/Fox
...				
				</pre>
				
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>