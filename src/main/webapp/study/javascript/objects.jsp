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
									
									<h2>객체(Objects)</h2>
									<p>JavaScript 객체는 간단히 이름-값 쌍(name-value pairs)의 모임입니다. 따라서 JavaScript의 객체의 모임은 다음과 비슷합니다.</p>
									<ul>
										<li>Python의 Dictionaries.</li>
										<li>Perl과 Ruby의 Hashes.</li>
										<li>C와 C++ 의 Hash tables.</li>
										<li>Java의 HashMaps.</li>
										<li>PHP의 연관 배열(Associative arrays).</li>									
									</ul>
									<p>JavaScript의 객체는 해시(hashes)입니다. 정적으로 타입이 지정된 언어의 객체와 달리, JavaScript의 객체는 모양이 고정되어 있지 않습니다. 속성은 언제든지 추가, 삭제, 재정렬, 변경 또는 동적으로 쿼리할 수 있습니다. 객체 키는 항상 strings 또는 기호(symbols)입니다. 정수인 배열 인덱스도 실제로는 문자열입니다.</p>
									<p>객체는 일반적으로 리터럴 구문을 사용하여 생성됩니다.</p>
									
									<pre class="code">
const obj = {
  name: "Carrot",
  for: "Max",
  details: {
    color: "orange",
    size: 12,
  },
};
									</pre>
									<p>객체 속성은 점(.) 또는 대괄호([])를 사용하여 접근할 수 있습니다. 점 표기법을 사용할 때, 키는 유효한 식별자여야 합니다. 반면 대괄호를 사용하면 동적 키 값으로 객체를 인덱싱할 수 있습니다.</p>
									<pre class="code">
// 점 표기법
obj.name = "Simon";
const name = obj.name;

// 대괄호 표기법
obj["name"] = "Simon";
const name = obj["name"];

// 변수를 사용하여 키를 정의할 수 있습니다.
const userName = prompt("what is your key?");
obj[userName] = prompt("what is its value?");
									</pre>
									<p>속성 접근은 함께 연결할 수 있습니다.</p>
									<pre class="code">
obj.details.color; // orange
obj["details"]["size"]; // 12
									</pre>
									<p>객체는 항상 참조이므로, 무언가 명시적으로 객체를 복사하지 않는 한, 객체에 대한 변형은 외부에서 볼 수 있습니다.</p>
									
									<pre class="code">
const obj = {};
function doSomething(o) {
  o.x = 1;
}
doSomething(obj);
console.log(obj.x); // 1
									</pre>
									
									<p>이는 또한 별도로 생성된 두 객체가 서로 다른 참조이기 때문에 결코 같지 않음(!==)을 의미합니다. 동일한 객체에 대한 두 개의 참조를 보유하는 경우, 하나를 변경하면 다른 하나를 통해 관찰할 수 있습니다.</p>
									<pre class="code">
const me = {};
const stillMe = me;
me.x = 1;
console.log(stillMe.x); // 1
									</pre>
									<p>객체 및 프로토타입에 대한 자세한 내용은, 객체 참조 페이지를 참조하세요. 객체 초기화 구문에 대한 자세한 내용은 참조 페이지를 참고하세요.</p>
									<p>일반적으로 (난해하다고 들었을 수 있는) 기본 메커니즘을 건드리지 않고 클래스를 사용하여 상속을 달성할 수 있기 때문에, 이 페이지에서는 객체 프로토타입 및 상속에 대한 모든 세부 정보를 생략했습니다. 자세한 내용은 상속 및 프로토타입 체인을 참조하세요.</p>
									
								</section>
<script>

const obj = {
		  name: "Carrot",
		  for: "Max",
		  details: {
		    color: "orange",
		    size: 12,
		  },
		};
		
console.log(obj.name);

//점 표기법
obj.name = "Simon";
console.log(obj.name);

const name = obj.name;

// 대괄호 표기법
obj["name"] = "Simon2";
console.log(obj["name"] + ', ' + obj.name);

const name2 = obj["name"];

// 변수를 사용하여 키를 정의할 수 있습니다.
//const userName = prompt("what is your key?");
//console.log(userName);

//obj[userName] = prompt("what is its value?");
//console.log(obj[userName]);

console.log(obj.details.color); // orange
console.log(obj["details"]["size"]); // 12
				
const obj2 = {};
function doSomething(o) {
  o.x = 1;
}
doSomething(obj2);
console.log(obj2.x); // 1

const me = {};
const stillMe = me;
me.x = 1;
console.log(stillMe.x); // 1

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