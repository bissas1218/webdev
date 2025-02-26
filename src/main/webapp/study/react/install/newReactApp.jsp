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
							<div class="col-9 col-12-medium">

								<section>
									<h2>React 설치하기</h2>
									<p>React는 사용자 인터페이스(UI)를 만들 때 많이 사용되는 JavaScript 라이브러리입니다. React를 처음 설치하고, 간단한 컴포넌트를 만들어보자.</p>
									
									<h2>Node.js 설치</h2>
									<p>React를 사용하기 위해서는 먼저 Node.js를 설치해야 합니다. Node.js는 Javascript런타임으로, React개발환경을 구축할 때 필수적으로 필요합니다.</p>
									<p>https://nodejs.org/en/download/ 접속하여 node-v22.14.0-x64.msi 파일 다운로드 및 설치</p>
									<p>설치가 완료되면 터미널을 열고 다음 명령어로 Node.js와 NPM(Node Package Manager)이 잘 설치되었는지 확인할 수 있습니다.</p>
									
									<pre class="code">
C:\Users\PC>node -v
v22.14.0

C:\Users\PC>npm -v
10.9.2
									</pre>
									
									<h2>React프로젝트 생성</h2>
									<p>이제 React프로젝트를 쉽게 시작할 수 있는 Create React App 도구를 사용해 보겠습니다. 터미널에서 아래 명령어를 실행해 React 애플리케이션을 만들어 주세요.</p>
									
									<pre class="code">
npx create-react-app 앱이름									
									</pre>
									<p>npx: Node.js와 함께 설치된 명령어 실행 도구입니다.</p>
									
									<h2>프로젝트 실행</h2>
									<p>프로젝트 생성이 완료되면, 해당 디렉터리로 이동해 React개발 서버를 실행합니다.</p>
									<pre class="code">
cd 앱이름
npm start									
									</pre>
									<p>reportWebVitals.js 에러가 발생할 경우 npm install web-vitals실행</p>
									
									<p>브라우저에 http://localhost:3000 을 열면 기본적으로 설정된 React애플리케이션이 실행되는 것을 확인할 수 있습니다.</p>

							</div>
							<div class="col-3 col-12-medium">

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