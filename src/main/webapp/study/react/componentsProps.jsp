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
							<div class="col-8 col-12-medium">

								<section>
									
									<h2>Components와 Props</h2>
									<p>컴포넌트를 통해 UI를 재사용 가능한 개별적인 여러 조각으로 나누고, 각 조각을 개별적으로 살펴볼 수 있습니다. 이 페이지에서는 컴포넌트의 개념을 소개합니다. 자세한 컴포넌트 API 레퍼런스는 여기에서 확인할 수 있습니다.</p>
									<p>개념적으로 컴포넌트는 JavaScript 함수와 유사합니다. “props”라고 하는 임의의 입력을 받은 후, 화면에 어떻게 표시되는지를 기술하는 React 엘리먼트를 반환합니다.</p>
									
									<h2>함수 컴포넌트와 클래스 컴포넌트</h2>
									<p>컴포넌트를 정의하는 가장 간단한 방법은 JavaScript 함수를 작성하는 것입니다.</p>
									<pre class="code">
function Welcome(props) {
  return &lt;h1&gt;Hello, {props.name}&lt;/h1&gt;;
}									
									</pre>
									<p>이 함수는 데이터를 가진 하나의 “props” (props는 속성을 나타내는 데이터입니다) 객체 인자를 받은 후 React 엘리먼트를 반환하므로 유효한 React 컴포넌트입니다. 이러한 컴포넌트는 JavaScript 함수이기 때문에 말 그대로 “함수 컴포넌트”라고 호칭합니다.</p>
									<p>또한 ES6 class를 사용하여 컴포넌트를 정의할 수 있습니다.</p>
									<pre class="code">
class Welcome extends React.Component {
  render() {
    return &lt;h1&gt;Hello, {this.props.name}&lt;/h1&gt;;
  }
}									
									</pre>
									<p>React의 관점에서 볼 때 위 두 가지 유형의 컴포넌트는 동일합니다.</p>
									<p>class는 몇 가지 추가 기능이 있으며 이에 대해서는 다음 장에서 설명합니다. 그때까지는 간결성을 위해 함수 컴포넌트를 사용하겠습니다. 함수 컴포넌트와 클래스 컴포넌트 둘 다 몇 가지 추가 기능이 있으며 이에 대해서는 다음 장에서 설명합니다.</p>
									
									<h2>컴포넌트 렌더링</h2>
									<p>이전까지는 DOM 태그만을 사용해 React 엘리먼트를 나타냈습니다.</p>
									<pre class="code">
const element = &lt;div /&gt;;										
									</pre>
									<p>React 엘리먼트는 사용자 정의 컴포넌트로도 나타낼 수 있습니다.</p>
									<pre class="code">
const element = &lt;Welcome name="Sara" /&gt;;									
									</pre>
									<p>React가 사용자 정의 컴포넌트로 작성한 엘리먼트를 발견하면 JSX 어트리뷰트와 자식을 해당 컴포넌트에 단일 객체로 전달합니다. 이 객체를 “props”라고 합니다.</p>
									<p>다음은 페이지에 “Hello, Sara”를 렌더링하는 예시입니다.</p>
									<pre class="code">
function Welcome(props) {
  return &lt;h1&gt;Hello, {props.name}&lt;/h1&gt;;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
const element = &lt;Welcome name="Sara" /&gt;;
root.render(element);									
									</pre>
									<p>이 예시에서는 다음과 같은 일들이 일어납니다.</p>
									<ol>
										<li>&lt;Welcome name="Sara" /&gt; 엘리먼트로 root.render()를 호출합니다.</li>
										<li>React는 {name: 'Sara'}를 props로 하여 Welcome 컴포넌트를 호출합니다.</li>
										<li>Welcome 컴포넌트는 결과적으로 &lt;h1&gt;Hello, Sara&lt;/h1&gt; 엘리먼트를 반환합니다.</li>
										<li>React DOM은 &lt;h1&gt;Hello, Sara&lt;/h1&gt; 엘리먼트와 일치하도록 DOM을 효율적으로 업데이트합니다.</li>
									</ol>
									
									<blockquote>
										<p style="color:red;">주의: 컴포넌트의 이름은 항상 대문자로 시작합니다.</p>
										<p>React는 소문자로 시작하는 컴포넌트를 DOM 태그로 처리합니다. 예를 들어 &lt;div /&gt;는 HTML div 태그를 나타내지만, &lt;Welcome /&gt;은 컴포넌트를 나타내며 범위 안에 Welcome이 있어야 합니다.</p>
										<p>이 규칙에 대한 자세한 내용은 여기에서 확인할 수 있습니다.</p>
									</blockquote>
									
									<h2>컴포넌트 합성</h2>
									<p>컴포넌트는 자신의 출력에 다른 컴포넌트를 참조할 수 있습니다. 이는 모든 세부 단계에서 동일한 추상 컴포넌트를 사용할 수 있음을 의미합니다. React 앱에서는 버튼, 폼, 다이얼로그, 화면 등의 모든 것들이 흔히 컴포넌트로 표현됩니다.</p>
									<p>예를 들어 Welcome을 여러 번 렌더링하는 App 컴포넌트를 만들 수 있습니다.</p>
									<pre class="code">
function Welcome(props) {
  return &lt;h1&gt;Hello, {props.name}&lt;/h1&gt;;
}

function App() {
  return (
    &lt;div&gt;
      &lt;Welcome name="Sara" /&gt;
      &lt;Welcome name="Cahal" /&gt;
      &lt;Welcome name="Edite" /&gt;
    &lt;/div&gt;
  );
}									
									</pre>
									<p>일반적으로 새 React 앱은 최상위에 단일 App 컴포넌트를 가지고 있습니다. 하지만 기존 앱에 React를 통합하는 경우에는 Button과 같은 작은 컴포넌트부터 시작해서 뷰 계층의 상단으로 올라가면서 점진적으로 작업해야 할 수 있습니다.</p>
									
									<h2>컴포넌트 추출</h2>
									<p>컴포넌트를 여러 개의 작은 컴포넌트로 나누는 것을 두려워하지 마세요.</p>
									<p>다음 Comment 컴포넌트를 살펴봅시다.</p>
									<pre class="code">
function Comment(props) {
  return (
    &lt;div className="Comment"&gt;
      &lt;div className="UserInfo"&gt;
        &lt;img className="Avatar"
          src={props.author.avatarUrl}
          alt={props.author.name}
        /&gt;
        &lt;div className="UserInfo-name"&gt;
          {props.author.name}
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;div className="Comment-text"&gt;
        {props.text}
      &lt;/div&gt;
      &lt;div className="Comment-date"&gt;
        {formatDate(props.date)}
      &lt;/div&gt;
    &lt;/div&gt;
  );
}									
									</pre>
									<p>이 컴포넌트는 author(객체), text(문자열) 및 date(날짜)를 props로 받은 후 소셜 미디어 웹 사이트의 코멘트를 나타냅니다.</p>
									<p>이 컴포넌트는 구성요소들이 모두 중첩 구조로 이루어져 있어서 변경하기 어려울 수 있으며, 각 구성요소를 개별적으로 재사용하기도 힘듭니다. 이 컴포넌트에서 몇 가지 컴포넌트를 추출하겠습니다.</p>
									<p>먼저 Avatar를 추출하겠습니다.</p>
									
									<pre class="code">
function Avatar(props) {
  return (
    &lt;img className="Avatar"
      src={props.user.avatarUrl}
      alt={props.user.name}
    /&gt;
  );
}									
									</pre>
									<p>Avatar 는 자신이 Comment 내에서 렌더링 된다는 것을 알 필요가 없습니다. 따라서 props의 이름을 author에서 더욱 일반화된 user로 변경하였습니다.</p>
									<p>props의 이름은 사용될 context가 아닌 컴포넌트 자체의 관점에서 짓는 것을 권장합니다.</p>
									<p>이제 Comment 가 살짝 단순해졌습니다.</p>
									<pre class="code">
function Comment(props) {
  return (
    &lt;div className="Comment"&gt;
      &lt;div className="UserInfo"&gt;
        &lt;Avatar user={props.author} /&gt;
        &lt;div className="UserInfo-name"&gt;
          {props.author.name}
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;div className="Comment-text"&gt;
        {props.text}
      &lt;/div&gt;
      &lt;div className="Comment-date"&gt;
        {formatDate(props.date)}
      &lt;/div&gt;
    &lt;/div&gt;
  );
}									
									</pre>
									<p>다음으로 Avatar 옆에 사용자의 이름을 렌더링하는 UserInfo 컴포넌트를 추출하겠습니다.</p>
									<pre class="code">
function UserInfo(props) {
  return (
    &lt;div className="UserInfo"&gt;
      &lt;Avatar user={props.user} /&gt;
      &lt;div className="UserInfo-name"&gt;
        {props.user.name}
      &lt;/div&gt;
    &lt;/div&gt;
  );
}									
									</pre>
									<p>Comment 가 더욱 단순해졌습니다.</p>
									<pre class="code">
function Comment(props) {
  return (
    &lt;div className="Comment"&gt;
      &lt;UserInfo user={props.author} /&gt;
      &lt;div className="Comment-text"&gt;
        {props.text}
      &lt;/div&gt;
      &lt;div className="Comment-date"&gt;
        {formatDate(props.date)}
      &lt;/div&gt;
    &lt;/div&gt;
  );
}									
									</pre>
									<p>처음에는 컴포넌트를 추출하는 작업이 지루해 보일 수 있습니다. 하지만 재사용 가능한 컴포넌트를 만들어 놓는 것은 더 큰 앱에서 작업할 때 두각을 나타냅니다. UI 일부가 여러 번 사용되거나 (Button, Panel, Avatar), UI 일부가 자체적으로 복잡한 (App, FeedStory, Comment) 경우에는 별도의 컴포넌트로 만드는 게 좋습니다.</p>
									
									<h2>props는 읽기 전용입니다.</h2>
									<p>함수 컴포넌트나 클래스 컴포넌트 모두 컴포넌트의 자체 props를 수정해서는 안 됩니다. 다음 sum 함수를 살펴봅시다.</p>
									<pre class="code">
function sum(a, b) {
  return a + b;
}									
									</pre>
									<p>이런 함수들은 순수 함수라고 호칭합니다. 입력값을 바꾸려 하지 않고 항상 동일한 입력값에 대해 동일한 결과를 반환하기 때문입니다.</p>
									<p>반면에 다음 함수는 자신의 입력값을 변경하기 때문에 순수 함수가 아닙니다.</p>
									<pre class="code">
function withdraw(account, amount) {
  account.total -= amount;
}									
									</pre>
									<p>React는 매우 유연하지만 한 가지 엄격한 규칙이 있습니다.</p>
									<p style="font-weight:bold;">모든 React 컴포넌트는 자신의 props를 다룰 때 반드시 순수 함수처럼 동작해야 합니다.</p>
									<p>물론 애플리케이션 UI는 동적이며 시간에 따라 변합니다. 다음 장에서는 “state”라는 새로운 개념을 소개합니다. React 컴포넌트는 state를 통해 위 규칙을 위반하지 않고 사용자 액션, 네트워크 응답 및 다른 요소에 대한 응답으로 시간에 따라 자신의 출력값을 변경할 수 있습니다.</p>
									
								</section>

							</div>
							<div class="col-4 col-12-medium">

								<jsp:include page="/study/react/right.jsp"></jsp:include>
								
								<section>
									<h2>Who are you guys?</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/images/pic2.jpg" alt="" class="left" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="/images/pic1.jpg" alt="" class="left" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
								</section>

								

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