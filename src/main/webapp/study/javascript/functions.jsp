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
									
									<h2>익명 함수</h2>
									<p>JavaScript에서는 익명 함수(이름이 없는 함수)를 만들 수 있습니다. 실제로, 이런 이름없는 함수들은 다른 함수의 인자로 전달하거나 함수를 호출하는 데 사용할 수 있는 변수에 즉시 할당되거나 다른 함수에서 반환됩니다.</p>
									<pre class="code">
// 괄호 앞에 함수명이 없음을 주목해주세요.
const avg = function (...args) {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
};
									</pre>
									<p>위에 정의된 익명 함수는 인수와 함께 avg()와 같은 형태로 실행할 수 있습니다. 즉, function avg() {}와 같이 이름을 붙인 함수 선언과 의미적으로 같습니다.</p>
									<p>화살표 함수를 사용하여 익명 함수를 정의하는 또 다른 방법이 있습니다.</p>
									<pre class="code">
// 괄호 앞에 함수명이 없음을 주목해주세요.
const avg = (...args) => {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
};

// 단순히 표현식을 반환할 때, `return`을 생략할 수 있습니다.
const sum = (a, b, c) => a + b + c;
									</pre>
									
									<p>화살표 함수는 의미적으로 함수 표현식과 동일하지 않습니다. 자세한 내용은 참조 페이지를 참조하세요.</p>
									<p>익명 함수가 유용할 수 있는 또 다른 방법이 있습니다. 즉시 실행 함수 표현(IIFE, Immediately Invoked Function Expressions)이라는 단일 표현식에서 익명 함수를 동시에 선언하고 호출할 수 있습니다.</p>
									<pre class="code">
(function () {
  // …
})();
									</pre>
									<p>IIFE의 사용 사례에 대해서는 클로저를 이용해서 프라이빗 메서드 흉내내기을 참조하세요.</p>
									
									<h2>재귀 함수</h2>
									<p>JavaScript는 재귀적으로 함수를 호출할 수 있습니다. 이는 브라우저 DOM 등에서 볼 수 있는 트리 구조를 다루는데 유용합니다.</p>
									<pre class="code">
function countChars(elm) {
  if (elm.nodeType === 3) {
    // TEXT_NODE
    return elm.nodeValue.length;
  }
  let count = 0;
  for (let i = 0, child; (child = elm.childNodes[i]); i++) {
    count += countChars(child);
  }
  return count;
}
									</pre>
									<p>함수 표현식에도 이름을 지정할 수 있으므로, 재귀적일 수 있습니다.</p>
									<pre class="code">
const charsInBody = (function counter(elm) {
  if (elm.nodeType === 3) {
    // TEXT_NODE
    return elm.nodeValue.length;
  }
  let count = 0;
  for (let i = 0, child; (child = elm.childNodes[i]); i++) {
    count += counter(child);
  }
  return count;
})(document.body);
									</pre>
									<p>위와 같이 함수 표현식에 제공된 이름은 함수 자체 범위에서만 사용할 수 있습니다. 이를 통해 엔진에서 더 많은 최적화를 수행할 수 있으며, 결과적으로 더 읽기 쉬운 코드가 생성됩니다. 이 이름은 디버거와 일부 스택 추적에도 표시되므로, 디버깅 시 시간을 절약할 수 있습니다.</p>
									<p>함수형 프로그래밍에 익숙하다면 JavaScript에서 재귀가 성능에 미치는 영향에 주의하세요. 언어 명세에는 꼬리 호출 최적화(tail-call optimization)로 지정되어 있지만, 스택 추적 및 디버깅의 어려움으로 인해 JavaScriptCore (Safari에서 사용)에서만 구현했습니다. 깊은 재귀의 경우 스택 오버플로우를 방지하기 위해, 대신 반복을 사용하는 것이 좋습니다.</p>
									
									<h2>함수는 일급 객체(first-class objects)입니다</h2>
									<p>JavaScript 함수는 일급 객체(first-class objects)입니다. 즉, 변수에 할당하고 다른 함수에 인수로 전달하고 다른 함수에서 반환할 수 있습니다. 또한, JavaScript는 명시적인 캡처 없이 즉시 사용 가능한 클로저(closures)를 지원하므로 함수형 프로그래밍 스타일을 편리하게 적용할 수 있습니다.</p>
									<pre class="code">
// 함수를 반환하는 함수
const add = (x) => (y) => x + y;
// 함수를 매개변수로 받는 함수
const babies = ["dog", "cat", "hen"].map((name) => `baby ${name}`);
									</pre>
									<p>JavaScript 함수는 JavaScript의 다른 모든 것과 마찬가지로 그 자체로 객체이며, 이전 객체 섹션에서 본 것처럼 속성을 추가하거나 변경할 수 있습니다.</p>
									
									<h2>내장 함수 (Inner functions)</h2>
									<p>JavaScript의 함수 선언은 다른 함수 내부에서도 가능합니다. JavaScript의 중첩 함수에서는 부모 함수 범위에 있는 변수에 접근이 가능하다는 게 중요합니다.</p>
									<pre class="code">
function parentFunc() {
  const a = 1;

  function nestedFunc() {
    const b = 4; // parentFunc은 사용할 수 없는 변수
    return a + b;
  }
  return nestedFunc(); // 5
}
									</pre>
									<p>이런 특성은 유지보수가 용이한 코드를 만드는데 도움이 됩니다. 호출된 함수가 다른 한두 개의 함수에서만 호출되며 그 외의 다른 코드에서는 사용이 안되는 경우, 해당 함수를 내부에 중첩시킬 수 있습니다. 이런 방법을 통해 전역 범위에 함수의 개수가 줄어듭니다.</p>
									<p>또한 전역 변수에 대한 유혹을 뿌리칠 수 있는 좋은 대안이 됩니다. 복잡한 코드를 작성하게 될 때면 여러 함수들 간에 값을 공유하기 위한 용도로 전역 변수를 사용하고 싶어지지만, 전역 변수는 유지보수를 힘들게 합니다. 이런 상황에 중첩 함수는 부모의 변수를 공유함으로써 전역 이름공간을 더럽히지 않고 함수들을 연동할 수 있습니다.</p>
									
								</section>
<script>
/*
function add(x, y){
	const total = x + y;
	return total;
}

console.log(add());

console.log(add(2, 3, 4));

function avg(...args){
	console.log(args);
	let sum = 0;
	for(const item of args){
		sum += item;
	}
	return sum/args.length;
	
}

console.log(avg(2, 3, 4, 5));

function area({width, height}){
	return width * height;
}

console.log(area({width:10, height:10}));

function avg2(firstValue, secondValue, thirdValue = 0){
	console.log(firstValue+', '+secondValue+', '+thirdValue);
	return(firstValue + secondValue + thirdValue) / 3;
}

console.log(avg2(1, 2));

const avg3 = function (...args){
	let sum = 0;
	for(const item of args){
		sum += item;
	}
	console.log('sum:'+sum+', args len:'+args.length);
	return sum/args.length;
}
console.log( avg3(1,2,3) );

const avg4 = (...args) => {
	let sum = 0;
	for(const item of args){
		sum += item;
	}
	return sum / args.length;
}
console.log( avg4(1,2,3) );
*/

const add = (x) => (y) => x + y;
console.log(add);

const babies = ["dog", "cat", "hen"].map((name) => `baby `);
console.log(babies);

function parentFunc(){
	const a = 1;
	
	function nestedFunc(){
		const b = 4;
		return a + b;
	}
	return nestedFunc();
}

console.log(parentFunc());

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