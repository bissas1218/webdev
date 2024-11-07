<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Oracle</title>
 
 <link rel="stylesheet" href="/study/main.css" type="text/css" />
 
</head>
<body>

	<header>
	Header <br/>
	<a href="/">Home</a> > <a href="/study">Study</a> > React
	</header>
	
	<main>
		<div id="mainWrap">
			<jsp:include page="/study/react/left.jsp"></jsp:include>
			<div class="right">
				
				<p id="navi">시작하기 / 경험시작</p>
				
				<p id="title">설치</p>
				<p id="title_exp">https://ko.legacy.reactjs.org/ React는 사용자 인터페이스를 만들기 위한 JavaScript 라이브러리입니다.</p>
				
				<p id="sub_title">웹 사이트에 React 추가하기</p>
				<b>1단계: HTML파일에 DOM컨테이너 설치</b>
				<p>먼저, 편집할 HTML 파일을 엽니다. 그 다음 비어있는 &lt;div&gt; 태그를 추가해줍니다. 이 태그가 바로 React를 통해 원하는 내용을 표시할 수 있는 위치가 됩니다. 다음과 같이 말이죠.</p>
				<div class="execute">
				&lt;!-- ... existing HTML ... --&gt;<br/>
			    <br/>
				&lt;div id="like_button_container"&gt;&lt;/div&gt;<br/>
				<br/>
				&lt;!-- ... existing HTML ... --&gt;
				</div>
		
				<p>이 &lt;div&gt; 태그에 유일한 HTML 속성인 id를 부여해줍니다. 이를 통해 JavaScript가 태그를 찾고 찾은 태그 안에 React 컴포넌트를 표시할 수 있게됩니다.</p>
				<br/>
				
				<b>2단계: 스크립트 태그 추가하기</b>
				<p>그 다음, &lt;script&gt; 태그 3개를 닫는 태그인 &lt;/body&gt; 앞에 추가해줍니다.</p>
				
				<div class="execute">
				  	&lt;!-- ... 다른 HTML ... --&gt;<br/>
					<br/>
				  	&lt;!-- React를 실행. --&gt;<br/>
				  	&lt;!-- 주의: 사이트를 배포할 때는 "development.js"를 "production.min.js"로 대체하세요. --&gt;<br/>
				  	&lt;script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin&gt;&lt;/script&gt;<br/>
				  	&lt;script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin&gt;&lt;/script&gt;<br/>
					<br/>
				  	&lt;!-- 만든 React 컴포넌트를 실행. --&gt;<br/>
				  	&lt;script src="like_button.js"&gt;&lt;/script&gt;<br/>
					<br/>
					&lt;/body&gt;
				</div>
				
				<p>처음 두 태그는 React를 실행시키고 3번 째 코드는 만든 컴포넌트를 실행시킵니다.</p>
				<br/>
				
				<b>3단계: React 컴포넌트 만들기</b>
				<p>like_button.js 라는 이름으로 HTML 페이지 옆에 새 파일을 만들고 다음 코드를 입력합니다.</p>
				
				<pre class="execute">
'use strict';

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
				</pre>
				
				<p>like_button.js의 맨 뒷 줄, 그러니까 아까 붙여넣은 스타터 코드 뒤에 다음 코드 세 줄을 추가해줍니다.</p>
				
				<pre class="execute">
// ... 복사했던 스타터 코드 ...

const domContainer = document.querySelector('#like_button_container');
const root = ReactDOM.createRoot(domContainer);
root.render(e(LikeButton));
				</pre>
				
				<p>이 세 줄의 코드는 첫 단계에서 HTML 페이지에 추가했던 &lt;div&gt; 태그를 찾아주고, 해당 태그에 React 앱을 만들어주고, 그 안에 “좋아요” 버튼 React 컴포넌트를 추가해줍니다.</p>

				<p id="sub_title">새로운 React앱 만들기</p>
				<b>Node.js설치하기</b>
				
				<p>https://nodejs.org/en 사이트에서 node-v22.11.0-x64.msi 파일을 다운로드 하여 설치한다.</p>
				
				<p>이것은 개발 환경을 설정하고, 최신 JavaScript를 사용하게 해주며, 좋은 개발 경험과 프로덕션 앱 최적화를 해줍니다. Node 14.0.0 혹은 상위 버전 및 npm 5.6 혹은 상위 버전이 필요합니다. 
				새로운 프로젝트를 만들기 위해 아래의 명령어를 실행합니다.</p>
				
				<pre class="execute">
npx create-react-app my-app
cd my-app
npm start
				</pre>
				
				<p>Create React App 은 백 앤드 로직이나 데이터베이스를 제어할 수 없습니다. Create React App 은 프런트 앤드 빌드 파이프라인만 생성하기 때문에 원하는 어떤 백엔드와도 함께 사용할 수 있습니다. 
				Create React App는 Babel이나 webpack같은 build 도구를 사용하나, 설정 없이도 동작합니다.</p>
				
				<p>프로덕션을 배포할 준비가 되었을 때, npm run build 를 실행하면 build 폴더 안에 제작한 앱의 최적화된 Build를 생성합니다.</p>

				
			</div>
		</div>
		
	</main>
	
	<footer>
	Footer
	</footer>

</body>
</html>