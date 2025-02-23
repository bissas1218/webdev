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
									<p>Class는 객체를 생성하기 위한 템플릿입니다. 클래스는 데이터와 이를 조작하는 코드를 하나로 추상화합니다. JavaScript에서 클래스는 프로토타입을 이용해서 만들어졌지만 ES5의 클래스 의미와는 다른 문법과 의미를 가집니다.</p>
									
									<h2>Class 정의</h2>
									<p>Class는 사실 "특별한 함수"입니다. 함수를 함수 표현식과 함수 선언으로 정의할 수 있듯이 class문법도 class표현식 and class선언 두 가지 방법을 제공합니다.</p>
									
									<h2>Class 선언</h2>
									<p>Class를 정의하는 한 가지 방법은 class선언을 이용하는 것입니다. class를 선언하기 위해서는 클래스의 이름(여기서 "Rectangle")과 함께 class 키워드를 사용해야 합니다.</p>
									<pre class="code">
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}									
									</pre>
									<h2>Hoisting</h2>
									<p>함수 선언과 클래스 선언의 중요한 차이점은 함수의 경우 정의하기 전에 호출할 수 있지만, 클래스는 반드시 정의한 뒤에 사용할 수 있다는 점입니다. 다음 코드는 ReferenceError를 던질 것입니다.</p>
									<pre class="code">
const p = new Rectangle(); // ReferenceError

class Rectangle {}									
									</pre>
									<p>예외가 발생하는 이유는 클래스가 호이스팅될 때 초기화는 되지 않기 때문입니다.</p>
									
									<h2>Class 표현식</h2>
									<p>Class 표현식은 class를 정의하는 또 다른 방법입니다. Class표현식은 이름을 가질 수도 있고, 갖지 않을 수도 있습니다. 이름을 가진 class표현식의 이름은 클래스 body의 local scope에 한해 유효합니다. (하지만, 클래스의(인스턴스 이름이 아닌) name속성을 통해 찾을 수 있습니다).</p>
									<pre class="code">
// unnamed
let Rectangle = class {
  constructor(height, width){
    this.height = height;
    this.width = width;
  }
};						
console.log(Rectangle.name);
// 출력: "Rectangle"
			
// named
let Rectangle = class Rectangle2 {
  constructor(height, width){
    this.height = height;
    this.width = width;
  }
};			
console.log(Rectangle.name);
// 출력: "Rectangle2"
									</pre>
									
									
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



let Rectangle = class Rectangle2 {
	  constructor(height, width){
	    this.height = height;
	    this.width = width;
	  }
	};						
console.log(Rectangle.name);

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