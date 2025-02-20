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
									
									<h2>연산자</h2>
									<p>JavaScript의 산술 연산자로는 +, -, *, /, %(나머지 연산자), **(지수 연산자)가 있습니다. 값은 = 연산자로 할당할 수 있고, += 와 -=와 같은 복합 할당 연산자를 통해서도 할당할 수 있습니다. 이렇게 쓰인 연산자는 x = x 연산자 y와 같은 결과를 나타냅니다.</p>
									<pre class="code">
x += 5;
x = x + 5;
									</pre>
									
									<p>++ 와 -- 를 각각 증가와 감소에 사용할 수 있습니다. 이들은 또한 전처리 또는 후처리 연산자로 사용될 수 있습니다.</p>
									<p>+ 연산자는 문자열을 연결합니다.</p>
									
									<pre class="code">
"hello" + " world"; // "hello world"
									</pre>
									<p>숫자(또는 다른 값)에 문자열을 추가하면 모든 것이 먼저 문자열로 변환됩니다. 이것은 당신을 넘어뜨릴 수 있습니다.</p>
									<pre class="code">
"3" + 4 + 5; // "345"
3 + 4 + "5"; // "75"
									</pre>
									
									<p>무언가에 빈 문자열을 추가하는 것은 해당 값을 문자열로 바꾸는 요령입니다.</p>
									<p>JavaScript의 비교는 <, >, <= 및 >= 를 사용해 만들 수 있고, 이 연산자들은 문자열과 수 양쪽 모두에서 동작합니다. 동등성을 위해 이중 등호 연산자는 다른 타입을 제공하는 경우 타입 강제 변환을 수행하며, 때로는 흥미로운 결과를 보여줍니다. 반면에, 삼중 등호 연산자는 타입 강제 변환을 시도하지 않으며 일반적으로 선호하는 방법입니다.</p>

									<pre class="code">
123 == "123"; // true
1 == true; // true

123 === "123"; // false
1 === true; // false
									</pre>		
									<p>이중 등호와 삼중 등호에는 != 와 !== 같은 부등호도 있습니다.</p>
									<p>JavaScript에는 비트 연산자 및 논리 연산자도 있습니다. 특히 논리 연산자는 불리언 값으로만 작동하지 않고 값의 "진실성"에 따라 작동합니다.</p>
									
									<pre class="code">
const a = 0 && "Hello"; // 0은 "falsy" 이라서, 0입니다.
const b = "Hello" || "world"; // "Hello"와 "world" 모두 "truthy"이라서, "Hello" 입니다.
									</pre>
									<p>&& 및 || 연산자는 단락 논리를 사용합니다. 즉, 두 번째 피연산자를 실행할지 여부는 첫 번째 피연산자에 따라 결정됩니다. 이는 속성에 접근하기 전에 null 객체를 확인하는 데 유용합니다.</p>
									
									<pre class="code">
const name = o && o.getName();
									</pre>
									<p>또는 캐싱 값의 경우(거짓 값이 유효하지 않은 경우)</p>
									
									<pre class="code">
const name = cachedName || (cachedName = getName());
									</pre>
									<p>전체 연산자 목록은 가이드 페이지 또는 참조 섹션을 참조하세요. 특히 연산자 우선순위에 관심이 있을 수도 있습니다.</p>
									
								</section>
<script>


</script>
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