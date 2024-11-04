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
	<a href="/">Home</a> > <a href="/study">Study</a> > Oracle
	</header>
	
	<main>
		<div id="mainWrap">
			<div class="left">
				<ul>
					<li><a href="/study/oracle/index.jsp">오라클XE 설치하기</a></li>
					<li>Oracle SQL소개
						<ul>
							<li><a href="/study/oracle/SQL/1/history_of_SQL.jsp">SQL의 역사</a></li>
							<li><a href="/study/oracle/SQL/1/SQL_Standards.jsp">SQL표준</a></li>
							<li><a href="">Enterprise Manager 사용</a></li>
							<li><a href="/study/oracle/SQL/1/Lexical_Conventions.jsp">어휘 규칙</a></li>
							<li><a href="">도구 지원</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">Oracle 시작하기</p>
				<p id="title_exp">https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/index.html<br/>
					https://github.com/oracle-samples/db-sample-schemas/releases/tag/v23.3</p>
				
				<p id="sub_title">Oracle 설치하기</p>
				<hr>
				<p>https://www.oracle.com/kr/database/technologies/xe-downloads.html에 접속한다.</p>
				<p>OracleXE213_Win64.zip를 다운로드 및 설치</p>
				<p>C:\app\kbs\product\21c\homes\OraDB21Home1\network\admin\tnsnames.ora 파일열기 서비스네임 확인</p>
				<p>Cmd창 열기</p>
				<p>Microsoft Windows [Version 10.0.22631.4317]<br/>
				(c) Microsoft Corporation. All rights reserved.
				<br/>
				C:\Users\kbs>tnsping XE<br/>
				<br/>
				TNS Ping Utility for 64-bit Windows: Version 21.0.0.0.0 - Production on 02-11월-2024 06:36:12<br/>
				<br/>
				Copyright (c) 1997, 2021, Oracle.  All rights reserved.<br/>
				<br/>
				사용된 매개변수 파일:<br/>
				C:\app\kbs\product\21c\homes\OraDB21Home1\network\admin\sqlnet.ora<br/>
				<br/>
				<br/>
				별칭 분석을 위해 TNSNAMES 어댑터 사용<br/>
				(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = DESKTOP-6LUA33S)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = XE)))에 접속하려고 시도하는 중<br/>
				확인(40밀리초)<br/>
				<br/>
				C:\Users\kbs></p>
				<p>https://dbeaver.io/ 사이트 접속 DBeaver Community 다운로드 및 설치</p>
				<p>DBeaver 실행 후 연결 설정</p>
				<p>Connection Type을 TNS로 변경 TNS names path 부분을 네트워크 파일(tnsnames.ora)이 존재하는 경로 입력</p>
				<p>Network Alias 선택 후 system 패스워드 입력 후 하단 Test Connection 선택</p>
				<p>Download driver files 창에서 다운로드</p>
				<p>SELECT con_id, name, open_mode FROM v$containers;</p>
				<p>정상적으로 XEPDB1이라는 PDB에 접속되었음</p>

			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>