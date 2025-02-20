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
									
									<h2>함수(Functions)</h2>
									<p>객체와 마찬가지로, 함수는 JavaScript를 이해하는데 핵심이 되는 컴포넌트입니다. 가장 기본적인 함수의 예시는 다음과 같습니다.</p>
									<pre class="code">
function add(x, y) {
  const total = x + y;
  return total;
}
									</pre>
									<p>JavaScript 함수는 0개 이상의 이름이 있는 매개변수를 가질 수 있습니다. 함수의 본체에는 원하는 만큼 구문을 작성할 수 있고 해당 함수에 지역적인 변수를 선언할 수 있습니다. return 문은 언제든지 값을 반환하고 함수를 종료할 수 있습니다. 반환 문이 없으면 (혹은 값이 없는 반환이 사용되면), JavaScript는 undefined을 반환합니다.</p>
									<p>매개변수로 지정된 것보다 많거나 적은 변수를 사용해서도 함수를 호출할 수 있습니다. 예상되는 매개변수를 전달하지 않고 함수를 호출하면 undefined로 설정됩니다. 예상보다 많은 매개변수를 전달하면 추가로 전달되는 매개변수를 무시합니다.</p>
								
									<pre class="code">
add(); // NaN
// add(undefined, undefined)와 동등합니다.

add(2, 3, 4); // 5
// 처음의 두 수가 더해집니다. 4는 무시됩니다.
									</pre>
									<p>사용할 수 있는 다른 여러 매개변수 구문이 있습니다. 예를 들어, rest 매개변수 구문을 사용하면 Python의 *args와 유사하게 호출자가 전달한 모든 추가 매개변수를 배열로 수집할 수 있습니다(JS는 언어 수준에서 명명된 매개변수가 없기 때문에, **kwargs가 없습니다).</p>
									
									<pre class="code">
function avg(...args) {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
}

avg(2, 3, 4, 5); // 3.5
									</pre>
									<p>위의 코드에서 args 변수는 함수에 전달된 모든 값을 보유합니다.</p>
									<p>나머지 매개변수(rest parameter)는 선언된 이후의 모든 인수를 저장하지만, 이전에는 저장하지 않습니다. 즉, function avg(firstValue, ...args)는 함수에 전달된 첫 번째 값을 firstValue 변수에 저장하고 나머지 인수는 args에 저장합니다.</p>
									<p>함수가 인수 목록을 허용하고 이미 배열을 보유하고 있는 경우, 함수 호출에서 전개 연산자 문법(spread syntax)을 사용하여 배열을 요소 목록으로 spread 할 수 있습니다. 예를 들어, avg(...numbers)</p>
									<p>JavaScript에는 명명된 매개 변수가 없다고 언급했습니다. 하지만 객체를 편리하게 하나로 합치고, 분해할 수 있는 구조 분해 할당을 사용하여 구현할 수 있습니다.</p>
									
									<pre class="code">
// 중괄호({ })에 유의하세요. 객체를 분해합니다.
function area({ width, height }) {
  return width * height;
}

// 여기서 중괄호({ })는 새로운 객체를 생성합니다.
console.log(area({ width: 2, height: 3 }));
									</pre>
									
									<p>기본값 매개변수 구문도 있는데, 생략된 매개변수(또는 undefined로 전달된 매개변수)가 기본값을 갖도록 허용합니다.</p>
									<pre class="code">
function avg(firstValue, secondValue, thirdValue = 0) {
  return (firstValue + secondValue + thirdValue) / 3;
}

avg(1, 2); // NaN 대신, 1입니다.
									</pre>
									
								</section>
<script>

function add(x, y){
	const total = x + y;
	return total;
}

console.log(add());

console.log(add(2, 3, 4));

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