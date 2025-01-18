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

</script>

</head>
<body>

<input type="text" name="insertDate" id="insertDate" value="<c:out value="${cur_date}"  />" />
<input type="button" onclick="search();" value="조회" />
<br/>

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