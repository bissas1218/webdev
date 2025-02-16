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
									
									<h2>웹 사이트에 React 추가하기</h2>
									<p>React는 필요한 만큼만 사용하면 됩니다. 적게든 많게든 말이죠.</p>
									<p>React는 처음부터 점진적으로 도입할 수 있게 설계되었습니다. 그래서 React는 필요한 만큼만 사용하면 됩니다. 아마 기존 페이지에 “상호작용”이라는 조미료를 첨가하기만 하고 싶을 수도 있습니다. 이럴 때 React 컴포넌트를 쓰면 좋습니다.</p>
									<p>오늘날 웹사이트의 대부분은 싱글 페이지가 아니고 그래야 할 필요도 없습니다. 빌드 도구 없이 몇 줄의 코드만으로 웹사이트의 작은 부분에 먼저 React를 도입해보세요. React의 비중을 천천히 늘릴 수도 있고 아니면 동적인 위젯을 몇 개 추가하는 것으로 끝낼 수도 있습니다.</p>
									
									<h2>1분 내로 React 추가하기</h2>
									<p>이 글에서는 기존 페이지에 React를 추가하는 법에 대해서 다룹니다. 기존의 웹사이트에서 시도 해보셔도 좋고, 연습삼아 새로운 HTML 파일에서 시도해보셔도 좋습니다.</p>
									<p>복잡한 도구를 쓰거나 뭔가를 따로 설치해야 할 필요도 없습니다. 약간의 시간과 함께 인터넷만 연결 되어 있다면 이 문서에서 다루는 것을 모두 해볼 수 있습니다.</p>
									
									<pre class="code">

&lt;div id="like_button_container"&gt;&lt;/div&gt;

&lt;script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin&gt;&lt;/script&gt;
&lt;script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin&gt;&lt;/script&gt;

&lt;script&gt;

const e = React.createElement;

class LikeButton extends React.Component {
	constructor(props) {
    	super(props);
    	this.state = { liked: false };
  	}

  	render() {
    	if (this.state.liked) {
      		return 'You liked this.';
    	}

    	return e(
      		'button',
      		{ onClick: () => this.setState({ liked: true }) },
      	'Like'
    	);
  	}
}

&lt;!-- 만든 React 컴포넌트를 실행. --&gt;
const domContainer = document.querySelector('#like_button_container');
const root = ReactDOM.createRoot(domContainer);
root.render(e(LikeButton));
	
&lt;/script&gt;

									
									</pre>
								</section>

							</div>
							<div class="col-2">

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