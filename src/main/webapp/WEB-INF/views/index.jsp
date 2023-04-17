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
		<h2>파이어 베이스 email로 회원가입</h2>
			<div>
				email : <input type="email" id="joinEmail">
			</div>
			<div>
				password : <input type="password" id="joinPassword">
			</div>
			<input type="submit" value="회원가입" id="joinButton">
		</form>
		<hr>
		<h2>파이어 베이스 email로 로그인</h2>	
		<form>
			<div>
				email : <input type="email" id="logInEmail">
			</div>
			<div>
				password : <input type="password" id="logInPassword">
			</div>
			<input type="submit" value="로그인" id="logInButton">
		</form>
<script type="module">
// 1 .파이어베이스와 프로젝트 연결
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
 //  https://firebase.google.com/docs/web/setup#available-libraries

 //  Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
    apiKey: "AIzaSyCA2ysFcStQ3rmd5FwnkfOt3VzC_zns67E",
    authDomain: "logintest-b66e7.firebaseapp.com",
    projectId: "logintest-b66e7",
    storageBucket: "logintest-b66e7.appspot.com",
    messagingSenderId: "891780842200",
    appId: "1:891780842200:web:b2dd714ccc345810efcdad",
    measurementId: "G-8939BHJ4CL"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
 // console.log(app); 


// 2 .비밀번호 기반 계정만들기 - 복사- 붙이기 
// (firebase/auth) 안에 있는 값 수정하기  그리고 firebase-app 를 위에서 주소 복사한다음  app 를 auth 로 바꿔주자
// 로그인 실행 시 signInWithEmailAndPassword 추가해주기 이메일 
//import { getAuth, createUserWithEmailAndPassword ,signInWithEmailAndPassword } from "firebase/auth"; < 

import { getAuth, signInWithEmailAndPassword,createUserWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
 const auth = getAuth();
 // 회원가입 버튼을 클릭 할때 
  document.getElementById('joinButton').addEventListener('click', function(event){
		event.preventDefault();
		// console.log('1');
		// 값들을 넣어주고 위에 태그 안에 value 누르면   작동해야하니까 value 값을 넣어준다 
      const email = document.getElementById('joinEmail').value;
      const password = document.getElementById('joinPassword').value;

	  createUserWithEmailAndPassword(auth, email, password)
      .then((userCredential) => {
          // 성공 시 호출 되는 함수
          const user = userCredential.user;
          console.log(user);
          console.log(user.accessToken);
          console.log(user.uid);
      })
     .catch((error) => {
        // 실패 
         alert("회원가입 실패");
		  return;
         //const errorCode = error.code;
         //const errorMessage = error.message;
         // ..
     });

  }); 

	// 로그인 버튼을 누르면 실행할꺼다 
	document.getElementById('logInButton').addEventListener('click', function(event){
	 event.preventDefault();
		// console.log('1');
		// 값들을 넣어주고 위에 태그 안에 value 누르면   작동해야하니까 value 값을 넣어준다 
      const email = document.getElementById('logInEmail').value;
      const password = document.getElementById('logInPassword').value;

	signInWithEmailAndPassword(auth, email, password)
    .then((userCredential) => {
	alert("로그인 성공");

    // Signed in
   // const user = userCredential.user;
    // ...
   })

    .catch((error) => {
	//로그인 실패
	alert("로그인 실패");
	return;
    //const errorCode = error.code;
    //const errorMessage = error.message;
    });

	});
  


</script>

</body>
</html>