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
									
									<h2>이벤트 처리하기</h2>
									<p>React 엘리먼트에서 이벤트를 처리하는 방식은 DOM 엘리먼트에서 이벤트를 처리하는 방식과 매우 유사합니다. 몇 가지 문법 차이는 다음과 같습니다.</p>

									<ul>
										<li>React의 이벤트는 소문자 대신 캐멀 케이스(camelCase)를 사용합니다.</li>
										<li>JSX를 사용하여 문자열이 아닌 함수로 이벤트 핸들러를 전달합니다.</li>
									</ul>
									<p>예를 들어, HTML은 다음과 같습니다.</p>
									
									<pre class="code">
&lt;button onclick="activateLasers()"&gt;
  Activate Lasers
&lt;/button&gt;									
									</pre>
									<p>React에서는 약간 다릅니다.</p>
									
									<pre class="code">
&lt;button onClick={activateLasers}&gt;
  Activate Lasers
&lt;/button&gt;									
									</pre>
									
									<p>또 다른 차이점으로, React에서는 false를 반환해도 기본 동작을 방지할 수 없습니다. 반드시 preventDefault를 명시적으로 호출해야 합니다. 예를 들어, 일반 HTML에서 폼을 제출할 때 가지고 있는 기본 동작을 방지하기 위해 다음과 같은 코드를 작성할 수 있습니다.</p>
									<pre class="code">
&lt;form onsubmit="console.log('You clicked submit.'); return false"&gt;
  &lt;button type="submit"&gt;Submit&lt;/button&gt;
&lt;/form&gt;									
									</pre>
									
									<p>React에서는 다음과 같이 작성할 수 있습니다.</p>
									
									<pre class="code">
function Form() {
  function handleSubmit(e) {
    e.preventDefault();
    console.log('You clicked submit.');
  }

  return (
    &lt;form onSubmit={handleSubmit}&gt;
      &lt;button type="submit"&gt;Submit&lt;/button&gt;
    &lt;/form&gt;
  );
}									
									</pre>
									<p>여기서 e는 합성 이벤트입니다. React는 W3C 명세에 따라 합성 이벤트를 정의하기 때문에 브라우저 호환성에 대해 걱정할 필요가 없습니다. React 이벤트는 브라우저 고유 이벤트와 정확히 동일하게 동작하지는 않습니다. 더 자세한 사항은 합성 이벤트을 참고하시기 바랍니다.</p>
									<p>React를 사용할 때 DOM 엘리먼트가 생성된 후 리스너를 추가하기 위해 addEventListener를 호출할 필요가 없습니다. 대신, 엘리먼트가 처음 렌더링될 때 리스너를 제공하면 됩니다.</p>
									<p>ES6 클래스를 사용하여 컴포넌트를 정의할 때, 일반적인 패턴은 이벤트 핸들러를 클래스의 메서드로 만드는 것입니다. 예를 들어, 다음 Toggle 컴포넌트는 사용자가 “ON”과 “OFF” 상태를 토글 할 수 있는 버튼을 렌더링합니다.</p>
									
									<pre class="code">
class Toggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    // 콜백에서 `this`가 작동하려면 아래와 같이 바인딩 해주어야 합니다.
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(prevState =&gt; ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render() {
    return (
      &lt;button onClick={this.handleClick}&gt;
        {this.state.isToggleOn ? 'ON' : 'OFF'}
      &lt;/button&gt;
    );
  }
}									
									</pre>
									
									<p>JSX 콜백 안에서 this의 의미에 대해 주의해야 합니다. JavaScript에서 클래스 메서드는 기본적으로 바인딩되어 있지 않습니다. this.handleClick을 바인딩하지 않고 onClick에 전달하였다면, 함수가 실제 호출될 때 this는 undefined가 됩니다.</p>
									<p>이는 React만의 특수한 동작이 아니며, JavaScript에서 함수가 작동하는 방식의 일부입니다. 일반적으로 onClick={this.handleClick}과 같이 뒤에 ()를 사용하지 않고 메서드를 참조할 경우, 해당 메서드를 바인딩 해야 합니다.</p>
									<p>bind를 호출하는 것이 불편하다면, 이를 해결할 수 있는 두 가지 방법이 있습니다. 콜백을 올바르게 바인딩하기 위해 퍼블릭 클래스 필드 문법을 활용할 수 있다.</p>

									<pre class="code">
class LoggingButton extends React.Component {
  // 이 문법은 `this`가 handleClick 내에서 바인딩되도록 합니다.
  // 주의: 이 문법은 *실험적인* 문법입니다.
  handleClick = () =&gt; {
    console.log('this is:', this);
  };

  render() {
    return (
      &lt;button onClick={this.handleClick}&gt;
        Click me
      &lt;/button&gt;
    );
  }
}									
									</pre>
									<p>Create React App에서는 이 문법이 기본적으로 설정되어 있습니다.</p>
									<p>클래스 필드 문법을 사용하고 있지 않다면, 콜백에 화살표 함수를 사용하는 방법도 있습니다.</p>
									
									<pre class="code">
class LoggingButton extends React.Component {
  handleClick() {
    console.log('this is:', this);
  }

  render() {
    // 이 문법은 `this`가 handleClick 내에서 바인딩되도록 합니다.
    return (
      &lt;button onClick={() =&gt; this.handleClick()}&gt;
        Click me
      &lt;/button&gt;
    );
  }
}									
									</pre>
									<p>이 문법의 문제점은 LoggingButton이 렌더링될 때마다 다른 콜백이 생성된다는 것입니다. 대부분의 경우 문제가 되지 않으나, 콜백이 하위 컴포넌트에 props로서 전달된다면 그 컴포넌트들은 추가로 다시 렌더링을 수행할 수도 있습니다. 이러한 종류의 성능 문제를 피하고자, 생성자 안에서 바인딩하거나 클래스 필드 문법을 사용하는 것을 권장합니다.</p>
									
									<h2>이벤트 핸들러에 인자 전달하기</h2>
									<p>루프 내부에서는 이벤트 핸들러에 추가적인 매개변수를 전달하는 것이 일반적입니다. 예를 들어, id가 행의 ID일 경우 다음 코드가 모두 작동합니다.</p>
									<pre class="code">
&lt;button onClick={(e) =&gt; this.deleteRow(id, e)}&gt;Delete Row&lt;/button&gt;
&lt;button onClick={this.deleteRow.bind(this, id)}&gt;Delete Row&lt;/button&gt;									
									</pre>
									<p>위 두 줄은 동등하며 각각 화살표 함수와 Function.prototype.bind를 사용합니다.</p>
									<p>두 경우 모두 React 이벤트를 나타내는 e 인자가 ID 뒤에 두 번째 인자로 전달됩니다. 화살표 함수를 사용하면 명시적으로 인자를 전달해야 하지만 bind를 사용할 경우 추가 인자가 자동으로 전달됩니다.</p>
									
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