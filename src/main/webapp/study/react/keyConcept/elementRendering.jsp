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
							<div class="col-9 col-12-medium">

								<section>
									
									<h2>엘리먼트 렌더링</h2>
									<p>엘리먼트는 React 앱의 가장 작은 단위입니다. 앨리먼트는 화면에 표시할 내용을 기술합니다.</p>
									<pre class="code">
const element = &lt;h1&gt;Hello, world&lt;/h1&gt;;									
									</pre>
									<p>브라우저 DOM 엘리먼트와 달리 React 엘리먼트는 일반 객체이며(plain object) 쉽게 생성할 수 있습니다. React DOM은 React 엘리먼트와 일치하도록 DOM을 업데이트합니다.</p>
									
									<h3>주의</h3>
									<blockquote>더 널리 알려진 개념인 “컴포넌트”와 엘리먼트를 혼동할 수 있습니다. 다음 장에서 컴포넌트에 대해 소개할 예정입니다. 엘리먼트는 컴포넌트의 “구성 요소”이므로 이번 장을 읽고 나서 다음 장으로 넘어갈 것을 권합니다.</blockquote>
								
									<h2>DOM에 엘리먼트 렌더링하기</h2>
									<p>HTML 파일 어딘가에 &lt;div&gt;가 있다고 가정해 봅시다.</p>
									<pre class="code">
&lt;div id="root"&gt;&lt;/div&gt;									
									</pre>
									<p>이 안에 들어가는 모든 엘리먼트를 React DOM에서 관리하기 때문에 이것을 “루트(root)” DOM 노드라고 부릅니다.</p>
									<p>React로 구현된 애플리케이션은 일반적으로 하나의 루트 DOM 노드가 있습니다. React를 기존 앱에 통합하려는 경우 원하는 만큼 많은 수의 독립된 루트 DOM 노드가 있을 수 있습니다.</p>
									<p>React 엘리먼트를 렌더링 하기 위해서는 우선 DOM 엘리먼트를 ReactDOM.createRoot()에 전달한 다음, React 엘리먼트를 root.render()에 전달해야 합니다.</p>
									
									<pre class="code">
const root = ReactDOM.createRoot(
  document.getElementById('root')
);
const element = &lt;h1&gt;Hello, world&lt;/h1&gt;;
root.render(element);									
									</pre>
									<p>위 코드를 실행하면 화면에 “Hello, world”가 보일 겁니다.</p>
									
									<h2>렌더링 된 엘리먼트 업데이트하기</h2>
									<p>React 엘리먼트는 불변객체입니다. 엘리먼트를 생성한 이후에는 해당 엘리먼트의 자식이나 속성을 변경할 수 없습니다. 엘리먼트는 영화에서 하나의 프레임과 같이 특정 시점의 UI를 보여줍니다.</p>
									<p>지금까지 소개한 내용을 바탕으로 하면 UI를 업데이트하는 유일한 방법은 새로운 엘리먼트를 생성하고 이를 root.render()로 전달하는 것입니다.</p>
									<p>예시로 똑딱거리는 시계를 살펴보겠습니다.</p>
									
									<pre class="code">
const root = ReactDOM.createRoot(
  document.getElementById('root')
);

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
									<p>위 함수는 setInterval() 콜백을 이용해 초마다 root.render()를 호출합니다.</p>
									
									<h3>주의</h3>
									<blockquote>실제로 대부분의 React 앱은 root.render()를 한 번만 호출합니다. 다음 장에서는 이와 같은 코드가 유상태 컴포넌트에 어떻게 캡슐화되는지 설명합니다.</blockquote>
									
									<h2>변경된 부분만 업데이트하기</h2>
									<p>React DOM은 해당 엘리먼트와 그 자식 엘리먼트를 이전의 엘리먼트와 비교하고 DOM을 원하는 상태로 만드는데 필요한 경우에만 DOM을 업데이트합니다.</p>
									<p>개발자 도구를 이용해 마지막 예시를 살펴보면 이를 확인할 수 있습니다.</p>
									<img src="/study/react/images/granular-dom-updates.gif" />
									<p>매초 전체 UI를 다시 그리도록 엘리먼트를 만들었지만 React DOM은 내용이 변경된 텍스트 노드만 업데이트했습니다.</p>
									<p>경험에 비추어 볼 때 특정 시점에 UI가 어떻게 보일지 고민하는 이런 접근법은 시간의 변화에 따라 UI가 어떻게 변화할지 고민하는 것보다 더 많은 수의 버그를 없앨 수 있습니다.</p>
									
								</section>

							</div>
							<div class="col-3 col-12-medium">

								<jsp:include page="/study/react/right.jsp"></jsp:include>
								
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