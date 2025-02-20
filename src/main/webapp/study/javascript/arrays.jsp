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
									
									<h2>배열(Arrays)</h2>
									<p>JavaScript에서 배열은 실제로는 특별한 타입의 객체입니다. (숫자로 나타낸 속성은 자연스럽게 [] 구문만을 사용해서 접근하게 되므로) 일반 객체와 많이 비슷하게 동작하지만, 이 객체는 length라는 한가지 마법적인 속성을 가집니다. 이는 항상 배열에서 가장 큰 인덱스보다 하나 더 큰 값을 가집니다.</p>
									<p>배열을 일반적으로 배열 리터럴로 생성됩니다.</p>

									<pre class="code">
const a = ["dog", "cat", "hen"];
a.length; // 3
									</pre>
									<p>JavaScript 배열은 여전히 객체입니다. 임의의 숫자 인덱스를 포함하여 배열에 속성을 할당할 수 있습니다. 유일한 "마법"은 특정 인덱스를 설정할 때 length가 자동으로 업데이트 된다는 것입니다.</p>
									
									<pre class="code">
const a = ["dog", "cat", "hen"];
a[100] = "fox";
console.log(a.length); // 101
console.log(a); // ['dog', 'cat', 'hen', empty × 97, 'fox']
									</pre>
									<p>위에서 얻은 배열을 희소 배열(sparse array)라고 합니다. 중간에 비어있는 슬롯이 있기 때문이며 엔진이 배열에서 해시 테이블로 배열을 최적화하지 않기 때문입니다. 배열이 밀집되어 있는지 확인하세요!</p>
									<p>범위를 벗어난 인덱싱은 발생하지 않습니다. 존재하지 않는 배열 인덱스를 참조하려고 하면 undefined값이 반환됩니다.</p>
									
									<pre class="code">
const a = ["dog", "cat", "hen"];
console.log(typeof a[90]); // undefined
									</pre>
									<p>배열은 모든 요소를 가질 수 있으며 임의로 확장하거나 축소할 수 있습니다.</p>
									
									<pre class="code">
const arr = [1, "foo", true];
arr.push({});
// arr = [1, "foo", true, {}]
									</pre>
									<p>배열은 다른 C 유사 언어에서와 마찬가지로 for 루프로 반복될 수 있습니다.</p>
									<pre class="code">
for (let i = 0; i < a.length; i++) {
  // a[i]을 가지고 작업 진행
}
									</pre>
									<p>배열은 또한 반복 가능하므로, C++/Java의 for (int x : arr) 문법와 동일한 for...of 루프를 사용할 수 있습니다.</p>
									<pre class="code">
for (const currentValue of a) {
  // currentValue를 가지고 작업 진행
}
									</pre>
									<p>배열에는 배열 메서드가 많이 있습니다. 대부분은 배열을 순회합니다. 예를 들어, map()은 모든 배열 요소에 콜백을 적용하고 새 배열을 반환합니다.</p>
									<pre class="code">
const babies = ["dog", "cat", "hen"].map((name) => `baby ${name}`);
// babies = ['baby dog', 'baby cat', 'baby hen']
									</pre>
									
								</section>
<script>

const a = ["dog", "cat", "hen"];
console.log(a.length); // 3

a[100] = "fox";
console.log(a.length); // 101
console.log(a); // ['dog', 'cat', 'hen', empty × 97, 'fox']

console.log(typeof a[90]); // undefined

const arr = [1, "foo", true];
console.log(arr);
arr.push({});
console.log(arr);
// arr = [1, "foo", true, {}]

for (const currentValue of arr) {
  // currentValue를 가지고 작업 진행
  console.log(currentValue);
}

const babies = ["dog", "cat", "hen"].map((name) => `baby `);
//babies = ['baby dog', 'baby cat', 'baby hen']
console.log(babies);

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