<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>아파트 실거래가 데이터삽입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	
	
<script type="text/javascript">

function submit(lawdCd){
	var form = document.getElementById("aptDataInsertFrm");
	var insertDate = document.getElementById("insertDate");
	//alert(insertDate.value+' '+lawdCd);
	
	form.dealYmd.value=insertDate.value;
	form.lawdCd.value=lawdCd;
	
	form.submit();
	
	$("#wrap").children().prop("disabled", true);
	$("#wrap").children().children().prop("disabled", true);
}

function submitAll(lawdCd){
	
	var form = document.getElementById("aptDataInsertAllFrm");
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
	location.href = '/aptDataInsert?dealYmd=' + insertDate.value;
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
	
	
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<jsp:include page="/header-menu.jsp">
									<jsp:param name="menu" value="openapi" />
								</jsp:include>

							</div>
						</div>
					</div>
				</div>

			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-12">

								<section>
									<h2>아파트 실거래가 데이터삽입</h2>
									
									<div id="wrap">

<input type="text" name="insertDate" id="insertDate" value="<c:out value="${cur_date}"  />" />
<input type="button" onclick="search();" value="조회" />
<input type="button" onclick="prev_month();" value="Prev" />
<input type="button" onclick="next_month();" value="Next" />
<br/>

<c:forEach items="${dongCdList }" var="dongCdList">

	<c:if test="${fn:substring(dongCdList.code, 2, 9) eq '0000000' or dongCdList.code eq '3611000000'}">
	
	<div style="font-weight:bold;" id="sidoNm"><c:out value="${dongCdList.name }" />[<c:out value="${fn:substring(dongCdList.code, 0, 5)}" />]
	
	
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
			
				<c:if test="${dongCdList2.cnt ne -1}">
				
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
					<script> $("#"+${fn:substring(dongCdList2.code,0,2)}).hide(); </script>
					</c:if>
					<c:if test="${dongCdList2.cnt eq '0'}">
					<input type="button" value="저장" onclick="submit('<c:out value="${fn:substring(dongCdList2.code,0,5) }" />');" />
					</c:if>,
				
				</c:if>
			
			</c:if>
			<c:set var="index" value="${index + 1 }" />
		</c:forEach>
		<br/><br/>
		
		
	</c:if>
	
</c:forEach>


<form name="aptDataInsertFrm" id="aptDataInsertFrm" action="/aptDataInsert" method="post" >
<input type="hidden" name="dealYmd" id="dealYmd" />
<input type="hidden" name="lawdCd" id="lawdCd" />
</form>

<form name="aptDataInsertAllFrm" id="aptDataInsertAllFrm" action="/aptDataInsertAll" method="post" >
<input type="hidden" name="dealYmd" id="dealYmd" />
<input type="hidden" name="lawdCd" id="lawdCd" />
</form>

</div>

								</section>

							</div>
						</div>
					</div>
				</div>

			<!-- Footer -->
				<div id="footer-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">

								<section>
									<h2>How about a truckload of links?</h2>
									<div>
										<div class="row">
											<div class="col-3 col-6-medium col-12-small">
												<ul class="link-list">
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Suspendisse varius ipsum</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
												</ul>
											</div>
											<div class="col-3 col-6-medium col-12-small">
												<ul class="link-list">
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Vitae magna sed dolore</a></li>
												</ul>
											</div>
											<div class="col-3 col-6-medium col-12-small">
												<ul class="link-list">
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Suspendisse varius ipsum</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
												</ul>
											</div>
											<div class="col-3 col-6-medium col-12-small">
												<ul class="link-list">
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Vitae magna sed dolore</a></li>
												</ul>
											</div>
										</div>
									</div>
								</section>

							</div>
							<div class="col-4 col-12-medium">

								<section>
									<h2>Something of interest</h2>
									<p>Duis neque nisi, dapibus sed mattis quis, rutrum accumsan sed.
									Suspendisse eu varius nibh. Suspendisse vitae magna eget odio amet
									mollis justo facilisis quis. Sed sagittis mauris amet tellus gravida
									lorem ipsum dolor sit blandit.</p>
									<footer class="controls">
										<a href="#" class="button">Oh, please continue ....</a>
									</footer>
								</section>

							</div>
						</div>
						<div class="row">
							<div class="col-12">

								<div id="copyright">
									&copy; Untitled. All rights reserved. | Design: <a href="http://html5up.net">HTML5 UP</a>
								</div>

							</div>
						</div>
					</div>
				</div>

		</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	</body>
</html>