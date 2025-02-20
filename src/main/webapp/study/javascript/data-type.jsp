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

									<pre class="code">
console.log(0b111110111); // 503
console.log(0o767); // 503
console.log(0x1f7); // 503
console.log(5.03e2); // 503
									</pre>
									
									<p>BigInt 타입은 임의 길이의 정수입니다. 그 동작은 C의 정수 타입(예: 나누기가 0으로 자르기)과 유사하지만, 무한정 커질수 있다는 점과 다릅니다. BigInt는 숫자 리터럴과 n 접미사로 지정됩니다.</p>
									<pre class="code">
console.log(-3n / 2n); // -1n
									</pre>
									<p>더하기, 빼기, 나머지 산술 등을 포함한 표준 산술 연산자가 지원됩니다. BigInt와 숫자는 산술 연산에서 혼합될 수 없습니다.</p>
									<p>Math 객체는 표준 수학 함수와 상수를 제공합니다.</p>
									
									<pre class="code">
Math.sin(3.5);
const circumference = 2 * Math.PI * r;
									</pre>
									<p>문자열을 숫자로 변환하는 세 가지 방법이 있습니다.</p>
									<ul>
										<li>parseInt(), 문자열에서 정수를 구문 분석합니다.</li>
										<li>parseFloat(), 부동소수점 숫자에 대한 문자열을 구문 분석합니다.</li>
										<li>Number() 함수는 문자열을 숫자 리터럴인 것처럼 구문 분석하고 다양한 숫자 표현을 지원합니다.</li>
										<li>단항 더하기 +를 Number()의 줄임말로 사용할 수도 있습니다.</li>
									</ul>
									
									<p>숫자 값에는 NaN("Not a Number"의 줄임말) 및 Infinity도 포함됩니다. 많은 "잘못된 수학" 연산은 NaN을 반환합니다. 예를 들어, 숫자가 아닌 문자열을 구문 분석하려고 하거나 Math.log()를 음수 값으로 지정합니다. 0으로 나누면 'Infinity'(양수 또는 음수)가 생성됩니다.</p>
									<p>NaN은 전염성이 있습니다. 수학 연산의 피연산자로 제공하면 결과도 NaN이 됩니다. NaN은 자체와 같지 않은 JavaScript의 유일한 값입니다(IEEE 754 명세에 따름).</p>
									
								</section>
								
								<section>
									<h2>문자열 (Strings)</h2>
									<p>JavaScript의 문자열은 유니코드 문자의 시퀀스입니다. 이는 국제화를 다루어야 했던 모든 사람에게 반가운 소식이 될 것입니다. 더 정확하게는 UTF-16 encoded를 사용합니다.</p>
									<pre class="code">
console.log("Hello, world");
console.log("你好，世界！"); // 거의 모든 유니코드 문자를 문자 그대로 문자열 리터럴로 작성할 수 있습니다.
									</pre>
									<p>문자열은 작은따옴표나 큰따옴표로 작성할 수 있습니다. JavaScript는 문자와 문자열을 구분하지 않습니다. 단일 문자를 나타내려면, 해당 단일 문자로 구성된 문자열을 사용하면 됩니다.</p>
									<pre class="code">
console.log("Hello"[1] === "e"); // true
									</pre>
									<p>문자열의 길이(코드 단위)를 찾으려면, length 속성에 접근하세요.</p>
									<p>문자열에는 문자열을 조작하고 문자열에 대한 정보에 접근하는 유틸리티 메서드가 있습니다. 모든 원시 타입은 설계 상 변경할 수 없기 때문에, 이러한 메서드는 새 문자열을 반환합니다.</p>
									<p>+ 연산자는 문자열에 대해 오버로드됩니다. 피연산자 중 하나가 문자열이면, 숫자 추가 대신 문자열 연결을 수행합니다. 특별한 템플릿 문자열 구문을 사용하면 표현식이 포함된 문자열을 더 간결하게 작성할 수 있습니다. Python의 f-문자열이나 C#의 보간된 문자열과 달리, 템플릿 리터럴은 백틱(작은따옴표나 큰따옴표가 아님)을 사용합니다.</p>
									
									<pre class="code">
const age = 25;
console.log("I am " + age + " years old."); // 문자열 연결
console.log(`I am ${age} years old.`); // 템플릿 리터럴
									</pre>
									
									<p>문자열의 길이(코드 단위)를 찾으려면, length 속성에 접근하세요.
									<p>문자열에는 문자열을 조작하고 문자열에 대한 정보에 접근하는 유틸리티 메서드가 있습니다. 모든 원시 타입은 설계 상 변경할 수 없기 때문에, 이러한 메서드는 새 문자열을 반환합니다.</p>
									<p>+ 연산자는 문자열에 대해 오버로드됩니다. 피연산자 중 하나가 문자열이면, 숫자 추가 대신 문자열 연결을 수행합니다. 특별한 템플릿 문자열 구문을 사용하면 표현식이 포함된 문자열을 더 간결하게 작성할 수 있습니다. Python의 f-문자열이나 C#의 보간된 문자열과 달리, 템플릿 리터럴은 백틱(작은따옴표나 큰따옴표가 아님)을 사용합니다.</p>
									
									<pre class="code">
const age = 25;
console.log("I am " + age + " years old."); // 문자열 연결
console.log(`I am ${age} years old.`); // 템플릿 리터럴
									</pre>
									
									<h2>이외의 타입들</h2>
									<p>JavaScript는 의도적으로 값이 없음을 나타내는 (그리고 null 키워드를 통해서만 접근할 수 있는) 값인 null과 값이 없음을 나타내는 undefined를 구분합니다. undefined을 얻을 수 있는 방법에는 여러 가지가 있습니다.</p>
									<ul>
										<li>값이 없는 return문 (return;)은 암시적으로 undefined를 반환합니다.</li>
										<li>존재하지 않는 object (obj.iDontExist)에 접근하면 undefined를 반환합니다.</li>
										<li>초기화 없는 변수 선언 (let x;)은 암시적으로 변수를 undefined로 초기화합니다.</li>		
									</ul>
									<p>JavaScript에는 true 및 false 값이 가능한 불리언(Boolean) 타입이 있습니다. 둘 다 키워드입니다. 다음 규칙에 따라 모든 값을 불리언 값으로 변환할 수 있습니다. </p>
									
									<ul>
										<li>false, 0, 빈 문자열 (""),NaN, null, 와 undefined은 모두 false가 됩니다.</li>
										<li>다른 모든 값은 true가 됩니다.</li>
									</ul>
									<p>이 변환은 Boolean() 함수를 써서 명시적으로 이 작업을 수행하실 수 있습니다.</p>
									
									<pre class="code">
Boolean(""); // false
Boolean(234); // true
									</pre>
									<p>하지만 이렇게 할 필요는 거의 없습니다. JavaScript는 이러한 변환 작업을 if 문(제어 구조 참고)과 같이 불리언 값이 필요한 경우를 만나게 되면 자동으로 변환하기 때문입니다. 이러한 이유로 인해 우리는 때때로 불리언 컨텍스트에서 사용될 때 각각 true, false가 되는 "참 같은 값(truthy)"와 "거짓 같은 값(falsy)" 에 대해 이야기할 것입니다.</p>
									<p>불리언 연산자는 논리 연산자 && (논리합), || (논리곱), 그리고 ! (부정)이 지원됩니다. 연산자를 참조하세요.</p>
									<p>기호(Symbol) 타입은 종종 고유한 식별자를 만드는 데 사용됩니다. Symbol() 함수로 만든 모든 기호(Symbol)는 고유함을 보장합니다. 또한, 공유 상수인 등록된 기호와 특정 작업에 대한 "프로토콜"로 언어에서 사용되는 잘 알려진 기호가 있습니다. 기호 참조에서 자세한 내용을 읽을 수 있습니다.</p>
									
								</section>
<script>
console.log(3 / 2); // 1.5, not 1
console.log(0.1 + 0.2); // 0.30000000000000004
console.log(0b111110111); // 503
console.log(0o767); // 503
console.log(0x1f7); // 503
console.log(5.03e2); // 503
console.log(-3n / 2n); // -1n

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