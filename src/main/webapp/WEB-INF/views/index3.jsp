<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <form>
	 	 핸드폰 번호 :  <input type="text" id="phoneNumber">
	 	 <input type="submit" value="핸드폰 번호 전송" id="phoneNumverButton"> 
	 </form>
	 <form>
	 	 확인 코드:  <input type="text" id="confirmCode">
	 	 <input type="submit" value="확인 코드 전송" id="confirmCodeButton"> 
	 </form>
	
	<script type="module">
	// 1 .파이어베이스와 프로젝트 연결
	  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
	  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
	  import { getAuth, RecaptchaVerifier,signInWithPhoneNumber } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js"

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
	  const auth = getAuth();
	  
	  // sign-in-button => phoneNumverButton 바꿔주기
	  window.recaptchaVerifier = new RecaptchaVerifier
	  	 ('phoneNumverButton', {
		  'size': 'invisible',
		  'callback': (response) => {
		    onSignInSubmit();
		  }
		}, auth);
	  
	  // 핸드폰 번호 전송 이벤트 처리  버튼을  클릭 하였을때  
	  	document.getElementById('phoneNumverButton').addEventListener('click', function(event){
		event.preventDefault();
	  		//폰번호를 얻자 값을 얻자 
	  		const phoneNumber = document.getElementById('phoneNumber').value;
	  		const appVerifier = window.recaptchaVerifier;
			//오류 이유 : 국제 전화시 +82를 넣어줘야한다 .
	  		signInWithPhoneNumber(auth,'+82' + phoneNumber, appVerifier)
	  		    .then((confirmationResult) => {
				 alert("성공");
	  		     window.confirmationResult = confirmationResult;
	  		    }).catch((error) => {
	  		  	 alert("실패");
	  		    });
	  		
	  		
	  	});
	 // 핸드폰 확인 코드 전송
	document.getElementById('confirmCodeButton').addEventListener('click', function(event){
		event.preventDefault();
		const code = document.getElementById('confirmCode').value;
		confirmationResult.confirm(code)
		.then((result) => {
		alert("성공");
 	    const user = result.user;
		console.log(user);
		console.log(user.uid);
		console.log(user.phoneNumber);
	 }).catch((error) => {
		alert("실패");
	    return ;
});

	

	});
	
	
	</script>
	
</body>
</html>