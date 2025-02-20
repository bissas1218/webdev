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
									
									<h2>변수 (Variables)</h2>
									<p>JavaScript의 변수는 let, const 및 var의 세 가지 키워드 중 하나를 사용하여 선언됩니다.</p>
									<p>let을 사용하면 블록 레벨 변수를 선언할 수 있습니다. 선언된 변수는 "변수가 선언된 블록"에서 사용할 수 있습니다.</p>
									
									<pre class="code">
let a;
let name = "Simon";

// myLetVariable는 여기에서 보이지 *않습니다*

for (let myLetVariable = 0; myLetVariable < 5; myLetVariable++) {
  // myLetVariable는 여기에서만 사용할 수 있습니다
}

// myLetVariable는 여기에서 보이지 *않습니다*
									</pre>
									
									<p>const는 값이 변경되지 않을 변수를 선언할 수 있게 합니다. 변수는 "변수가 선언된 블록"에서 사용할 수 있습니다.</p>
									<pre class="code">
const Pi = 3.14; // 변수 Pi 설정
console.log(Pi); // 3.14
									</pre>
									<p>const로 선언된 변수는 재할당할 수 없습니다.</p>
									<pre class="code">
const Pi = 3.14;
Pi = 1; // 상수 변수를 변경할 수 없기 때문에 오류가 발생합니다.
									</pre>
									<p>const 선언은 재할당만 방지합니다. 객체인 경우 변수 값의 변형을 방지하지 않습니다.</p>
									
									<pre class="code">
const obj = {};
obj.a = 1; // 에러 없음
console.log(obj); // { a: 1 }
									</pre>
									<p>var 선언은 경악할 만한 동작(예: 블록 범위가 아님)을 가질 수 있으며, 최신 JavaScript 코드에서는 권장되지 않습니다.</p>
									<p>값을 할당하지 않고 변수를 선언하면, 그 값은 undefined입니다. 어차피 나중에 변경할 수 없기 때문에, 초기화해주는 것없이 const 변수를 선언할 수 없습니다.</p>
									<p>let 및 const 선언 변수는 여전히 정의된 전체 범위를 차지하며, 실제 선언 줄 이전의 일시적 사각지대(temporal dead zone)으로 알려진 영역에 있습니다. 여기에는 다른 언어에서는 발생하지 않는 변수 섀도잉과 흥미로운 상호 작용이 있습니다.</p>
									
									<pre class="code">
function foo(x, condition) {
  if (condition) {
    console.log(x);
    const x = 2;
    console.log(x);
  }
}

foo(1, true);
									</pre>				
									<p>대부분의 다른 언어에서, const x = 2 행 이전에 x가 여전히 상위 범위의 매개변수 x를 참조해야 하기 때문에 "1"과 "2"를 기록합니다. JavaScript에서는 각 선언이 전체 범위를 차지하기 때문에 첫 번째 console.log에 "초기화 전에 'x'에 접근할 수 없습니다." 라는 오류가 발생합니다. 자세한 내용은 let 페이지를 참조하세요.</p>
									<p>JavaScript는 동적 타입 언어입니다. 타입 (이전 섹션에서 설명한 대로)은 변수가 아닌 값과만 연결됩니다. let 선언 변수의 경우 항상 재할당을 통해 타입을 변경할 수 있습니다.</p>
												
									<pre class="code">
let a = 1;
a = "foo";
									</pre>
											
								</section>
<script>
function foo(x, condition) {
	  if (condition) {
	   // console.log(x);
	    const x = 2;
	    console.log(x);
	  }
	}

	foo(1, true);

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