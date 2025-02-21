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
									
									<h2>클래스</h2>
									<p>JavaScript는 Java와 매우 유사한 class 문법을 제공합니다.</p>
									<pre class="code">
class Person {
  constructor(name){
    this.name = name;
  }
  sayHello(){
    return `Hello, I'm $&#123;this.name&#125!`;
  }
}

const p = new Person("Maria");
console.log(p.sayHello());
									</pre>
									<p>JavaScript 클래스는 new 연산자로 인스턴스화해야 하는 함수일 뿐입니다. 클래스가 인스턴스화될 때마다, 클래스가 지정한 메서드와 속성을 포함하는 객체를 반환합니다. 클래스는 코드 구성을 강제하지 않습니다. 예를 들어, 클래스를 반환하는 함수가 있거나, 파일 당 여러 클래스가 있을 수 있습니다. 다음은 클래스 생성이 어떻게 임시방편일 수 있는지에 대한 예시입니다. 단지 화살표 함수에서 반환된 표현식일 뿐이고, 이 패턴을 믹스인(mixin)이라고 합니다.</p>
									<pre class="code">
const withAuthentication = (cls) =>
  class extends cls {
    authenticate() {
      // …
    }
  };

class Admin extends withAuthentication(Person) {
  // …
}
									</pre>
									<p>정적 속성은 static을 추가하여 생성됩니다. Private 속성은 hash(#) (private 키워드가 아닙니다)를 앞에 추가하여 생성됩니다. 이 해시는 속성 이름의 필수적인 부분입니다. (Python에서 #을 _로 생각하세요.) 대부분의 다른 언어와 달리, 클래스 본체 외부에서 Private 속성을 읽을 수 있는 방법이 전혀 없습니다. 파생 클래스(derived classes)에서도 마찬가지입니다.</p>
									
								</section>
<script>

class Person {
	constructor(name){
		console.log('constructor:'+name);
		this.name = name;
	}
	sayHello(){
		console.log('sayHello');
		return `Hello, I'm `+this.name+`!`;
	}
}

const p = new Person("Maria");
console.log(p.sayHello());

</script>
							</div>
							<div class="col-2">

								<jsp:include page="/study/javascript/right.jsp"></jsp:include>
								

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