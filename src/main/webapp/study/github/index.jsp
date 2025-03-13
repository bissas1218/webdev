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
							<div class="col-8 col-12-medium">

								<section>
									<h2>Github 접속하기</h2>
									<p>
									Github에 접속하고 로그인한다. https://github.com	bissas@naver.com / qusehd#82로 로그인한다.
									</p>
				
									<h2>Github 신규프로젝트 만들기</h2>
									<p>
										Dashboard의 New버튼을 클릭한다. New repository에서 신규 Repository명을 입력한다. Create repository클릭.<br/>
										생성된 Repository의 주소를 복사한다. https://github.com/bissas1218/webdev.git<br/>
									</p>
				
									<h2>Github 토큰생성하기</h2>
									<p>Settings > Developer settings > Personal access tokens > Fine-grained tokens에서 신규토큰 생성</p>
									<p>토큰의 Repository access, Permisions을 설정한다. 모든 권한을 Read and Write로 변경한다.</p>
									<p>github에 커밋시 소스에서 토큰정보는 삭제한다(별도보관)</p>
									
									<h2>이클립스 신규 프로젝트 Github에 올리기</h2>
									<p>이클립스 프로젝트 Team > Share Project... > Git Repository Type 선택</p>
									<p>Use or create repository in parent folder of project체크</p>
									<p>목록에서 프로젝트 선택 후 Create Repository버튼 클릭 후 Finish</p>
									<p>Git Repositories에서 commit > Staged Changes이동(이동 안될시 이클립스 재기동) 후 Commit and Push</p>
									<p>Can't connect to any repository: 접속 에러 발생 Push HEAD...클릭 > 접속정보 입력 후 커밋 완료</p>
									<p>소스 수정 후 Staged Changes이동 후 Commit and Push</p>
				
									<h2>이클립스에서 Github Repository불러오기</h2>
									<p>이클립스 실행 후 Import projects... > Git > Projects from Git > Next > Clone URI > Next > URI, User, Password입력 후 Next > master Next > workspace로 Directory변경
									> Next > Import existing Eclipse projects > Next > Finish</p>
									<p>프로젝트 import 후 에러발생 
									Java > Installed JREs > jdk-21.0.5추가 후 체크 
									Java > Compiler > Compiler compiance level: 21로 변경
									프로젝트 우클릭 Build Path > Configure Build Path... > Java Compiler, Project Facets에서 Java 버젼 확인
									톰캣 10.1 설치 후 jdk-21로 설정</p>
									<p>Window > Show View > Other... > Git > Git Repositories > Open</p>
									
									<h2>이클립스에서 소스관리하기</h2>
									<p>커밋하기 : Team > Commit... > Unstaged Changes -> Add to index > Commit Message 입력 > Commit and Push</p>
									<p>이클립스에서 git-receive-pack not permitted on 에러 발생시 토큰의 권한부여 후 Push HEAD...</p>
									<p>불러오기 : Team > Pull</p>
				
								</section>

							</div>
							<div class="col-4 col-12-medium">

								<section>
									<h2>Who are you guys?</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/images/pic2.jpg" alt="" class="left" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="/images/pic1.jpg" alt="" class="left" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
								</section>

								<section>
									<h2>How about some links?</h2>
									<div>
										<div class="row">
											<div class="col-6 col-12-small">
												<ul class="link-list">
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Suspendisse varius ipsum</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
												</ul>
											</div>
											<div class="col-6 col-12-small">
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