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
									
									<h2>제어구조</h2>
									<p>JavaScript는 C 계열의 다른 언어들과 비슷한 제어 구조를 가지고 있습니다. 조건문은 if 및 else로 지원되며, 함께 연결할 수 있습니다.</p>
									
									<pre class="code">
let name = "kittens";
if (name === "puppies") {
  name += " woof";
} else if (name === "kittens") {
  name += " meow";
} else {
  name += "!";
}
name === "kittens meow";
									</pre>
									
									<p>JavaScript에는 elif가 없으며, else if는 단일 if 문으로 구성된 else 분기에 불과합니다.</p>
									<p>JavaScript는 while 반복문과 do...while 반복문도 사용할 수 있습니다. 전자는 기본 반복에 유용하게 사용할 수 있고, 후자는 반복문을 적어도 한번 이상은 실행하고 싶을 때 사용할 수 있습니다.</p>
									
									<pre class="code">
while (true) {
  // 무한루프!
}

let input;
do {
  input = get_input();
} while (inputIsNotValid(input));
									</pre>
									<p>JavaScript의 for 반복문은 C와 Java의 반복문과 같습니다. 말하자면, 반복문에 필요한 제어 정보를 한 줄에 표현할 수 있다는 이야기지요.</p>
									
									<pre class="code">
for (let i = 0; i < 5; i++) {
  // 내부 동작을 5번 반복합니다
}
									</pre>
									<p>JavaScript에는 두개의 중요한 for 반복문 또한 포함됩니다. iterables(특히 배열)를 반복하는 for...of, 객체의 모든 enumerable 속성을 방문하는 for...in입니다.</p>
									
									<pre class="code">
for (const value of array) {
  // value로 작업 수행합니다.
}

for (const property in object) {
  // 객체 프로퍼티로 작업 수행합니다.
}
									</pre>
									<p>switch 문은 동등 검사를 기반으로 여러 분기에 사용할 수 있습니다.</p>
									
									<pre class="code">
switch (action) {
  case "draw":
    drawIt();
    break;
  case "eat":
    eatIt();
    break;
  default:
    doNothing();
}
									</pre>
									
									<p>C와 유사하게, case 절은 labels과 개념적으로 동일하므로, break 문을 추가하지 않으면 실행이 다음 단계로 "넘어갑니다". 그러나 이들은 실제로 점프 테이블이 아닙니다. 문자열이나 숫자 리터럴 뿐만 아니라, 모든 표현식이 case절의 일부가 될 수 있으며, 하나가 일치하는 값과 같을 때까지 하나씩 평가됩니다. === 연산자를 사용하여 둘 사이에서 비교가 이루어집니다.</p>
									<p>Rust와 같은 일부 언어와 달리, 제어 흐름 구조는 JavaScript의 문입니다. 즉, const a = if (x) { 1 } else { 2 }와 같이 변수에 할당할 수 없습니다.</p>
									<p>JavaScript 오류는 try...catch문을 사용하여 처리됩니다.</p>
									
									<pre class="code">
try {
  buildMySite("./website");
} catch (e) {
  console.error("Building site failed:", e);
}
									</pre>
									<p>에러(Error)는 throw 문을 사용하여 발생할 수 있습니다. 많은 기본 제공 작업도 에러가 발생할 수 있습니다.</p>
									<pre class="code">
function buildMySite(siteDirectory) {
  if (!pathExists(siteDirectory)) {
    throw new Error("Site directory does not exist");
  }
}
									</pre>
									<p>일반적으로, 방금 잡은 오류의 타입을 알 수 없습니다. throw 문에서 무엇이든 발생할 수 있기 때문입니다. 그러나 일반적으로 위의 예와 같이 Error 인스턴스라고 가정할 수 있습니다. TypeError 및 RangeError와 같은 Error 내장 하위 클래스가 있는데, 오류에 대한 추가적인 의미체계를 제공하는 데 사용할 수 있습니다. JavaScript에는 조건부 포착이 없습니다. 한 가지의 타입의 오류만 처리하려면, 모든 것을 포착하고 instanceof를 사용해 오류 타입을 식별해야 하고, 그런 다음 다른 case를 다시 던져야 합니다.</p>
									
									<pre class="code">
try {
  buildMySite("./website");
} catch (e) {
  if (e instanceof RangeError) {
    console.error("Seems like a parameter is out of range:", e);
    console.log("Retrying...");
    buildMySite("./website");
  } else {
    // 다른 에러 타입을 처리하는 방법을 모릅니다.
    // 호출 스택의 다른 부분에서 에러를 잡아서 처리할 수 있도록 던지세요.
    throw e;
  }
}
									</pre>
									<p>호출 스택의 try...catch에서 에러를 포착하지 못하면, 프로그램이 종료됩니다.</p>
									<p>제어 흐름문의 전체 목록은 참조 섹션을 참조하세요.</p>
									
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