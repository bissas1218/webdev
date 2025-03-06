<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<header id="header">
	<a href="/" class="logo">Minimaxing</a>
	<nav id="nav">
		<a href="/study/index.jsp" <c:if test="${param.menu eq 'study'}">class="current-page-item"</c:if>>Study</a>
		<a href="/openApi/index.jsp" <c:if test="${param.menu eq 'openapi'}">class="current-page-item"</c:if>>Open API</a>
		<a href="/twocolumn1.html">Two Column #1</a>
		<a href="/twocolumn2.html">Two Column #2</a>
		<a href="/onecolumn.html">One Column</a>
		<a href="/threecolumn.html">Three Column</a>
	</nav>
</header>