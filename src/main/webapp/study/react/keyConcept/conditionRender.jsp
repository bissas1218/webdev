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
									
									<h2>조건부 렌더링</h2>
									<p>React에서는 원하는 동작을 캡슐화하는 컴포넌트를 만들 수 있습니다. 이렇게 하면 애플리케이션의 상태에 따라서 컴포넌트 중 몇 개만을 렌더링할 수 있습니다.</p>
									<p>React에서 조건부 렌더링은 JavaScript에서의 조건 처리와 같이 동작합니다. if 나 조건부 연산자 와 같은 JavaScript 연산자를 현재 상태를 나타내는 엘리먼트를 만드는 데에 사용하세요. 그러면 React는 현재 상태에 맞게 UI를 업데이트할 것입니다.</p>
									<p>아래 두 컴포넌트가 있다고 가정해 봅시다.</p>
									
									<pre class="code">
function UserGreeting(props) {
  return &lt;h1&gt;Welcome back!&lt;/h1&gt;;
}

function GuestGreeting(props) {
  return &lt;h1&gt;Please sign up.&lt;/h1&gt;;
}									
									</pre>
									
									<p>이제 사용자의 로그인 상태에 맞게 위 컴포넌트 중 하나를 보여주는 Greeting 컴포넌트를 만듭니다.</p>
									
									<pre class="code">
function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return &lt;UserGreeting /&gt;;
  }
  return &lt;GuestGreeting /&gt;;
}

const root = ReactDOM.createRoot(document.getElementById('root')); 
// Try changing to isLoggedIn={true}:
root.render(&lt;Greeting isLoggedIn={false} /&gt;);									
									</pre>
									<p>이 예시는 isLoggedIn prop에 따라서 다른 인사말을 렌더링 합니다.</p>
									
									<h2>엘리먼트 변수</h2>
									<p>엘리먼트를 저장하기 위해 변수를 사용할 수 있습니다. 출력의 다른 부분은 변하지 않은 채로 컴포넌트의 일부를 조건부로 렌더링 할 수 있습니다.</p>
									<p>로그아웃과 로그인 버튼을 나타내는 두 컴포넌트가 있다고 가정해 보세요.</p>
									
									<pre class="code">
function LoginButton(props) {
  return (
    &lt;button onClick={props.onClick}&gt;
      Login
    &lt;/button&gt;
  );
}

function LogoutButton(props) {
  return (
    &lt;button onClick={props.onClick}&gt;
      Logout
    &lt;/button&gt;
  );
}									
									</pre>
									<p>아래의 예시에서는 LoginControl이라는 유상태 컴포넌트 를 만들 것입니다.</p>
									<p>이 컴포넌트는 현재 상태에 맞게 &lt;LoginButton /&gt;이나 &lt;LogoutButton /&gt;을 렌더링합니다. 또한 이전 예시에서의 &lt;Greeting /&gt;도 함께 렌더링합니다.</p>
									
									<pre class="code">
class LoginControl extends React.Component {
  constructor(props) {
    super(props);
    this.handleLoginClick = this.handleLoginClick.bind(this);
    this.handleLogoutClick = this.handleLogoutClick.bind(this);
    this.state = {isLoggedIn: false};
  }

  handleLoginClick() {
    this.setState({isLoggedIn: true});
  }

  handleLogoutClick() {
    this.setState({isLoggedIn: false});
  }

  render() {
    const isLoggedIn = this.state.isLoggedIn;
    let button;
    if (isLoggedIn) {
      button = &lt;LogoutButton onClick={this.handleLogoutClick} /&gt;;
    } else {
      button = &lt;LoginButton onClick={this.handleLoginClick} /&gt;;
    }

    return (
      &lt;div&gt;
        &lt;Greeting isLoggedIn={isLoggedIn} /&gt;
        {button}
      &lt;/div&gt;
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById('root')); 
root.render(&lt;LoginControl /&gt;);									
									</pre>
									
									<p>변수를 선언하고 if를 사용해서 조건부로 렌더링 하는 것은 좋은 방법이지만 더 짧은 구문을 사용하고 싶을 때가 있을 수 있습니다. 여러 조건을 JSX 안에서 인라인(inline)으로 처리할 방법 몇 가지를 아래에서 소개하겠습니다.</p>

									<h2>논리 && 연산자로 If를 인라인으로 표현하기</h2>
									<p>JSX 안에는 중괄호를 이용해서 표현식을 포함 할 수 있습니다. 그 안에 JavaScript의 논리 연산자 &&를 사용하면 쉽게 엘리먼트를 조건부로 넣을 수 있습니다.</p>
									
									<pre class="code">
function Mailbox(props) {
  const unreadMessages = props.unreadMessages;
  return (
    &lt;div&gt;
      &lt;h1&gt;Hello!&lt;/h1&gt;
      {unreadMessages.length &gt; 0 &&
        &lt;h2&gt;
          You have {unreadMessages.length} unread messages.
        &lt;/h2&gt;
      }
    &lt;/div&gt;
  );
}

const messages = ['React', 'Re: React', 'Re:Re: React'];

const root = ReactDOM.createRoot(document.getElementById('root')); 
root.render(&lt;Mailbox unreadMessages={messages} /&gt;);									
									</pre>
									
									<p>JavaScript에서 true && expression은 항상 expression으로 평가되고 false && expression은 항상 false로 평가됩니다.</p>
									<p>따라서 && 뒤의 엘리먼트는 조건이 true일때 출력이 됩니다. 조건이 false라면 React는 무시하고 건너뜁니다.</p>
									<p>falsy 표현식을 반환하면 여전히 && 뒤에 있는 표현식은 건너뛰지만 falsy 표현식이 반환된다는 것에 주의해주세요. 아래 예시에서, &lt;div&gt;0&lt;/div&gt;이 render 메서드에서 반환됩니다.</p>
									
									<pre class="code">
render() {
  const count = 0;
  return (
    &lt;div&gt;
      {count && &lt;h1&gt;Messages: {count}&lt;/h1&gt;}
    &lt;/div&gt;
  );
}									
									</pre>
									
									<h2>조건부 연산자로 If-Else구문 인라인으로 표현하기</h2>
									<p>엘리먼트를 조건부로 렌더링하는 다른 방법은 조건부 연산자인 condition ? true: false를 사용하는 것입니다.</p>
									<p>아래의 예시에서는 짧은 구문을 조건부로 렌더링합니다.</p>
									
									<pre class="code">
render() {
  const isLoggedIn = this.state.isLoggedIn;
  return (
    &lt;div&gt;
      The user is &lt;b&gt;{isLoggedIn ? 'currently' : 'not'}&lt;/b&gt; logged in.
    &lt;/div&gt;
  );
}									
									</pre>
									<p>가독성은 좀 떨어지지만, 더 큰 표현식에도 이 구문을 사용할 수 있습니다.</p>
									
									<pre class="code">
render() {
  const isLoggedIn = this.state.isLoggedIn;
  return (
    &lt;div&gt;
      {isLoggedIn
        ? &lt;LogoutButton onClick={this.handleLogoutClick} /&gt;
        : &lt;LoginButton onClick={this.handleLoginClick} /&gt;
      }
    &lt;/div&gt;
  );
}									
									</pre>
									
									<p>JavaScript와 마찬가지로, 가독성이 좋다고 생각하는 방식을 선택하면 됩니다. 또한 조건이 너무 복잡하다면 컴포넌트를 분리하기 좋을 때 일 수도 있다는 것을 기억하세요.</p>

									<h2>컴포넌트가 렌더링하는 것을 막기</h2>
									
									<p>가끔 다른 컴포넌트에 의해 렌더링될 때 컴포넌트 자체를 숨기고 싶을 때가 있을 수 있습니다. 이때는 렌더링 결과를 출력하는 대신 null을 반환하면 해결할 수 있습니다.</p>
									<p>아래의 예시에서는 &lt;WarningBanner /&gt;가 warn prop의 값에 의해서 렌더링됩니다. prop이 false라면 컴포넌트는 렌더링하지 않게 됩니다.</p>
									
									<pre class="code">
function WarningBanner(props) {
  if (!props.warn) {
    return null;
  }

  return (
    &lt;div className="warning"&gt;
      Warning!
    &lt;/div&gt;
  );
}

class Page extends React.Component {
  constructor(props) {
    super(props);
    this.state = {showWarning: true};
    this.handleToggleClick = this.handleToggleClick.bind(this);
  }

  handleToggleClick() {
    this.setState(state =&gt; ({
      showWarning: !state.showWarning
    }));
  }

  render() {
    return (
      &lt;div&gt;
        &lt;WarningBanner warn={this.state.showWarning} /&gt;
        &lt;button onClick={this.handleToggleClick}&gt;
          {this.state.showWarning ? 'Hide' : 'Show'}
        &lt;/button&gt;
      &lt;/div&gt;
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById('root')); 
root.render(&lt;Page /&gt;);									
									</pre>
									
									<p>컴포넌트의 render 메서드로부터 null을 반환하는 것은 생명주기 메서드 호출에 영향을 주지 않습니다. 그 예로 componentDidUpdate는 계속해서 호출되게 됩니다.</p>
									
								</section>
<script>

</script>
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