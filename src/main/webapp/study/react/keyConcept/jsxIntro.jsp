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
									
									<h2>JSX 소개</h2>
									<pre class="code">
const element = &lt;h1&gt;Hello, world!&lt;/h1&gt;;									
									</pre>
									<p>위의 태그 문법은 문자열도 html도 아닌 jsx라 하며 Javascript를 확장한 문법입니다.</p>
									
									<h2>JSX란?</h2>
									<p>React에서는 본질적으로 렌더링 로직이 UI 로직(이벤트가 처리되는 방식, 시간에 따라 state가 변하는 방식, 화면에 표시하기 위해 데이터가 준비되는 방식 등)과 연결된다는 사실을 받아들입니다.</p>
									
									<h2>JSX에 표현식 포함하기</h2>
									<p>아래 예시에서는 name이라는 변수를 선언한 후 중괄호로 감싸 JSX 안에 사용하였습니다.</p>
									<pre class="code">
const name = 'Josh Perez';
const element = &lt;h1&gt;Hello, {name}&lt;/h1&gt;;									
									</pre>
									<p>JSX의 중괄호 안에는 유효한 모든 JavaScript 표현식을 넣을 수 있습니다. 예를 들어 2 + 2, user.firstName 또는 formatName(user) 등은 모두 유효한 JavaScript 표현식입니다.
										아래 예시에서는 JavaScript 함수 호출의 결과인 formatName(user)을 &lt;h1&gt; 엘리먼트에 포함했습니다.</p>
									<pre class="code">
function formatName(user) {
  return user.firstName + ' ' + user.lastName;
}

const user = {
  firstName: 'Harper',
  lastName: 'Perez'
};

const element = (
  &lt;h1&gt;
    Hello, {formatName(user)}!
  &lt;/h1&gt;
);							
									</pre>	
									
									<h2>JSX도 표현식입니다</h2>
									<p>컴파일이 끝나면, JSX 표현식이 정규 JavaScript 함수 호출이 되고 JavaScript 객체로 인식됩니다. 즉, JSX를 if 구문 및 for loop 안에 사용하고, 변수에 할당하고, 인자로서 받아들이고, 함수로부터 반환할 수 있습니다.</p>		
									<pre class="code">
function getGreeting(user) {
  if (user) {
    return &lt;h1&gt;Hello, {formatName(user)}!&lt;/h1&gt;;
  }
  return &lt;h1&gt;Hello, Stranger.&lt;/h1&gt;;
}									
									</pre>
									
									<h2>JSX속성정의</h2>
									<p>어트리뷰트에 따옴표를 이용해 문자열 리터럴을 정의할 수 있습니다.</p>
									<pre class="code">
const element = &lt;a href="https://www.reactjs.org"&gt; link &lt;/a&gt;;									
									</pre>
									<p>중괄호를 사용하여 어트리뷰트에 JavaScript 표현식을 삽입할 수도 있습니다.</p>
									<pre class="code">
const element = &lt;img src={user.avatarUrl}&gt;&lt;/img&gt;;									
									</pre>
									<p>어트리뷰트에 JavaScript 표현식을 삽입할 때 중괄호 주변에 따옴표를 입력하지 마세요. 따옴표(문자열 값에 사용) 또는 중괄호(표현식에 사용) 중 하나만 사용하고, 동일한 어트리뷰트에 두 가지를 동시에 사용하면 안 됩니다.</p>
									
									<h3>경고</h3>
									<blockquote>JSX는 HTML보다는 JavaScript에 가깝기 때문에, React DOM은 HTML 어트리뷰트 이름 대신 camelCase 프로퍼티 명명 규칙을 사용합니다. 
									예를 들어, JSX에서 class는 className가 되고 tabindex는 tabIndex가 됩니다.</blockquote>
	
									<h2>JSX로 자식 정의</h2>
									<p>태그가 비어있다면 XML처럼 /> 를 이용해 바로 닫아주어야 합니다.</p>
									<pre class="code">
const element = &lt;img src={user.avatarUrl} /&gt;;									
									</pre>
									
									<p>JSX 태그는 자식을 포함할 수 있습니다.</p>
									<pre class="code">
const element = (
  &lt;div&gt;
    &lt;h1&gt;Hello!&lt;/h1&gt;
    &lt;h2&gt;Good to see you here.&lt;/h2&gt;
  &lt;/div&gt;
);									
									</pre>
									
									<h2>JSX는 주입 공격을 방지합니다</h2>
									<p>JSX에 사용자 입력을 삽입하는 것은 안전합니다.</p>
									<pre class="code">
const title = response.potentiallyMaliciousInput;
// 이것은 안전합니다.
const element = &lt;h1&gt;{title}&lt;/h1&gt;;									
									</pre>
									<p>기본적으로 React DOM은 JSX에 삽입된 모든 값을 렌더링하기 전에 이스케이프 하므로, 애플리케이션에서 명시적으로 작성되지 않은 내용은 주입되지 않습니다. 모든 항목은 렌더링 되기 전에 문자열로 변환됩니다. 이런 특성으로 인해 XSS (cross-site-scripting) 공격을 방지할 수 있습니다.</p>
									
									<h2>JSX는 객체를 표현합니다.</h2>
									<p>Babel은 JSX를 React.createElement() 호출로 컴파일합니다.</p>
									<p>다음 두 예시는 동일합니다.</p>
									<pre class="code">
const element = (
  &lt;h1 className="greeting"&gt;
    Hello, world!
  &lt;/h1&gt;
);
									</pre>
									<pre class="code">
const element = React.createElement(
  'h1',
  {className : 'greeting'},
  'Hello, world!'
);									
									</pre>
									<p>React.createElement()는 버그가 없는 코드를 작성하는 데 도움이 되도록 몇 가지 검사를 수행하며, 기본적으로 다음과 같은 객체를 생성합니다.</p>
									
									<pre class="code">
// 주의: 다음 구조는 단순화되었습니다
const element = {
  type: 'h1',
  props: {
    className : 'greeting',
    children : 'Hello, world!'
  }
};									
									</pre>
									<p>이러한 객체를 “React 엘리먼트”라고 하며, 화면에서 보고 싶은 것을 나타내는 표현이라 생각하면 됩니다. React는 이 객체를 읽어서, DOM을 구성하고 최신 상태로 유지하는 데 사용합니다.</p>
								</section>

							</div>
							<div class="col-2 col-12-medium">

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