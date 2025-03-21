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
									
									<h2>React로 사고하기</h2>
									<p>React는 JavaScript로 규모가 크고 빠른 웹 애플리케이션을 만드는 가장 좋은 방법입니다. React는 Facebook과 Instagram을 통해 확장성을 입증했습니다.</p>
									<p>React의 가장 멋진 점 중 하나는 앱을 설계하는 방식입니다. 이 문서를 통해 React로 상품등을 검색할 수 있는 데이터 테이블을 만드는 과정을 함께 생각해 봅시다.</p>
									
									<h2>목업으로 시작하기</h2>
									<p>JSON API와 목업을 디자이너로부터 받았다고 가정해 봅시다. 목업은 다음과 같을 것입니다.</p>
									<img src="/study/react/images/thinking-in-react-mock.png" />
									
									<p>JSON API는 아래와 같은 데이터를 반환합니다.</p>
									<pre class="code">
[
  {category: "Sporting Goods", price: "$49.99", stocked: true, name: "Football"},
  {category: "Sporting Goods", price: "$9.99", stocked: true, name: "Baseball"},
  {category: "Sporting Goods", price: "$29.99", stocked: false, name: "Basketball"},
  {category: "Electronics", price: "$99.99", stocked: true, name: "iPod Touch"},
  {category: "Electronics", price: "$399.99", stocked: false, name: "iPhone 5"},
  {category: "Electronics", price: "$199.99", stocked: true, name: "Nexus 7"}
];									
									</pre>
									
									<h2>1단계: UI를 컴포넌트 계층 구조로 나누기</h2>
									
									<p>우리가 할 첫 번째 일은 모든 컴포넌트(와 하위 컴포넌트)의 주변에 박스를 그리고 그 각각에 이름을 붙이는 것입니다. 디자이너와 함께 일한다면, 이것들을 이미 정해두었을 수 있으니 한번 대화해보세요! 디자이너의 Photoshop 레이어 이름이 React 컴포넌트의 이름이 될 수 있습니다.</p>

									<p>하지만 어떤 것이 컴포넌트가 되어야 할지 어떻게 알 수 있을까요? 우리가 새로운 함수나 객체를 만들 때처럼 만드시면 됩니다. 한 가지 테크닉은 단일 책임 원칙입니다. 이는 하나의 컴포넌트는 한 가지 일을 하는게 이상적이라는 원칙입니다. 하나의 컴포넌트가 커지게 된다면 이는 보다 작은 하위 컴포넌트로 분리되어야 합니다.</p>

									<p>주로 JSON 데이터를 유저에게 보여주기 때문에, 데이터 모델이 적절하게 만들어졌다면, UI(컴포넌트 구조)가 잘 연결될 것입니다. 이는 UI와 데이터 모델이 같은 인포메이션 아키텍처(information architecture)를 가지는 경향이 있기 때문입니다. 각 컴포넌트가 데이터 모델의 한 조각을 나타내도록 분리해주세요.</p>
								
									<img src="/study/react/images/thinking-in-react-components.png" />
									
									<p>다섯개의 컴포넌트로 이루어진 앱을 한번 봅시다. 각각의 컴포넌트에 들어간 데이터는 이탤릭체로 표기했습니다. 이미지의 숫자는 아래 숫자에 해당됩니다.</p>

									<ol>
										<li>FilterableProductTable(노란색): 예시 전체를 포괄합니다.</li>
										<li>SearchBar(파란색): 모든 유저의 입력(user input) 을 받습니다.</li>
										<li>ProductTable(연두색): 유저의 입력(user input)을 기반으로 데이터 콜렉션(data collection)을 필터링 해서 보여줍니다.</li>
										<li>ProductCategoryRow(하늘색): 각 카테고리(category)의 헤더를 보여줍니다.</li>
										<li>ProductRow(빨강색): 각각의 제품(product)에 해당하는 행을 보여줍니다.</li>
									</ol>

									<p>ProductTable을 보면 “Name” 과 “Price” 레이블을 포함한 테이블 헤더만을 가진 컴포넌트는 없습니다. 이 같은 경우, 데이터를 위한 독립된 컴포넌트를 생성할지 생성하지 않을지는 선택입니다. 이 예시에서는 ProductTable의 책임인 데이터 컬렉션(data collection)이 렌더링의 일부이기 때문에 ProductTable을 남겨두었습니다. 그러나 이 헤더가 복잡해지면 (즉 정렬을 위한 기능을 추가하는 등) ProductTableHeader컴포넌트를 만드는 것이 더 합리적일 것입니다.</p>

									<p>이제 목업에서 컴포넌트를 확인하였으므로 이를 계층 구조로 나열해봅시다. 모형의 다른 컴포넌트 내부에 나타나는 컴포넌트는 계층 구조의 자식으로 나타냅니다.</p>

									&#8226; FilterableProductTable<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8226; SearchBar<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8226; ProductTable<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8226; ProductCategoryRow<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8226; ProductRow<br/>

									<h2>2단계: React로 정적인 버전 만들기</h2>
									<p>이제 컴포넌트 계층구조가 만들어졌으니 앱을 실제로 구현해볼 시간입니다. 가장 쉬운 방법은 데이터 모델을 가지고 UI를 렌더링은 되지만 아무 동작도 없는 버전을 만들어보는 것입니다. 이처럼 과정을 나누는 것이 좋은데 정적 버전을 만드는 것은 생각은 적게 필요하지만 타이핑은 많이 필요로 하고, 상호작용을 만드는 것은 생각은 많이 해야 하지만 타이핑은 적게 필요로 하기 때문입니다. 나중에 보다 자세히 살펴봅시다.</p>

									<p>데이터 모델을 렌더링하는 앱의 정적 버전을 만들기 위해 다른 컴포넌트를 재사용하는 컴포넌트를 만들고 props 를 이용해 데이터를 전달해줍시다. props는 부모가 자식에게 데이터를 넘겨줄 때 사용할 수 있는 방법입니다. 정적 버전을 만들기 위해 state를 사용하지 마세요. state는 오직 상호작용을 위해, 즉 시간이 지남에 따라 데이터가 바뀌는 것에 사용합니다. 우리는 앱의 정적 버전을 만들고 있기 때문에 지금은 필요하지 않습니다.</p>

									<p>앱을 만들 때 하향식(top-down)이나 상향식(bottom-up)으로 만들 수 있습니다. 다시 말해 계층 구조의 상층부에 있는 컴포넌트 (즉 FilterableProductTable부터 시작하는 것)부터 만들거나 하층부에 있는 컴포넌트 (ProductRow) 부터 만들 수도 있습니다. 간단한 예시에서는 보통 하향식으로 만드는 게 쉽지만 프로젝트가 커지면 상향식으로 만들고 테스트를 작성하면서 개발하기가 더 쉽습니다.</p>

									<p>이 단계가 끝나면 데이터 렌더링을 위해 만들어진 재사용 가능한 컴포넌트들의 라이브러리를 가지게 됩니다. 현재는 앱의 정적 버전이기 때문에 컴포넌트는 render() 메서드만 가지고 있을 것입니다. 계층구조의 최상단 컴포넌트 (FilterableProductTable)는 prop으로 데이터 모델을 받습니다. 데이터 모델이 변경되면 root.render()를 다시 호출해서 UI가 업데이트 됩니다. UI가 어떻게 업데이트되고 어디에서 변경해야하는지 알 수 있습니다. React의 단방향 데이터 흐름(one-way data flow) (또는 단방향 바인딩(one-way binding))는 모든 것을 모듈화 하고 빠르게 만들어줍니다.</p>

									<p>이 단계를 실행하는 데 도움이 필요하다면 공식 React 문서를 참고하세요.</p>

									<h2>짧은 소개: Props vs State</h2>
									<p>React에는 두 가지 데이터 “모델”인 props와 state가 있습니다. 이 둘 사이의 차이점을 이해하는 것이 중요합니다. 차이점이 제대로 기억나지 않는다면 공식 React 문서와 자주 묻는 질문: state와 props의 차이점은 무엇인가요?까지 살펴보세요.</p>

									<h2>3단계: UI state에 대한 최소한의 (하지만 완전한) 표현 찾아내기</h2>
									<p>UI를 상호작용하게 만들려면 기반 데이터 모델을 변경할 수 있는 방법이 있어야 합니다. 이를 React는 state를 통해 변경합니다.</p>

									<p>애플리케이션을 올바르게 만들기 위해서는 애플리케이션에서 필요로 하는 변경 가능한 state의 최소 집합을 생각해보아야 합니다. 여기서 핵심은 중복배제원칙입니다. 애플리케이션이 필요로 하는 가장 최소한의 state를 찾고 이를 통해 나머지 모든 것들이 필요에 따라 그때그때 계산되도록 만드세요. 예를 들어 TODO 리스트를 만든다고 하면, TODO 아이템을 저장하는 배열만 유지하고 TODO 아이템의 개수를 표현하는 state를 별도로 만들지 마세요. TODO 갯수를 렌더링해야한다면 TODO 아이템 배열의 길이를 가져오면 됩니다.</p>

									<p>예시 애플리케이션 내 데이터들을 생각해봅시다. 애플리케이션은 다음과 같은 데이터를 가지고 있습니다.</p>

									<ul>
										<li>제품의 원본 목록</li>
										<li>유저가 입력한 검색어</li>
										<li>체크박스의 값</li>
										<li>필터링 된 제품들의 목록</li>
									</ul>

									<p>각각 살펴보고 어떤 게 state가 되어야 하는 지 살펴봅시다. 이는 각 데이터에 대해 아래의 세 가지 질문을 통해 결정할 수 있습니다.</p>

									<ol>
										<li>부모로부터 props를 통해 전달됩니까? 그러면 확실히 state가 아닙니다.</li>
										<li>시간이 지나도 변하지 않나요? 그러면 확실히 state가 아닙니다.</li>
										<li>컴포넌트 안의 다른 state나 props를 가지고 계산 가능한가요? 그렇다면 state가 아닙니다.</li>
									</ol>

									<p>제품의 원본 목록은 props를 통해 전달되므로 state가 아닙니다. 검색어와 체크박스는 state로 볼 수 있는데 시간이 지남에 따라 변하기도 하면서 다른 것들로부터 계산될 수 없기 때문입니다. 그리고 마지막으로 필터링된 목록은 state가 아닙니다. 제품의 원본 목록과 검색어, 체크박스의 값을 조합해서 계산해낼 수 있기 때문입니다.</p>

									<p>결과적으로 애플리케이션은 다음과 같은 state를 가집니다.</p>

									<ul>
										<li>유저가 입력한 검색어</li>
										<li>체크박스의 값</li>
									</ul>

									<h2>4단계: State가 어디에 있어야 할 지 찾기</h2>

									<p>좋습니다. 이제 앱에서 최소한으로 필요한 state가 뭔지 찾아냈습니다. 다음으로는 어떤 컴포넌트가 state를 변경하거나 소유할지 찾아야 합니다.</p>

									<p>기억하세요: React는 항상 컴포넌트 계층구조를 따라 아래로 내려가는 단방향 데이터 흐름을 따릅니다. 어떤 컴포넌트가 어떤 state를 가져야 하는 지 바로 결정하기 어려울 수 있습니다. 많은 초보자가 이 부분을 가장 어려워합니다. 아래 과정을 따라 결정해 보세요.</p>

									<p>애플리케이션이 가지는 각각의 state에 대해서</p>

									<ul>
										<li>state를 기반으로 렌더링하는 모든 컴포넌트를 찾으세요.</li>
										<li>공통 소유 컴포넌트 (common owner component)를 찾으세요. (계층 구조 내에서 특정 state가 있어야 하는 모든 컴포넌트들의 상위에 있는 하나의 컴포넌트).</li>
										<li>공통 혹은 더 상위에 있는 컴포넌트가 state를 가져야 합니다.</li>
										<li>state를 소유할 적절한 컴포넌트를 찾지 못하였다면, state를 소유하는 컴포넌트를 하나 만들어서 공통 소유 컴포넌트의 상위 계층에 추가하세요.</li>
									</ul>
									
									<p>이 전략을 애플리케이션에 적용해봅시다.</p>
									
									<ul>
										<li>ProductTable은 state에 의존한 상품 리스트의 필터링해야 하고 SearchBar는 검색어와 체크박스의 상태를 표시해주어야 합니다.</li>
										<li>공통 소유 컴포넌트는 FilterableProductTable입니다.</li>
										<li>의미상으로도 FilterableProductTable이 검색어와 체크박스의 체크 여부를 가지는 것이 타당합니다.</li>
									</ul>
				
									<p>좋습니다. state를 FilterableProductTable에 두기로 했습니다. 먼저 인스턴스 속성인 this.state = {filterText: '', inStockOnly: false} 를 FilterableProductTable의 constructor에 추가하여 애플리케이션의 초기 상태를 반영합니다. 그리고 나서 filterText와 inStockOnly를 ProductTable와 SearchBar에 prop으로 전달합니다. 마지막으로 이 props를 사용하여 ProductTable의 행을 정렬하고 SearchBar의 폼 필드 값을 설정하세요.</p>

									<p>이제 애플리케이션의 동작을 볼 수 있습니다. filterText를 "ball"로 설정하고 앱을 새로고침 해보세요. 데이터 테이블이 올바르게 업데이트 된 것을 볼 수 있습니다.</p>

									<h2>5단계: 역방향 데이터 흐름 추가하기</h2>

									<p>지금까지 우리는 계층 구조 아래로 흐르는 props와 state의 함수로써 앱을 만들었습니다. 이제 다른 방향의 데이터 흐름을 만들어볼 시간입니다. 계층 구조의 하단에 있는 폼 컴포넌트에서 FilterableProductTable의 state를 업데이트할 수 있어야 합니다.</p>

									<p>React는 전통적인 양방향 데이터 바인딩(two-way data binding)과 비교하면 더 많은 타이핑을 필요로 하지만 데이터 흐름을 명시적으로 보이게 만들어서 프로그램이 어떻게 동작하는지 파악할 수 있게 도와줍니다.</p>

									<p>4단계의 예시에서 체크하거나 키보드를 타이핑할 경우 React가 입력을 무시하는 것을 확인할 수 있습니다. 이는 input 태그의 value 속성이 항상 FilterableProductTable에서 전달된 state와 동일하도록 설정했기 때문입니다.</p>

									<p>우리가 원하는 것이 무엇인지를 한번 생각해봅시다. 우리는 사용자가 폼을 변경할 때마다 사용자의 입력을 반영할 수 있도록 state를 업데이트하기를 원합니다. 컴포넌트는 그 자신의 state만 변경할 수 있기 때문에 FilterableProductTable는 SearchBar에 콜백을 넘겨서 state가 업데이트되어야 할 때마다 호출되도록 할 것입니다. 우리는 input에 onChange 이벤트를 사용해서 알림을 받을 수 있습니다. FilterableProductTable에서 전달된 콜백은 setState()를 호출하고 앱이 업데이트될 것입니다.</p>

									<h2>이게 전부입니다.</h2>
									<p>이 글을 통해 React를 가지고 애플리케이션과 컴포넌트를 만드는 데에 대한 사고방식을 얻어갈 수 있기를 바랍니다. 이전보다 더 많은 타이핑을 해야 할 수 있지만, 코드를 쓸 일보다 읽을 일이 더 많다는 사실을 기억하세요. 모듈화되고 명시적인 코드는 읽을 때 조금 덜 어렵습니다. 큰 컴포넌트 라이브러리를 만들게 되면 이 명시성과 모듈성에 감사할 것이며 코드 재사용성을 통해 코드 라인이 줄어들기 시작할 것입니다. :)</p>

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