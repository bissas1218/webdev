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
									
									<h2>List와 Key</h2>
									<p>먼저 JavaScript에서 리스트를 어떻게 변환하는지 살펴봅시다.</p>
									<p>아래는 map()함수를 이용하여 numbers 배열의 값을 두배로 만든 후 map()에서 반환하는 새 배열을 doubled 변수에 할당하고 로그를 확인하는 코드입니다.</p>
									
									<pre class="code">
const numbers = [1, 2, 3, 4, 5];
const doubled = numbers.map((number) => number * 2);
console.log(doubled);									
									</pre>
									
									<p>이 코드는 콘솔에 [2, 4, 6, 8, 10]을 출력합니다.</p>
									<p>React에서 배열을 엘리먼트 리스트로 만드는 방식은 이와 거의 동일 합니다.</p>

									<h2>여러개의 컴포넌트 렌더링 하기</h2>
									<p>엘리먼트 모음을 만들고 중괄호 {}를 이용하여 JSX에 포함 시킬 수 있습니다.</p>
									<p>아래의 JavaScript map() 함수를 사용하여 numbers 배열을 반복 실행합니다. 각 항목에 대해 <li> 엘리먼트를 반환하고 엘리먼트 배열의 결과를 listItems에 저장합니다.</p>
									
									<pre class="code">
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((number) =&gt;
  &lt;li&gt;{number}&lt;/li&gt;
);									
									</pre>
									<p>그러면 &lt;ul&gt; 엘리먼트 안에 전체 listItems 배열을 포함할 수 있습니다.</p>
									
									<pre class="code">
&lt;ul&gt;{listItems}&lt;/ul&gt;									
									</pre>
									<p>이 코드는 1부터 5까지의 숫자로 이루어진 리스트를 보여줍니다.</p>

									<h2>기본 리스트 컴포넌트</h2>
									<p>일반적으로 컴포넌트 안에서 리스트를 렌더링합니다.</p>
									<p>이전 예시를 numbers 배열을 받아서 순서 없는 엘리먼트 리스트를 출력하는 컴포넌트로 리팩토링할 수 있습니다.</p>
									
									<pre class="code">
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =&gt;
    &lt;li&gt;{number}&lt;/li&gt;
  );
  return (
    &lt;ul&gt;{listItems}&lt;/ul&gt;
  );
}

const numbers = [1, 2, 3, 4, 5];
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(&lt;NumberList numbers={numbers} /&gt;);									
									</pre>
									
									<p>이 코드를 실행하면 리스트의 각 항목에 key를 넣어야 한다는 경고가 표시됩니다. “key”는 엘리먼트 리스트를 만들 때 포함해야 하는 특수한 문자열 어트리뷰트입니다. 다음 섹션에서 key의 중요성에 대해서 더 설명하겠습니다. 이제 numbers.map() 안에서 리스트의 각 항목에 key를 할당하여 키 누락 문제를 해결하겠습니다.</p>
									
									<pre class="code">
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =&gt;
    &lt;li key={number.toString()}&gt;
      {number}
    &lt;/li&gt;
  );
  return (
    &lt;ul&gt;{listItems}&lt;/ul&gt;
  );
}									
									</pre>
									
									<h2>Key</h2>
									<p>Key는 React가 어떤 항목을 변경, 추가 또는 삭제할지 식별하는 것을 돕습니다. key는 엘리먼트에 안정적인 고유성을 부여하기 위해 배열 내부의 엘리먼트에 지정해야 합니다.</p>
									
									<pre class="code">
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((number) =&gt;
  &lt;li key={number.toString()}&gt;
    {number}
  &lt;/li&gt;
);									
									</pre>
									
									<p>Key를 선택하는 가장 좋은 방법은 리스트의 다른 항목들 사이에서 해당 항목을 고유하게 식별할 수 있는 문자열을 사용하는 것입니다. 대부분의 경우 데이터의 ID를 key로 사용합니다.</p>
									
									<pre class="code">
const todoItems = todos.map((todo) =&gt;
  &lt;li key={todo.id}&gt;
    {todo.text}
  &lt;/li&gt;
);									
									</pre>
									
									<p>렌더링 한 항목에 대한 안정적인 ID가 없다면 최후의 수단으로 항목의 인덱스를 key로 사용할 수 있습니다.</p>
									
									<pre class="code">
const todoItems = todos.map((todo, index) =&gt;
  // Only do this if items have no stable IDs
  &lt;li key={index}&gt;
    {todo.text}
  &lt;/li&gt;
);									
									</pre>
									
									<p>항목의 순서가 바뀔 수 있는 경우 key에 인덱스를 사용하는 것은 권장하지 않습니다. 이로 인해 성능이 저하되거나 컴포넌트의 state와 관련된 문제가 발생할 수 있습니다. Robin Pokorny’s가 작성한 글인 인덱스를 key로 사용할 경우 부정적인 영향에 대한 상세 설명을 참고하시길 바랍니다. 리스트 항목에 명시적으로 key를 지정하지 않으면 React는 기본적으로 인덱스를 key로 사용합니다.</p>
									<p>더 자세히 알고 싶다면 왜 key가 필요한가에 대한 더 자세한 설명을 읽어보세요.</p>

									<h2>Key로 컴포넌트 추출하기</h2>
									<p>키는 주변 배열의 context에서만 의미가 있습니다.</p>
									<p>예를 들어 ListItem 컴포넌트를 추출 한 경우 ListItem 안에 있는 <li> 엘리먼트가 아니라 배열의 <ListItem /> 엘리먼트가 key를 가져야 합니다.</p>
									<p>예시: 잘못된 Key 사용법</p>
									
									<pre class="code">
function ListItem(props) {
  const value = props.value;
  return (
    // 틀렸습니다! 여기에는 key를 지정할 필요가 없습니다.
    &lt;li key={value.toString()}&gt;
      {value}
    &lt;/li&gt;
  );
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =&gt;
    // 틀렸습니다! 여기에 key를 지정해야 합니다.
    &lt;ListItem value={number} /&gt;
  );
  return (
    &lt;ul&gt;
      {listItems}
    &lt;/ul&gt;
  );
}									
									</pre>
									
									<p>예시: 올바른 Key 사용법</p>
									<pre class="code">
function ListItem(props) {
  // 맞습니다! 여기에는 key를 지정할 필요가 없습니다.
  return &lt;li&gt;{props.value}&lt;/li&gt;;
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =&gt;
    // 맞습니다! 배열 안에 key를 지정해야 합니다.
    &lt;ListItem key={number.toString()} value={number} /&gt;
  );
  return (
    &lt;ul&gt;
      {listItems}
    &lt;/ul&gt;
  );
}									
									</pre>
									<p>경험상 map() 함수 내부에 있는 엘리먼트에 key를 넣어 주는 게 좋습니다.</p>

									<h2>Key는 형제 사이에서만 고유한 값이어야 한다.</h2>
									
									<p>Key는 배열 안에서 형제 사이에서 고유해야 하고 전체 범위에서 고유할 필요는 없습니다. 두 개의 다른 배열을 만들 때 동일한 key를 사용할 수 있습니다.</p>
									
									<pre class="code">
function Blog(props) {
  const sidebar = (
    &lt;ul&gt;
      {props.posts.map((post) =&gt;
        &lt;li key={post.id}&gt;
          {post.title}
        &lt;/li&gt;
      )}
    &lt;/ul&gt;
  );
  const content = props.posts.map((post) =&gt;
    &lt;div key={post.id}&gt;
      &lt;h3&gt;{post.title}&lt;/h3&gt;
      &lt;p&gt;{post.content}&lt;/p&gt;
    &lt;/div&gt;
  );
  return (
    &lt;div&gt;
      {sidebar}
      &lt;hr /&gt;
      {content}
    &lt;/div&gt;
  );
}

const posts = [
  {id: 1, title: 'Hello World', content: 'Welcome to learning React!'},
  {id: 2, title: 'Installation', content: 'You can install React from npm.'}
];

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(&lt;Blog posts={posts} /&gt;);																		
									</pre>
									
									<p>React에서 key는 힌트를 제공하지만 컴포넌트로 전달하지는 않습니다. 컴포넌트에서 key와 동일한 값이 필요하면 다른 이름의 prop으로 명시적으로 전달합니다.</p>
									
									<pre class="code">
const content = posts.map((post) =&gt;
  &lt;Post
    key={post.id}
    id={post.id}
    title={post.title} /&gt;
);									
									</pre>
									
									<p>위 예시에서 Post 컴포넌트는 props.id를 읽을 수 있지만 props.key는 읽을 수 없습니다.</p>
									
									<h2>JSX에 map() 포함시키기</h2>
									<p>위 예시에서 별도의 listItems 변수를 선언하고 이를 JSX에 포함했습니다.</p>
									
									<pre class="code">
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =&gt;
    &lt;ListItem key={number.toString()}
              value={number} /&gt;
  );
  return (
    &lt;ul&gt;
      {listItems}
    &lt;/ul&gt;
  );
}									
									</pre>

									<p>JSX를 사용하면 중괄호 안에 모든 표현식을 포함 시킬 수 있으므로 map() 함수의 결과를 인라인으로 처리할 수 있습니다.</p>
									
									<pre class="code">
function NumberList(props) {
  const numbers = props.numbers;
  return (
    &lt;ul&gt;
      {numbers.map((number) =&gt;
        &lt;ListItem key={number.toString()}
                  value={number} /&gt;
      )}
    &lt;/ul&gt;
  );
}									
									</pre>
									
									<p>이 방식을 사용하면 코드가 더 깔끔해 지지만, 이 방식을 남발하는 것은 좋지 않습니다. JavaScript와 마찬가지로 가독성을 위해 변수로 추출해야 할지 아니면 인라인으로 넣을지는 개발자가 직접 판단해야 합니다. map() 함수가 너무 중첩된다면 컴포넌트로 추출 하는 것이 좋습니다.</p>
									
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