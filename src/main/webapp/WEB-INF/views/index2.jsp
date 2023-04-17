<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<img src="resources/img/btn_google.png" id ="googlelogIn">
	
		<script type="module">
		// 1 .파이어베이스와 프로젝트 연결
		  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
		  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
		  import { getAuth, signInWithPopup, GoogleAuthProvider } from 
         "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
		  
		    const firebaseConfig = {
		    apiKey: "AIzaSyCA2ysFcStQ3rmd5FwnkfOt3VzC_zns67E",
		    authDomain: "logintest-b66e7.firebaseapp.com",
		    projectId: "logintest-b66e7",
		    storageBucket: "logintest-b66e7.appspot.com",
		    messagingSenderId: "891780842200",
		    appId: "1:891780842200:web:b2dd714ccc345810efcdad",
		    measurementId: "G-8939BHJ4CL"
		  };

		  const app = initializeApp(firebaseConfig);
		  const analytics = getAnalytics(app);
		  
		  // 1. Firebase SDK로 로그인 과정 처리 = 복사 / 붙이기 
		  //import { GoogleAuthProvider } from "firebase/auth"; 위로 이동 
		  const provider = new GoogleAuthProvider();
		  
		//	  2, import { getAuth, signInWithPopup, GoogleAuthProvider } from "firebase/auth";
		// 	firebase/auth" 변경
		const auth = getAuth();
	
		// 3. 이벤트처리
		document.getElementById('googlelogIn').addEventListener('click', function(event){
		// 팝업창
		// 도메인 문제 발생 : 프로젝트 - 인증 - setting - 승인된 도메인 확인 
		// 도메인 이름은 사람들이 원하는 사이트에 방문하기 위해 브라우저에서 입력하는 주소를 말한다 

		signInWithPopup(auth, provider)
	  .then((result) => {
		alert("성공");
	    const credential = GoogleAuthProvider.credentialFromResult(result);
	    const token = credential.accessToken;
	    const user = result.user;
	  }).catch((error) => {
	   alert("실패");
	    const errorCode = error.code;
	    const errorMessage = error.message;
	    const email = error.customData.email;
		const credential = GoogleAuthProvider.credentialFromError(error);
	    // ...
	  });
	 
			
		});
	

		</script>
		

</body>
</html>