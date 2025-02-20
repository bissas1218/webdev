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
									
									<h2>데이터 타입</h2>
									<p>모든 언어의 구성 요소인 타입을 살펴보는 것으로 시작하겠습니다. JavaScript 프로그램은 값을 조작하며, 이러한 값은 모두 타입에 속합니다. JavaScript는 7가지 기본 유형을 제공합니다.</p>
									<ul>
										<li>Number: 매우 큰 정수를 제외한 모든 숫자값(정수 및 부동 소수점)에 사용됩니다.</li>
										<li>BigInt: 임의의 큰 정수에 사용됩니다.</li>
										<li>String: 텍스트를 저장하는 데 사용됩니다.</li>
										<li>Boolean: true 및 false, 일반적으로 조건 논리에 사용됩니다.</li>
										<li>Symbol: 충돌하지 않는 고유 식별자를 만드는 데 사용됩니다.</li>
										<li>Undefined: 변수에 값이 할당되지 않았음을 나타냅니다.</li>
										<li>Null: 의도적으로 값이 없음을 나타냅니다.</li>
									</ul>
									
									<p>다른 모든 것은 객체라고 합니다. 일반적인 객체 타입은 다음과 같습니다.</p>
									<ul>
										<li>Function</li>
										<li>Array</li>
										<li>Date</li>
										<li>RegExp</li>
										<li>Error</li>
									</ul>
									<p>함수는 JavaScript의 특별한 데이터 구조가 아닙니다. 호출할 수 있는 특별한 타입의 객체일 뿐입니다.</p>
									
									<h2>수 (Numbers)</h2>
									<p>JavaScript에는 Number와 BigInt라는 두 가지 내장 숫자 타입이 있습니다.</p>
									<p>숫자 타입은 이중정밀도 64비트 부동소수점 형식(IEEE 754)의 값이며, 즉, -(253 − 1)와 253 − 1사이에서 정수를 손실 없이 안전하게 표현할 수 있습니다. 정밀도 및 부동 소수점 숫자는 최대 1.79 × 10308까지 저장할 수 있습니다. 숫자 내에서 JavaScript는 부동 소수점 숫자와 정수를 구분하지 않습니다.</p>
									
									<pre class="code">
console.log(3 / 2); // 1.5, not 1
									</pre>
									<p>"명백한 정수"는 사실 "암묵적으로 float(실수)"입니다. IEEE 754 인코딩으로 인해 때때로 부동 소수점 산술연산이 정확하지 않을 수 있습니다.</p>
									
									<pre class="code">
console.log(0.1 + 0.2); // 0.30000000000000004
									</pre>
									
									<p>비트 연산과 같이, 정수가 필요한 연산의 경우, 숫자가 32비트 정수로 변환됩니다.</p>
									<p>Number 리터럴(literals)에는 기본(2진수, 8진수, 10진수 또는 16진수) 또는 지수 접미사를 나타내는 접두사를 가질 수도 있습니다.</p>

								</section>

							</div>
							<div class="col-2">

								<jsp:include page="/study/javascript/right.jsp"></jsp:include>
								

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