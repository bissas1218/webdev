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
							<div class="col-8 col-12-medium">

								<section>
									
									<h2>State and Lifecycle</h2>
									<p>이 페이지는 React 컴포넌트 안의 state와 생명주기에 대한 개념을 소개해 줍니다. 자세한 컴포넌트 API 레퍼런스는 여기에서 찾을 수 있습니다.</p>
									<p>이전 섹션에서 다뤄본 째깍거리는 시계 예시를 다시 살펴보겠습니다. 엘리먼트 렌더링에서는 UI를 업데이트하는 한 가지 방법만 배웠으며, 렌더링 된 출력값을 변경하기 위해 root.render()를 호출했습니다.</p>
									<pre class="code">
const root = ReactDOM.createRoot(document.getElementById('root'));
  
function tick() {
  const element = (
    &lt;div&gt;
      &lt;h1&gt;Hello, world!&lt;/h1&gt;
      &lt;h2&gt;It is {new Date().toLocaleTimeString()}.&lt;/h2&gt;
    &lt;/div&gt;
  );
  root.render(element);
}

setInterval(tick, 1000);									
									</pre>
								</section>

							</div>
							<div class="col-4 col-12-medium">

								<jsp:include page="/study/react/right.jsp"></jsp:include>
								
								<section>
									<h2>Who are you guys?</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/images/pic2.jpg" alt="" class="left" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="/images/pic1.jpg" alt="" class="left" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
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

	</body>
</html>