<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

html{
	margin:0;
	padding:0;
}

body{
	font-size:10pt;
	margin:0;
	padding:0;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

function submit(lawdCd){
	var form = document.getElementById("dataInsertFrm");
	var insertDate = document.getElementById("insertDate");
	//alert(insertDate.value+' '+lawdCd);
	
	form.dealYmd.value=insertDate.value;
	form.lawdCd.value=lawdCd;
	
	form.submit();
}

function submitAll(lawdCd){
	
	var form = document.getElementById("dataInsertAllFrm");
	var insertDate = document.getElementById("insertDate");
	//alert(insertDate.value+' '+lawdCd);
	
	form.dealYmd.value=insertDate.value;
	form.lawdCd.value=lawdCd;
	
	form.submit();	
	
	$("#wrap").children().prop("disabled", true);
	$("#wrap").children().children().prop("disabled", true);
}

function search(){
	var insertDate = document.getElementById("insertDate");
	location.href = '/dataInsert?dealYmd=' + insertDate.value;
}


function prev_month(){
	var insertDate = document.getElementById("insertDate");
	//console.log('-----------');
	//console.log(insertDate.value.substr(0,4)+', '+parseInt(insertDate.value.substr(4,2)));
	
	let date = new Date(insertDate.value.substr(0,4), parseInt(insertDate.value.substr(4,2))-1, 1);
	//console.log(date.getFullYear() + ', ' + (date.getMonth()+1));
	date.setMonth(date.getMonth() - 1);
	
	let month = String(date.getMonth()+1);
	
	if(parseInt(month.length) == 1){
		month = '0' + month;
	}
	
	//console.log(date.getFullYear() + ', '+ month);
	
	insertDate.value = date.getFullYear() + month;
}

function next_month(){
	var insertDate = document.getElementById("insertDate");
	//console.log('-----------');
	//console.log(insertDate.value.substr(0,4)+', '+parseInt(insertDate.value.substr(4,2)));
	
	let date = new Date(insertDate.value.substr(0,4), parseInt(insertDate.value.substr(4,2))-1, 1);
	//console.log(date.getFullYear() + ', ' + (date.getMonth()+1));
	date.setMonth(date.getMonth() + 1);
	
	let month = String(date.getMonth()+1);
	
	if(parseInt(month.length) == 1){
		month = '0' + month;
	}
	
	//console.log(date.getFullYear() + ', '+ month);
	
	insertDate.value = date.getFullYear() + month;
}

</script>

</head>
<body>

<div id="wrap">

<input type="text" name="insertDate" id="insertDate" value="<c:out value="${cur_date}"  />" />
<input type="button" onclick="search();" value="조회" />
<input type="button" onclick="prev_month();" value="Prev" />
<input type="button" onclick="next_month();" value="Next" />
<br/>

<c:forEach items="${dongCdList }" var="dongCdList">

	<c:if test="${fn:substring(dongCdList.code, 2, 9) eq '0000000' or dongCdList.code eq '3611000000'}">
	
	<div style="font-weight:bold;"><c:out value="${dongCdList.name }" />[<c:out value="${fn:substring(dongCdList.code, 0, 5)}" />]
	
		<!-- 세종이 아닐경우 -->
		<c:if test="${dongCdList.code ne '3611000000' }"> 
			<input name="<c:out value="${fn:substring(dongCdList.code,0,2) }" />" id="<c:out value="${fn:substring(dongCdList.code,0,2) }" />" 
			type="button" value="삭제 후 저장" onclick="submitAll('<c:out value="${fn:substring(dongCdList.code,0,5) }" />');" />
		</c:if>
		
		 
		<!-- 세종일 경우 -->
		<c:if test="${dongCdList.code eq '3611000000' }">
			(<c:out value="${sejongCnt }"/>)
			<c:if test="${sejongCnt eq '0'}">
				<input type="button" value="저장" onclick="submit('<c:out value="${fn:substring(dongCdList.code,0,5) }" />');" />
			</c:if>
			<c:if test="${sejongCnt > 0}">
				<input name="<c:out value="${fn:substring(dongCdList.code,0,2) }" />" id="<c:out value="${fn:substring(dongCdList.code,0,2) }" />" 
					type="button" value="삭제 후 저장" onclick="submitAll('<c:out value="${fn:substring(dongCdList.code,0,5) }" />');" />
			</c:if>
		</c:if><br/>
		</div>
		
		<!-- 군구 출력 -->
		<c:set var="index" value="1" />
		<c:forEach items="${dongCdList2 }" var="dongCdList2" varStatus="status" >
			
			<c:if test="${fn:substring(dongCdList.code, 0, 2) eq fn:substring(dongCdList2.code, 0, 2) and dongCdList.code ne dongCdList2.code}">
				<c:set var="splitNm" value="${fn:split(dongCdList2.name, ' ')}" />
				<c:if test="${fn:length(splitNm) eq 2 }">
				<c:out value="${fn:split(dongCdList2.name, ' ')[1] }" />
				</c:if>
				<c:if test="${fn:length(splitNm) eq 3 }">
				<c:out value="${fn:split(dongCdList2.name, ' ')[1] }" /> <c:out value="${fn:split(dongCdList2.name, ' ')[2] }" />
				</c:if>
				[<c:out value="${fn:substring(dongCdList2.code,0,5) }" />]
				(<c:out value="${dongCdList2.cnt }" />)
				<c:if test="${dongCdList2.cnt eq -1 }">
				<script>$("#"+${fn:substring(dongCdList2.code,0,2)}).hide();</script>
				</c:if>
				<c:if test="${dongCdList2.cnt eq '0'}">
				<input type="button" value="저장" onclick="submit('<c:out value="${fn:substring(dongCdList2.code,0,5) }" />');" />
				</c:if>,
				
			</c:if>
			<c:set var="index" value="${index + 1 }" />
		</c:forEach>
		<br/><br/>
		
		
	</c:if>
	
</c:forEach>


<form name="dataInsertFrm" id="dataInsertFrm" action="/dataInsert" method="post" >
<input type="hidden" name="dealYmd" id="dealYmd" />
<input type="hidden" name="lawdCd" id="lawdCd" />
</form>

<form name="dataInsertAllFrm" id="dataInsertAllFrm" action="/dataInsertAll" method="post" >
<input type="hidden" name="dealYmd" id="dealYmd" />
<input type="hidden" name="lawdCd" id="lawdCd" />
</form>

</div>

</body>
</html>