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
									
									<h2>State and Lifecycle</h2>
									<p>이 페이지는 React 컴포넌트 안의 state와 생명주기에 대한 개념을 소개해 줍니다. 자세한 컴포넌트 API 레퍼런스는 여기에서 찾을 수 있습니다.</p>
									<p>이전 섹션에서 다뤄본 째깍거리는 시계 예시를 다시 살펴보겠습니다. 엘리먼트 렌더링에서는 UI를 업데이트하는 한 가지 방법만 배웠으며, 렌더링 된 출력값을 변경하기 위해 root.render()를 호출했습니다.</p>
									<pre class="code">
const root = ReactDOM.createRoot(document.getElementById('root'));
  
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
									<p>이 섹션에서는 Clock 컴포넌트를 완전히 재사용하고 캡슐화하는 방법을 배울 것입니다. 이 컴포넌트는 스스로 타이머를 설정할 것이고 매초 스스로 업데이트할 것입니다.</p>
									<p>시계가 생긴 것에 따라 캡슐화하는 것으로 시작할 수 있습니다.</p>
									
									<pre class="code">
const root = ReactDOM.createRoot(document.getElementById('root'));

function Clock(props) {
  return (
    &lt;div&gt;
      &lt;h1&gt;Hello, world!&lt;/h1&gt;
      &lt;h2&gt;It is {props.date.toLocaleTimeString()}.&lt;/h2&gt;
    &lt;/div&gt;
  );
}

function tick() {
  root.render(&lt;Clock date={new Date()} /&gt;);
}

setInterval(tick, 1000);									
									</pre>
									
									<p>그러나 여기에는 중요한 요건이 누락되어 있습니다. Clock이 타이머를 설정하고 매초 UI를 업데이트하는 것이 Clock의 구현 세부사항이 되어야 합니다.</p>
									<p>이상적으로 한 번만 코드를 작성하고 Clock이 스스로 업데이트하도록 만들려고 합니다.</p>
									
									<pre class="code">
root.render(&lt;Clock /&gt;);									
									</pre>
									<p>이것을 구현하기 위해서 Clock 컴포넌트에 “state”를 추가해야 합니다.</p>
									<p>State는 props와 유사하지만, 비공개이며 컴포넌트에 의해 완전히 제어됩니다.</p>
									
									<h2>함수에서 클래스로 변환하기</h2>
									<p>다섯 단계로 Clock과 같은 함수 컴포넌트를 클래스로 변환할 수 있습니다.</p>
									<ol>
										<li>React.Component를 확장하는 동일한 이름의 ES6 class를 생성합니다.</li>
										<li>render()라고 불리는 빈 메서드를 추가합니다.</li>
										<li>함수의 내용을 render() 메서드 안으로 옮깁니다.</li>
										<li>render() 내용 안에 있는 props를 this.props로 변경합니다.</li>
										<li>남아있는 빈 함수 선언을 삭제합니다.</li>
									</ol>
									
									<pre class="code">
class Clock extends React.Component {
  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;Hello, world!&lt;/h1&gt;
        &lt;h2&gt;It is {this.props.date.toLocaleTimeString()}.&lt;/h2&gt;
      &lt;/div&gt;
    );
  }
}									
									</pre>
									<p>Clock은 이제 함수가 아닌 클래스로 정의됩니다.</p>
									<p>render 메서드는 업데이트가 발생할 때마다 호출되지만, 같은 DOM 노드로 &lt;Clock /&gt;을 렌더링하는 경우 Clock 클래스의 단일 인스턴스만 사용됩니다. 이것은 로컬 state와 생명주기 메서드와 같은 부가적인 기능을 사용할 수 있게 해줍니다.</p>
									
									<h2>클래스에 로컬 State 추가하기</h2>
									<p>세 단계에 걸쳐서 date를 props에서 state로 이동해 보겠습니다.</p>
									<ol>
										<li>render() 메서드 안에 있는 this.props.date를 this.state.date로 변경합니다.
										<pre class="code">
class Clock extends React.Component {
  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;Hello, world!&lt;/h1&gt;
        &lt;h2&gt;It is {this.state.date.toLocaleTimeString()}.&lt;/h2&gt;
      &lt;/div&gt;
    );
  }
}										
										</pre></li>
										<li>초기 this.state를 지정하는 class constructor를 추가합니다.
										<pre class="code">
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;Hello, world!&lt;/h1&gt;
        &lt;h2&gt;It is {this.state.date.toLocaleTimeString()}.&lt;/h2&gt;
      &lt;/div&gt;
    );
  }
}										
										</pre>
										<p>여기서 어떻게 props를 기본 constructor에 전달하는지 유의해주세요.</p>
										<pre class="code">
 constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }										
										</pre>
										<p>클래스 컴포넌트는 항상 props로 기본 constructor를 호출해야 합니다.</p>
										</li>
										<li>&lt;Clock /&gt; 요소에서 date prop을 삭제합니다.
										<pre class="code">
root.render(&lt;Clock /&gt;);										
										</pre>
										<p>타이머 코드는 나중에 다시 컴포넌트로 추가하도록 하겠습니다. 결과는 다음과 같습니다.</p>
										<pre class="code">
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;Hello, world!&lt;/h1&gt;
        &lt;h2&gt;It is {this.state.date.toLocaleTimeString()}.&lt;/h2&gt;
      &lt;/div&gt;
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(&lt;Clock /&gt;);										
										</pre>
										<p>다음으로 Clock이 스스로 타이머를 설정하고 매초 스스로 업데이트하도록 만들어 보겠습니다.</p>
										</li>
									</ol>
									
									<h2>생명주기 메서드를 클래스에 추가하기</h2>
									<p>많은 컴포넌트가 있는 애플리케이션에서 컴포넌트가 삭제될 때 해당 컴포넌트가 사용 중이던 리소스를 확보하는 것이 중요합니다.</p>
									<p>Clock이 처음 DOM에 렌더링 될 때마다 타이머를 설정하려고 합니다. 이것은 React에서 “마운팅”이라고 합니다.</p>
									<p>또한 Clock에 의해 생성된 DOM이 삭제될 때마다 타이머를 해제하려고 합니다. 이것은 React에서 “언마운팅”이라고 합니다.</p>
									<p>컴포넌트 클래스에서 특별한 메서드를 선언하여 컴포넌트가 마운트되거나 언마운트 될 때 일부 코드를 작동할 수 있습니다.</p>
									
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