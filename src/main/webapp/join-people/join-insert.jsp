<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Dopetrope by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/join-people/assets/css/main.css" />
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="/join-people/join-list.jsp">JOIN PEOPLE</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="/join-people/join-list.jsp">Home</a></li>
								<li><a href="left-sidebar.html">로그인</a></li>
								<li><a href="right-sidebar.html">정보수정</a></li>
								<li><a href="no-sidebar.html">공지사항</a></li>
								<li><a href="no-sidebar.html">내방관리</a></li>
								<li><a href="no-sidebar.html">문의하기</a></li>
								<li><a href="no-sidebar.html">탈퇴하기</a></li>
							</ul>
						</nav>

					<!-- Intro -->
						<section id="intro" class="container">
							<div class="col-4 col-12-medium">
							<section class="first">
								<form method="post" action="#">
									<div class="row">
									    <!-- 찾기 -->
										<div class="col-12 col-12-small">
											<input type="text" name="name" id="name" placeholder="방제목" />
										</div>
										<!-- 
										<div class="col-3 col-12-small">
											<ul class="actions">
												<li><input type="submit" value="조회하기" /></li>
											</ul>
										</div>
										 -->
										 
										<!-- 지역 -->
										<div class="col-6 col-12-small">
											<select>
												<option>지역선택</option>
												<option value="1100000000">서울특별시</option>
												<option value="2600000000">부산광역시</option>
												<option value="2700000000">대구광역시</option>
												<option value="2800000000">인천광역시</option>
												<option value="2900000000">광주광역시</option>
												<option value="3000000000">대전광역시</option>
												<option value="3100000000">울산광역시</option>
												<option value="3611000000">세종특별자치시</option>
												<option value="4100000000">경기도</option>
												<option value="4300000000">충청북도</option>
												<option value="4400000000">충청남도</option>
												<option value="4600000000">전라남도</option>
												<option value="4700000000">경상북도</option>
												<option value="4800000000">경상남도</option>
												<option value="5000000000">제주특별자치도</option>
												<option value="5100000000">강원특별자치도</option>
												<option value="5200000000">전북특별자치도</option>
											</select>
										</div>
										
										<!-- 일자선택 -->
										<div class="col-2 col-4-small">
											<input type="text" name="name" id="name" placeholder="조인년도" maxlength="4" />
										</div>
										<div class="col-2 col-4-small">
											<input type="text" name="name" id="name" placeholder="조인월" />
										</div>
										<div class="col-2 col-4-small">
											<input type="text" name="name" id="name" placeholder="조인일" />
										</div>
										
										<!-- Break -->
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-copy" name="demo-copy">
											<label for="demo-copy">충주시</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">제천시</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">보은군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">옥천군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">영동군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">진천군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">괴산군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">음성군</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="checkbox" id="demo-human" name="demo-human" checked>
											<label for="demo-human">단양군</label>
										</div>
										<div class="col-2 col-12-small"></div>
										<div class="col-2 col-12-small"></div>
										<div class="col-2 col-12-small"></div>
										
										<!-- Break -->
										<div class="col-2 col-4-small">
											<input type="radio" id="demo-priority-low" name="demo-priority" checked>
											<label for="demo-priority-low">성별무관</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="radio" id="demo-priority-normal" name="demo-priority">
											<label for="demo-priority-normal">남성</label>
										</div>
										<div class="col-2 col-4-small">
											<input type="radio" id="demo-priority-high" name="demo-priority">
											<label for="demo-priority-high">여성</label>
										</div>
										
										<!-- Break -->
										<div class="col-3 col-6-small">
											<input type="radio" id="demo-priority-low2" name="demo-priority2" checked>
											<label for="demo-priority-low2">18홀</label>
										</div>
										<div class="col-3 col-6-small">
											<input type="radio" id="demo-priority-normal2" name="demo-priority2">
											<label for="demo-priority-normal2">9홀</label>
										</div>
										
										
										<!--
										<div class="col-12">
											<input type="text" name="subject" id="subject" placeholder="Subject" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
										
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" value="조회하기" /></li>
												<li><input type="reset" value="Clear Form" class="alt" /></li>
											</ul>
										</div>-->
									</div>
								</form>
								</section>
							</div>
							
							<footer>
								<ul class="actions">
									<li><a href="#" class="button large">조회하기</a></li>
									<li><a href="#" class="button alt large">방만들기</a></li>
								</ul>
							</footer>
							
						</section>

				</section>


			<!-- Footer -->
				<section id="footer">
					<div class="container">
						<div class="row">
							<div class="col-12 col-12-medium">
								<section>
									<header>
										<h2>2025년 3월</h2>
									</header>
									
									<ul class="dates">
									<c:forEach var="test" begin="0" end="5">
										<li>
											<span class="date">3 <strong>27</strong></span>
											<h3><a href="#">[비밀방] 충남 예산시, 세종시, 대전시, 충북 보은시, 경북 상주시, 경북 문경시, 충북 청주시</a></h3>
											<p>
												시간 05시~13시, 그린피 30,000~120,000원, 타수무관, 성별무관, 현재3명, 18홀
												<input type="password" name="pwd" id="pwd" placeholder="비밀번호" size="8" maxlength="8" class="small-input" />
												<a href="#" class="button">참여하기</a>
											</p>
										</li>
									</c:forEach>
									
									</ul>
								</section>
							</div>
							<!-- 
							<div class="col-4 col-12-medium">
								<section>
									<header>
										<h2>What's this all about?</h2>
									</header>
									<a href="#" class="image featured"><img src="images/pic10.jpg" alt="" /></a>
									<p>
										This is <strong>Dopetrope</strong> a free, fully responsive HTML5 site template by
										<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net/">HTML5 UP</a> It's released for free under
										the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for any personal or commercial project &ndash; just don't forget to credit us!
									</p>
									<footer>
										<ul class="actions">
											<li><a href="#" class="button">Find out more</a></li>
										</ul>
									</footer>
								</section>
							</div>
							 -->
							 <!-- 
							<div class="col-4 col-6-medium col-12-small">
								<section>
									<header>
										<h2>Tempus consequat</h2>
									</header>
									<ul class="divided">
										<li><a href="#">Lorem ipsum dolor sit amet sit veroeros</a></li>
										<li><a href="#">Sed et blandit consequat sed tlorem blandit</a></li>
										<li><a href="#">Adipiscing feugiat phasellus sed tempus</a></li>
										<li><a href="#">Hendrerit tortor vitae mattis tempor sapien</a></li>
										<li><a href="#">Sem feugiat sapien id suscipit magna felis nec</a></li>
										<li><a href="#">Elit class aptent taciti sociosqu ad litora</a></li>
									</ul>
								</section>
							</div>
							 -->
							 <!-- 
							<div class="col-4 col-6-medium col-12-small">
								<section>
									<header>
										<h2>Ipsum et phasellus</h2>
									</header>
									<ul class="divided">
										<li><a href="#">Lorem ipsum dolor sit amet sit veroeros</a></li>
										<li><a href="#">Sed et blandit consequat sed tlorem blandit</a></li>
										<li><a href="#">Adipiscing feugiat phasellus sed tempus</a></li>
										<li><a href="#">Hendrerit tortor vitae mattis tempor sapien</a></li>
										<li><a href="#">Sem feugiat sapien id suscipit magna felis nec</a></li>
										<li><a href="#">Elit class aptent taciti sociosqu ad litora</a></li>
									</ul>
								</section>
							</div>
							<div class="col-4 col-12-medium">
								<section>
									<header>
										<h2>Vitae tempor lorem</h2>
									</header>
									<ul class="social">
										<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
										<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
										<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
										<li><a class="icon brands fa-tumblr" href="#"><span class="label">Tumblr</span></a></li>
										<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
									</ul>
									<ul class="contact">
										<li>
											<h3>Address</h3>
											<p>
												Untitled Incorporated<br />
												1234 Somewhere Road Suite<br />
												Nashville, TN 00000-0000
											</p>
										</li>
										<li>
											<h3>Mail</h3>
											<p><a href="#">someone@untitled.tld</a></p>
										</li>
										<li>
											<h3>Phone</h3>
											<p>(800) 000-0000</p>
										</li>
									</ul>
								</section>
							</div>
							 -->
							<div class="col-12">

								<!-- Copyright -->
									<div id="copyright">
										<ul class="links">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="/join-people/assets/js/jquery.min.js"></script>
			<script src="/join-people/assets/js/jquery.dropotron.min.js"></script>
			<script src="/join-people/assets/js/browser.min.js"></script>
			<script src="/join-people/assets/js/breakpoints.min.js"></script>
			<script src="/join-people/assets/js/util.js"></script>
			<script src="/join-people/assets/js/main.js"></script>

	</body>
</html>