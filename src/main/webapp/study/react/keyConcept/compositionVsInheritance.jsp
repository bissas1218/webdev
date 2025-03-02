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
									
									<h2>합성 (Composition) vs 상속 (Inheritance)</h2>
									
									<p>React는 강력한 합성 모델을 가지고 있으며, 상속 대신 합성을 사용하여 컴포넌트 간에 코드를 재사용하는 것이 좋습니다.</p>

									<p>이번 문서에서는 React를 처음 접한 개발자들이 종종 상속으로 인해 부딪히는 몇 가지 문제들과 합성을 통해 이러한 문제를 해결하는 방법을 살펴볼 것입니다.</p>
									
									<h2>컴포넌트에서 다른 컴포넌트를 담기</h2>
									
									<p>어떤 컴포넌트들은 어떤 자식 엘리먼트가 들어올 지 미리 예상할 수 없는 경우가 있습니다. 범용적인 ‘박스’ 역할을 하는 Sidebar 혹은 Dialog와 같은 컴포넌트에서 특히 자주 볼 수 있습니다.</p>

									<p>이러한 컴포넌트에서는 특수한 children prop을 사용하여 자식 엘리먼트를 출력에 그대로 전달하는 것이 좋습니다.</p>
										
									<pre class="code">
function FancyBorder(props) {
  return (
    &lt;div className={'FancyBorder FancyBorder-' + props.color}&gt;
      {props.children}
    &lt;/div&gt;
  );
}									
									</pre>
									
									<p>이러한 방식으로 다른 컴포넌트에서 JSX를 중첩하여 임의의 자식을 전달할 수 있습니다.</p>
									
									<pre class="code">
function WelcomeDialog() {
  return (
    &lt;FancyBorder color="blue"&gt;
      &lt;h1 className="Dialog-title"&gt;
        Welcome
      &lt;/h1&gt;
      &lt;p className="Dialog-message"&gt;
        Thank you for visiting our spacecraft!
      &lt;/p&gt;
    &lt;/FancyBorder&gt;
  );
}									
									</pre>
									
									<p>&lt;FancyBorder&gt; JSX 태그 안에 있는 것들이 FancyBorder 컴포넌트의 children prop으로 전달됩니다. FancyBorder는 {props.children}을 &lt;div&gt; 안에 렌더링하므로 전달된 엘리먼트들이 최종 출력됩니다.</p>

									<p>흔하진 않지만 종종 컴포넌트에 여러 개의 “구멍”이 필요할 수도 있습니다. 이런 경우에는 children 대신 자신만의 고유한 방식을 적용할 수도 있습니다.</p>
									
									<pre class="code">
function SplitPane(props) {
  return (
    &lt;div className="SplitPane"&gt;
      &lt;div className="SplitPane-left"&gt;
        {props.left}
      &lt;/div&gt;
      &lt;div className="SplitPane-right"&gt;
        {props.right}
      &lt;/div&gt;
    &lt;/div&gt;
  );
}

function App() {
  return (
    &lt;SplitPane
      left={
        &lt;Contacts /&gt;
      }
      right={
        &lt;Chat /&gt;
      } /&gt;
  );
}									
									</pre>
									
									<p>&lt;Contacts /&gt;와 &lt;Chat /&gt;같은 React 엘리먼트는 단지 객체이기 때문에 다른 데이터처럼 prop으로 전달할 수 있습니다. 이러한 접근은 다른 라이브러리의 “슬롯 (slots)“과 비슷해보이지만 React에서 prop으로 전달할 수 있는 것에는 제한이 없습니다.</p>
									
									<h2>특수화</h2>
									<p>때로는 어떤 컴포넌트의 “특수한 경우”인 컴포넌트를 고려해야 하는 경우가 있습니다. 예를 들어, WelcomeDialog는 Dialog의 특수한 경우라고 할 수 있습니다.</p>

									<p>React에서는 이 역시 합성을 통해 해결할 수 있습니다. 더 “구체적인” 컴포넌트가 “일반적인” 컴포넌트를 렌더링하고 props를 통해 내용을 구성합니다.</p>
									
									<pre class="code">
function Dialog(props) {
  return (
    &lt;FancyBorder color="blue"&gt;
      &lt;h1 className="Dialog-title"&gt;
        {props.title}
      &lt;/h1&gt;
      &lt;p className="Dialog-message"&gt;
        {props.message}
      &lt;/p&gt;
    &lt;/FancyBorder&gt;
  );
}

function WelcomeDialog() {
  return (
    &lt;Dialog
      title="Welcome"
      message="Thank you for visiting our spacecraft!" /&gt;
  );
}									
									</pre>
									
									<p>합성은 클래스로 정의된 컴포넌트에서도 동일하게 적용됩니다.</p>
									
									<pre class="code">
function Dialog(props) {
  return (
    &lt;FancyBorder color="blue"&gt;
      &lt;h1 className="Dialog-title"&gt;
        {props.title}
      &lt;/h1&gt;
      &lt;p className="Dialog-message"&gt;
        {props.message}
      &lt;/p&gt;
      {props.children}
    &lt;/FancyBorder&gt;
  );
}

class SignUpDialog extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.handleSignUp = this.handleSignUp.bind(this);
    this.state = {login: ''};
  }

  render() {
    return (
      &lt;Dialog title="Mars Exploration Program"
              message="How should we refer to you?"&gt;
        &lt;input value=&#123;this.state.login&#125;
               onChange={this.handleChange} /&gt;
        &lt;button onClick={this.handleSignUp}&gt;
          Sign Me Up!
        &lt;/button&gt;
      &lt;/Dialog&gt;
    );
  }

  handleChange(e) {
    this.setState({login: e.target.value});
  }

  handleSignUp() {
    alert(`Welcome aboard, $&#123;this.state.login&#125;!`);
  }
}									
									</pre>
									
									<h2>그렇다면 상속은?</h2>
									<p>Facebook에서는 수천 개의 React 컴포넌트를 사용하지만, 컴포넌트를 상속 계층 구조로 작성을 권장할만한 사례를 아직 찾지 못했습니다.</p>

									<p>props와 합성은 명시적이고 안전한 방법으로 컴포넌트의 모양과 동작을 커스터마이징하는데 필요한 모든 유연성을 제공합니다. 컴포넌트가 원시 타입의 값, React 엘리먼트 혹은 함수 등 어떠한 props도 받을 수 있다는 것을 기억하세요.</p>

									<p>If you want to reuse non-UI functionality between components, we suggest extracting it into a separate JavaScript module. The components may import it and use that function, object, or class, without extending it.</p>

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