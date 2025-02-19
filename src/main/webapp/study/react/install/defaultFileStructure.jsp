<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Two Column 1 - Minimaxing by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<jsp:include page="/header-menu.jsp">
									<jsp:param name="menu" value="study" />
								</jsp:include>

							</div>
						</div>
					</div>
				</div>

			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-10 col-12-medium">

								<section>
									
									<h2>기본 파일 구조</h2>
									<p>프로젝트 생성 후 기본 파일 구조는 다음과 같습니다.</p>
									<p>● src/App.js: 주요 React컴포넌트를 작성하고 수정하는 파일입니다.</p>
									<p>● src/index.js: 애플리케이션의 진입점 파일로, 여기서 App.js를 가져와 브라우저에 렌터링합니다.</p>
				
									<h2>React컴포넌트 이해하기</h2>	
									<p>React의 핵심은 컴포넌트입니다. 컴포넌트는 독립적인 UI조각을 의미하며, 이러한 컴포넌트를 조합해 복잡한 UI를 구성할 수 있습니다.</p>
				
									<h2>기본 함수형 컴포넌트 작성</h2>
									<p>React 컴포넌트는 함수형 컴포넌트와 클래스형 컴포넌트로 나눌 수 있지만, 최근에는 함수형 컴포넌트가 주로 사용됩니다. 기본적인 함수형 컴포넌트를 작성해 보겠습니다.</p>
									<p>src/App.js 파일을 열고 아래 코드로 변경합니다.</p>
									<pre class="code">
import React from 'react';

function App() {
  return (
    &lt;div&gt;
	&lt;h1&gt;Hello, React!&lt;/h1&gt;
    &lt;/div&gt;
  );
}

export default App;
									</pre>
				
									<p>이 코드는 div요소 안에 h1 태그로 "Hello, React!"라는 문구를 출력하는 간단한 컴포넌트입니다.</p>
				
									<h2>JSX문법</h2>
									<p>React에서 사용하는 특별한 문법인 JSX는 JavaScript 코드 안에서 HTML과 유사한 코드를 작성할 수 있게 도와줍니다. JSX의 기본 규칙은 다음과 같습니다.</p>
									<p>● 닫는 태그: 모든 태그는 반드시 닫아야 합니다. 예를 들어 &lt;img/&gt;, &lt;br/&gt;와 같은 자주 쓰이는 태그도 반드시 닫아야 합니다.</p>
									<p>● 하나의 부모 요소: JSX 코드에서는 반드시 하나의 부모 요소로 모든 내용을 감싸야 합니다. 여러 요소가 있을 경우 &lt;div&gt;로 감싸는 것이 일반적입니다.</p>
				
									<h2>다중컴포넌트 사용</h2>
									<p>React에서는 여러 컴포넌트를 조합해 더 큰 UI를 만들 수 있습니다. 이번에는 간단한 Header 컴포넌트를 추가해 보겠습니다.</p>
									<p>src/Header.js 파일을 생성한 뒤, 아래처럼 작성합니다.</p>
									<pre class="code">
import React from 'react';

function Header() {
	return (
		&lt;header&gt;
			&lt;h2&gt;This is the Header&lt;/h2&gt;
		&lt;/header&gt;
	)
}
export default Header;
									</pre>
			
									<p>이제 App.js에서 Header 컴포넌트를 가져와 함께 사용해 보겠습니다.</p>
									<pre class="code">
import React from 'react';
import Header from './Header';

function App() {
	return (
		&lt;div&gt;
			&lt;Header/&gt;
			&lt;h1&gt;Hello, React!&lt;/h1&gt;
		&lt;/div&gt;
	)
}
export default Header;									
									</pre>
				
									<p>위 코드를 실행하면, Header와 App 컴포넌트가 함께 화면에 렌더링됩니다.</p>
								</section>

							</div>
							<div class="col-2 col-12-medium">

								<jsp:include page="/study/react/right.jsp"></jsp:include>

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

	</body>
</html>