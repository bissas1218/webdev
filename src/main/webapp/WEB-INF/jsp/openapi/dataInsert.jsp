<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function submit(lawdCd){
	var form = document.getElementById("dataInsertFrm");
	var insertDate = document.getElementById("insertDate");
	//alert(insertDate.value+' '+lawdCd);
	
	form.dealYmd.value=insertDate.value;
	form.lawdCd.value=lawdCd;
	
	form.submit();
}

function search(){
	var insertDate = document.getElementById("insertDate");
	location.href = '/dataInsert?dealYmd=' + insertDate.value;
}

/*
let date = new Date(2019, 0, 1);
document.write('기준일자 : ' + date + '<br>');

date.setMonth(date.getMonth() + 1);
document.write('1달 후 : ' + date + '<br>');

date = new Date(2019, 0, 1);
date.setMonth(date.getMonth() - 1);
document.write('1달 전 : ' + date + '<br>');
*/

function prev_month(){
	var insertDate = document.getElementById("insertDate");
	console.log('-----------');
	console.log(insertDate.value.substr(0,4)+', '+parseInt(insertDate.value.substr(4,2)));
	
	let date = new Date(insertDate.value.substr(0,4), parseInt(insertDate.value.substr(4,2))-1, 1);
	console.log(date.getFullYear() + ', ' + (date.getMonth()+1));
	date.setMonth(date.getMonth() - 1);
	
	let month = String(date.getMonth()+1);
	
	if(parseInt(month.length) == 1){
		month = '0' + month;
	}
	
	console.log(date.getFullYear() + ', '+ month);
	
	insertDate.value = date.getFullYear() + month;
}

function next_month(){
	var insertDate = document.getElementById("insertDate");
	console.log('-----------');
	console.log(insertDate.value.substr(0,4)+', '+parseInt(insertDate.value.substr(4,2)));
	
	let date = new Date(insertDate.value.substr(0,4), parseInt(insertDate.value.substr(4,2))-1, 1);
	console.log(date.getFullYear() + ', ' + (date.getMonth()+1));
	date.setMonth(date.getMonth() + 1);
	
	let month = String(date.getMonth()+1);
	
	if(parseInt(month.length) == 1){
		month = '0' + month;
	}
	
	console.log(date.getFullYear() + ', '+ month);
	
	insertDate.value = date.getFullYear() + month;
}

</script>

</head>
<body>

<input type="text" name="insertDate" id="insertDate" value="<c:out value="${cur_date}"  />" />
<input type="button" onclick="search();" value="조회" />
<input type="button" onclick="prev_month();" value="Prev" />
<input type="button" onclick="next_month();" value="Next" />
<br/>

대구광역시<br>
군위군[27720](<c:out value="${a27720}" />)
<c:if test="${a27720 eq '0'}">
<input type="button" value="저장" onclick="submit('27720');" />
</c:if>,
남구[27200](<c:out value="${a27200}" />)
<c:if test="${a27200 eq '0'}">
<input type="button" value="저장" onclick="submit('27200');" />
</c:if>,
달서구[27290](<c:out value="${a27290}" />)
<c:if test="${a27290 eq '0'}">
<input type="button" value="저장" onclick="submit('27290');" />
</c:if>,
달성군[27710](<c:out value="${a27710}" />)
<c:if test="${a27710 eq '0'}">
<input type="button" value="저장" onclick="submit('27710');" />
</c:if>,
동구[27140](<c:out value="${a27140}" />)
<c:if test="${a27140 eq '0'}">
<input type="button" value="저장" onclick="submit('27140');" />
</c:if>,
북구[27230](<c:out value="${a27230}" />)
<c:if test="${a27230 eq '0'}">
<input type="button" value="저장" onclick="submit('27230');" />
</c:if>,
서구[27170](<c:out value="${a27170}" />)
<c:if test="${a27170 eq '0'}">
<input type="button" value="저장" onclick="submit('27170');" />
</c:if>,
수성구[27260](<c:out value="${a27260}" />)
<c:if test="${a27260 eq '0'}">
<input type="button" value="저장" onclick="submit('27260');" />
</c:if>,
중구[27110](<c:out value="${a27110}" />)
<c:if test="${a27110 eq '0'}">
<input type="button" value="저장" onclick="submit('27110');" />
</c:if>
<br/><br/>

대전광역시<br>
서구[30170](<c:out value="${a30170}" />)
<c:if test="${a30170 eq '0'}">
<input type="button" value="저장" onclick="submit('30170');" />
</c:if>,
유성구[30200](<c:out value="${a30200}" />) 
<c:if test="${a30200 eq '0'}">
<input type="button" value="저장" onclick="submit('30200');" />
</c:if>,
대덕구[30230](<c:out value="${a30230}" />)
<c:if test="${a30230 eq '0'}">
<input type="button" value="저장" onclick="submit('30230');" />
</c:if>,
중구[30140](<c:out value="${a30140}" />)
<c:if test="${a30140 eq '0'}">
<input type="button" value="저장" onclick="submit('30140');" />
</c:if>,
동구[30110](<c:out value="${a30110}" />)
<c:if test="${a30110 eq '0'}">
<input type="button" value="저장" onclick="submit('30110');" />
</c:if>
<br/>

<form name="dataInsertFrm" id="dataInsertFrm" action="/dataInsert" method="post" >
<input type="hidden" name="dealYmd" id="dealYmd" />
<input type="hidden" name="lawdCd" id="lawdCd" />
</form>
</body>
</html>