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
									
									<h2>State 끌어올리기</h2>
									<p>종종 동일한 데이터에 대한 변경사항을 여러 컴포넌트에 반영해야 할 필요가 있습니다. 이럴 때는 가장 가까운 공통 조상으로 state를 끌어올리는 것이 좋습니다. 이런 일을 어떻게 할 수 있을지 지금부터 살펴봅시다.</p>
									<p>이번 섹션에서는 주어진 온도에서 물의 끓는 여부를 추정하는 온도 계산기를 만들어볼 것입니다.</p>
									<p>먼저 BoilingVerdict라는 이름의 컴포넌트부터 만들어봅시다. 이 컴포넌트는 섭씨온도를 의미하는 celsius prop를 받아서 이 온도가 물이 끓기에 충분한지 여부를 출력합니다.</p>
									
									<pre class="code">
function BoilingVerdict(props) {
  if (props.celsius &gt;= 100) {
    return &lt;p&gt;The water would boil.&lt;/p&gt;;
  }
  return &lt;p&gt;The water would not boil.&lt;/p&gt;;
}									
									</pre>
									
									<p>그 다음으로 Calculator라는 컴포넌트를 만들어보겠습니다. 이 컴포넌트는 온도를 입력할 수 있는 &lt;input&gt;을 렌더링하고 그 값을 this.state.temperature에 저장합니다.</p>
									<p>또한 현재 입력값에 대한 BoilingVerdict 컴포넌트를 렌더링합니다.</p>

									<pre class="code">
class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {temperature: ''};
  }

  handleChange(e) {
    this.setState({temperature: e.target.value});
  }

  render() {
    const temperature = this.state.temperature;
    return (
      &lt;fieldset&gt;
        &lt;legend&gt;Enter temperature in Celsius:&lt;/legend&gt;
        &lt;input
          value={temperature}
          onChange={this.handleChange} /&gt;
        &lt;BoilingVerdict
          celsius={parseFloat(temperature)} /&gt;
      &lt;/fieldset&gt;
    );
  }
}									
									</pre>
									
									<h2>두 번째 Input 추가하기</h2>
									
									<p>새 요구사항으로써 섭씨 입력 필드뿐만 아니라 화씨 입력 필드를 추가하고 두 필드 간에 동기화 상태를 유지하도록 해보겠습니다.</p>
									<p>Calculator에서 TemperatureInput 컴포넌트를 빼내는 작업부터 시작해봅시다. 또한 "c" 또는 "f"의 값을 가질 수 있는 scale prop를 추가할 것입니다.</p>

									<pre class="code">
const scaleNames = {
  c: 'Celsius',
  f: 'Fahrenheit'
};

class TemperatureInput extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {temperature: ''};
  }

  handleChange(e) {
    this.setState({temperature: e.target.value});
  }

  render() {
    const temperature = this.state.temperature;
    const scale = this.props.scale;
    return (
      &lt;fieldset&gt;
        &lt;legend&gt;Enter temperature in {scaleNames[scale]}:&lt;/legend&gt;
        &lt;input value={temperature}
               onChange={this.handleChange} /&gt;
      &lt;/fieldset&gt;
    );
  }
}									
									</pre>
									
									<p>이제 Calculator가 분리된 두 개의 온도 입력 필드를 렌더링하도록 변경할 수 있습니다.</p>
									
									<pre class="code">
class Calculator extends React.Component {
  render() {
    return (
      &lt;div&gt;
        &lt;TemperatureInput scale="c" /&gt;
        &lt;TemperatureInput scale="f" /&gt;
      &lt;/div&gt;
    );
  }
}									
									</pre>
									
									<p>이제 두 개의 입력 필드를 갖게 되었습니다. 그러나 둘 중 하나에 온도를 입력하더라도 다른 하나는 갱신되지 않는 문제가 있습니다. 이것은 두 입력 필드 간에 동기화 상태를 유지하고자 했던 원래 요구사항과는 맞지 않습니다.</p>
									<p>또한 Calculator에서 BoilingVerdict도 역시 보여줄 수 없는 상황입니다. 현재 입력된 온도 정보가 TemperatureInput 안에 숨겨져 있으므로 Calculator는 그 값을 알 수 없기 때문입니다.</p>

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