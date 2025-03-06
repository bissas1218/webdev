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
									
									<h1>접근성</h1>
									
									<h2>접근성이 필요한 이유</h2>
									
									<p>웹 접근성(별칭: a11y)은 모두가 사용할 수 있도록 웹사이트를 디자인, 개발하는 것을 의미합니다. 보조과학기술(assistive technology)들이 웹페이지들을 해석할 수 있도록 접근성을 갖추는 것이 필요합니다.</p>

									<p>React는 접근성을 갖춘 웹사이트를 만들 수 있도록 모든 지원을 하고 있으며, 대부분은 표준 HTML 기술이 사용됩니다.</p>
									
									<h2>표준 및 지침</h2>
									<h3>WCAG</h3>
									<p><a href="https://www.w3.org/WAI/standards-guidelines/wcag/" target="_blank">Web Content Accessibility Guidelines</a>는 접근성을 갖춘 웹사이트를 만드는 데 필요한 지침을 제공합니다.</p>

									<p>아래 WCAG 체크리스트를 통해 간략하게 살펴볼 수 있습니다.</p>

									<ul>
										<li><a href="https://www.wuhcag.com/wcag-checklist/" target="_blank">Wuhcag의 WCAG 체크리스트</a></li>
										<li><a href="https://webaim.org/standards/wcag/checklist" target="_blank">WebAIM의 WCAG 체크리스트</a></li>
										<li><a href="https://www.a11yproject.com/checklist/" target="_blank">The A11Y Project의 체크리스트</a></li>
									</ul>

									<h3>WAI-ARIA</h3>
									<p><a href="https://www.w3.org/WAI/standards-guidelines/aria/" target="_blank">Web Accessibility Initiative - Accessible Rich Internet Applications</a> 문서에는 접근성을 갖춘 JavaScript 위젯을 만드는 데 필요한 기술들이 담겨있습니다.</p>

									<p>참고로, JSX에서는 모든 aria-* HTML 어트리뷰트를 지원하고 있습니다. React에서 대부분의 DOM 프로퍼티와 어트리뷰트에 대한 값이 캐멀 케이스로 지원되는 반면, aria-*와 같은 어트리뷰트는 일반적인 HTML과 마찬가지로 hypen-case(혹은 kebab-case, lisp-case 등)로 작성해야 합니다.</p>

									<pre class="code">
&lt;input
  type="text"
  aria-label={labelText}
  aria-required="true"
  onChange={onchangeHandler}
  value={inputValue}
  name="name"
/&gt;									
									</pre>
									
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