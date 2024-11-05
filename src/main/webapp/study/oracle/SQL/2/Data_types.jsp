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
	<a href="/">Home</a> > <a href="/study">Study</a> > <a href="/study/oracle/index.jsp">Oracle</a> > Oracle SQL의 2가지 기본요소 > 데이터 유형
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/oracle/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">데이터 유형</p>
				<p>오라클 데이터베이스에 의해 조작되는 각 값에는 데이터 유형이 있습니다. 값의 데이터 형식은 고정된 속성 집합을 값과 연결합니다. 이러한 속성으로 인해 오라클은 한 데이터 유형의 값을 다른 데이터 유형의 값과
				다르게 처리합니다. 예를 들어, 데이터 형식의 값은 추가할 수 있지만 데이터 형식의 값은 추가할 수 없습니다. NUMBERRAW 
				</p>
				
				<p>
				테이블 또는 클러스터를 만들 때 각 열에 대해 데이터 형식을 지정해야 합니다. 
				프로시저 또는 저장 함수를 만들 때는 각 인수에 대해 데이터 형식을 지정해야 합니다. 이러한 데이터 형식은 각 열이 포함할 수 있거나 각 인수가 가질 수 있는 값의 도메인을 정의합니다. 예를 들어, 열은 2월 29일(윤년 제외) 
				값이나 값 2 또는 'SHOE'를 사용할 수 없습니다. 이후에 열에 배치되는 각 값은 열의 데이터 형식을 가정합니다. 예를 들어, 열에 삽입하는 경우 Oracle은 문자열이 유효한 날짜로 변환되는지 확인한 후 문자열을 값으로 처리합니다. 
				DATE'01-JAN-98'DATE'01-JAN-98'DATE </p>
				
				<p>Oracle Database는 다양한 내장 데이터 유형과 데이터 유형으로 사용할 수 있는 사용자 정의 유형에 대한 여러 범주를 제공합니다. Oracle 데이터 형식의 구문은 다음 다이어그램에 나와 있습니다. 
				이 섹션의 텍스트는 다음 섹션으로 나뉩니다.</p>
				
				<p id="sub_title">Oracle 기본 제공 데이터 형식</p>
				<p>Built-In Data Type Summary(내장 데이터 유형 요약) 테이블에는 사용 가능한 내장 데이터 유형이 나열되어 있습니다. Oracle Database는 코드를 사용하여 내부적으로 데이터 유형을 식별합니다. 
				이 숫자는 Built-In Data Type Summary(기본 제공 데이터 유형 요약) 테이블의 Code(코드) 열에 있는 숫자입니다. 함수를 사용하여 표의 코드를 확인할 수 있습니다. DUMP</p>

				<p>내장 데이터 유형 요약 테이블에 나열된 내장 데이터 유형 외에도 Oracle Database는 함수를 통해 볼 수 있는 많은 데이터 유형을 내부적으로 사용합니다. DUMP</p>
				
				<table class="table_res">
				<caption>표 2-1 내장 데이터 유형 요약</caption>
				<thead>
				<tr>
					<th width="10%">코드</th><th width="30%">데이터 유형</th><th width="60%">묘사</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td>VARCHAR2(크기 [ | BYTECHAR])</td>
					<td><p>최대 길이, 크기, 바이트 또는 문자를 갖는 가변 길이 문자열입니다. 에 대한 크기를 지정해야 합니다. 최소 크기는 1바이트 또는 1자입니다. 최대 크기는 다음과 같습니다. VARCHAR2</p>

						<p>● 32767바이트 또는 문자인 경우 MAX_STRING_SIZE = EXTENDED</p>
						<p>● 4000바이트 또는 문자인 경우 MAX_STRING_SIZE = STANDARD</p>

						<p>초기화 매개변수에 대한 자세한 정보는 Extended Data Types를 참조하십시오. MAX_STRING_SIZE</p>

						<p>BYTE 열이 바이트 길이 의미 체계를 갖는다는 것을 나타냅니다. 열에 문자 의미 체계가 있음을 나타냅니다. CHAR</p>
					</td>
				</tr>
				<tr>
					<td>1</td>
					<td>NVARCHAR2(size)</td>
					<td>
						<p>최대 길이 크기 문자가 있는 가변 길이 유니코드 문자열입니다. 에 대한 크기를 지정해야 합니다. 바이트 수는 인코딩의 경우 최대 2배, 인코딩의 경우 3배까지 가능합니다. 최대 크기는 국가 문자 집합 정의에 따라 결정되며 상한은 다음과 같습니다. NVARCHAR2AL16UTF16UTF8</p>

						<p>● 32767바이트 MAX_STRING_SIZE = EXTENDED</p>
						<p>● 4000바이트인 경우 MAX_STRING_SIZE = STANDARD</p>

						<p>초기화 매개변수에 대한 자세한 정보는 Extended Data Types를 참조하십시오. MAX_STRING_SIZE</p>
					</td>
				</tr>
				</tbody>
				</table>

			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>