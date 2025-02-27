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
									
									<h2>폼</h2>
									<p>HTML 폼 엘리먼트는 폼 엘리먼트 자체가 내부 상태를 가지기 때문에, React의 다른 DOM 엘리먼트와 다르게 동작합니다. 예를 들어, 순수한 HTML에서 이 폼은 name을 입력받습니다.</p>
									
									<pre class="code">
&lt;form&gt;
  &lt;label&gt;
    Name:
    &lt;input type="text" name="name" /&gt;
  &lt;/label&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;									
									</pre>
									<p>이 폼은 사용자가 폼을 제출하면 새로운 페이지로 이동하는 기본 HTML 폼 동작을 수행합니다. React에서 동일한 동작을 원한다면 그대로 사용하면 됩니다. 그러나 대부분의 경우, JavaScript 함수로 폼의 제출을 처리하고 사용자가 폼에 입력한 데이터에 접근하도록 하는 것이 편리합니다. 이를 위한 표준 방식은 “제어 컴포넌트 (controlled components)“라고 불리는 기술을 이용하는 것입니다.</p>
									
									<h2>제어 컴포넌트 (Controlled Component)</h2>
									<p>HTML에서 &lt;input&gt;, &lt;textarea&gt;, &lt;select&gt;와 같은 폼 엘리먼트는 일반적으로 사용자의 입력을 기반으로 자신의 state를 관리하고 업데이트합니다. React에서는 변경할 수 있는 state가 일반적으로 컴포넌트의 state 속성에 유지되며 setState()에 의해 업데이트됩니다.</p>
									<p>우리는 React state를 “신뢰 가능한 단일 출처 (single source of truth)“로 만들어 두 요소를 결합할 수 있습니다. 그러면 폼을 렌더링하는 React 컴포넌트는 폼에 발생하는 사용자 입력값을 제어합니다. 이러한 방식으로 React에 의해 값이 제어되는 입력 폼 엘리먼트를 “제어 컴포넌트 (controlled component)“라고 합니다.</p>
									<p>예를 들어, 이전 예시가 전송될 때 이름을 기록하길 원한다면 폼을 제어 컴포넌트 (controlled component)로 작성할 수 있습니다.</p>
									
									<pre class="code">
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('A name was submitted: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      &lt;form onSubmit={this.handleSubmit}&gt;
        &lt;label&gt;
          Name:
          &lt;input type="text" value={this.state.value} onChange={this.handleChange} /&gt;
        &lt;/label&gt;
        &lt;input type="submit" value="Submit" /&gt;
      &lt;/form&gt;
    );
  }
}									
									</pre>
									<p>value 어트리뷰트는 폼 엘리먼트에 설정되므로 표시되는 값은 항상 this.state.value가 되고 React state는 신뢰 가능한 단일 출처 (single source of truth)가 됩니다. React state를 업데이트하기 위해 모든 키 입력에서 handleChange가 동작하기 때문에 사용자가 입력할 때 보여지는 값이 업데이트됩니다.</p>
									<p>제어 컴포넌트로 사용하면, input의 값은 항상 React state에 의해 결정됩니다. 코드를 조금 더 작성해야 한다는 의미이지만, 다른 UI 엘리먼트에 input의 값을 전달하거나 다른 이벤트 핸들러에서 값을 재설정할 수 있습니다.</p>
									
									<h2>textarea 태그</h2>
									<p>HTML에서 &lt;textarea&gt; 엘리먼트는 텍스트를 자식으로 정의합니다.</textarea>
									
									<pre class="code">
&lt;textarea&gt;
  Hello there, this is some text in a text area
&lt;/textarea&gt;									
									</pre>
									
									<p>React에서 &lt;textarea&gt;는 value 어트리뷰트를 대신 사용합니다. 이렇게하면 &lt;textarea&gt;를 사용하는 폼은 한 줄 입력을 사용하는 폼과 비슷하게 작성할 수 있습니다.</p>
									
									<pre class="code">
class EssayForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: 'Please write an essay about your favorite DOM element.'
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('An essay was submitted: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      &lt;form onSubmit={this.handleSubmit}&gt;
        &lt;label&gt;
          Essay:
          &lt;textarea value={this.state.value} onChange={this.handleChange} /&gt;
        &lt;/label&gt;
        &lt;input type="submit" value="Submit" /&gt;
      &lt;/form&gt;
    );
  }
}									
									</pre>
									<p>this.state.value를 생성자에서 초기화하므로 textarea는 일부 텍스트를 가진채 시작되는 점을 주의해주세요.</p>
									
									<h2>select 태그</h2>
									<p>HTML에서 &lt;select&gt;는 드롭 다운 목록을 만듭니다. 예를 들어, 이 HTML은 과일 드롭 다운 목록을 만듭니다.</p>
									
									<pre class="code">
&lt;select&gt;
  &lt;option value="grapefruit"&gt;Grapefruit&lt;/option&gt;
  &lt;option value="lime"&gt;Lime&lt;/option&gt;
  &lt;option selected value="coconut"&gt;Coconut&lt;/option&gt;
  &lt;option value="mango"&gt;Mango&lt;/option&gt;
&lt;/select&gt;									
									</pre>
									
									<p>selected 옵션이 있으므로 Coconut 옵션이 초기값이 되는 점을 주의해주세요. React에서는 selected 어트리뷰트를 사용하는 대신 최상단 select태그에 value 어트리뷰트를 사용합니다. 한 곳에서 업데이트만 하면되기 때문에 제어 컴포넌트에서 사용하기 더 편합니다. 아래는 예시입니다.</p>
									
									<pre class="code">
class FlavorForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: 'coconut'};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('Your favorite flavor is: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      &lt;form onSubmit={this.handleSubmit}&gt;
        &lt;label&gt;
          Pick your favorite flavor:
          &lt;select value={this.state.value} onChange={this.handleChange}&gt;
            &lt;option value="grapefruit"&gt;Grapefruit&lt;/option&gt;
            &lt;option value="lime"&gt;Lime&lt;/option&gt;
            &lt;option value="coconut"&gt;Coconut&lt;/option&gt;
            &lt;option value="mango"&gt;Mango&lt;/option&gt;
          &lt;/select&gt;
        &lt;/label&gt;
        &lt;input type="submit" value="Submit" /&gt;
      &lt;/form&gt;
    );
  }
}									
									</pre>
									
									<p>전반적으로 &lt;input type="text"&gt;, &lt;textarea&gt; 및 &lt;select&gt; 모두 매우 비슷하게 동작합니다. 모두 제어 컴포넌트를 구현하는데 value 어트리뷰트를 허용합니다.</p>
									
									<h3>주의</h3>
									<blockquote>select 태그에 multiple 옵션을 허용한다면 value 어트리뷰트에 배열을 전달할 수 있습니다.
										<pre class="code">
&lt;select multiple={true} value={['B', 'C']}&gt;
										</pre>
									</blockquote>
									
									<h2>file input 태그</h2>
									<p>HTML에서 &lt;input type="file"&gt;는 사용자가 하나 이상의 파일을 자신의 장치 저장소에서 서버로 업로드하거나 File API를 통해 JavaScript로 조작할 수 있습니다.</p>
									
									<pre class="code">
&lt;input type="file" /&gt;									
									</pre>
									
									<p>값이 읽기 전용이기 때문에 React에서는 비제어 컴포넌트입니다. 문서 뒷부분에서 다른 비제어 컴포넌트와 함께 설명하고 있습니다.</p>
									
									<h2>다중 입력 제어하기</h2>
									<p>여러 input 엘리먼트를 제어해야할 때, 각 엘리먼트에 name 어트리뷰트를 추가하고 event.target.name 값을 통해 핸들러가 어떤 작업을 할 지 선택할 수 있게 해줍니다.</p>
									<p>아래는 예시입니다.</p>
									
									<pre class="code">
class Reservation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isGoing: true,
      numberOfGuests: 2
    };

    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  render() {
    return (
      &lt;form&gt;
        &lt;label&gt;
          Is going:
          &lt;input
            name="isGoing"
            type="checkbox"
            checked={this.state.isGoing}
            onChange={this.handleInputChange} /&gt;
        &lt;/label&gt;
        &lt;br /&gt;
        &lt;label&gt;
          Number of guests:
          &lt;input
            name="numberOfGuests"
            type="number"
            value={this.state.numberOfGuests}
            onChange={this.handleInputChange} /&gt;
        &lt;/label&gt;
      &lt;/form&gt;
    );
  }
}									
									</pre>
									
									<p>주어진 input 태그의 name에 일치하는 state를 업데이트하기 위해 ES6의 computed property name 구문을 사용하고 있습니다.</p>
									
									<pre class="code">
this.setState({
  [name]: value
});									
									</pre>
									
									<p>ES5 코드는 아래와 같습니다.</p>
									
									<pre class="code">
var partialState = {};
partialState[name] = value;
this.setState(partialState);									
									</pre>
									
									<p>또한, setState()는 자동적으로 현재 state에 일부 state를 병합하기 때문에 바뀐 부분에 대해서만 호출하면 됩니다.</p>
									
									<h2>제어되는 Input Null 값</h2>
									<p>제어 컴포넌트에 value prop을 지정하면 의도하지 않는 한 사용자가 변경할 수 없습니다. value를 설정했는데 여전히 수정할 수 있다면 실수로 value를 undefined나 null로 설정했을 수 있습니다.</p>
									<p>아래 코드가 이것을 보여줍니다. (첫 번째 입력은 잠겨있지만 잠시 후 입력이 가능해집니다.)</p>
									
									<pre class="code">
ReactDOM.createRoot(mountNode).render(&lt;input value="hi" /&gt;);

setTimeout(function() {
  ReactDOM.createRoot(mountNode).render(&lt;input value={null} /&gt;);
}, 1000);									
									</pre>
									
									<h2>제어 컴포넌트의 대안</h2>
									<p>데이터를 변경할 수 있는 모든 방법에 대해 이벤트 핸들러를 작성하고 React 컴포넌트를 통해 모든 입력 상태를 연결해야 하기 때문에 때로는 제어 컴포넌트를 사용하는 게 지루할 수 있습니다. 특히 기존의 코드베이스를 React로 변경하고자 할 때나 React가 아닌 라이브러리와 React 애플리케이션을 통합하고자 할 때 짜증날 수 있습니다. 이러한 경우에 입력 폼을 구현하기 위한 대체 기술인 비제어 컴포넌트를 확인할 수 있습니다.</p>
									
									<h2>완전한 해결책</h2>
									<p>유효성 검사, 방문한 필드 추적 및 폼 제출 처리와 같은 완벽한 해결을 원한다면 Formik이 대중적인 선택 중 하나입니다. 그러나 Formik은 제어 컴포넌트 및 state 관리에 기초하기 때문에 배우는 걸 쉽게 생각하면 안 됩니다.</p>
									
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