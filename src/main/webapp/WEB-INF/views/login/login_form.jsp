<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</head>
	<body>
		<div>
			<h1>LOGIN FORM</h1>
		</div>
		<hr>
		<div>
			<form id="frm1">
				<input type="text" id="userId" name="userId" placeholder="아이디" maxlength="20"><br>
				<input type="text" id="userPw" name="userPw" placeholder="비밀번호" maxlength="20"><br>
				<input type="button" id="btnLogin" value="로그인">
			</form>
			<script>
				let msg = '<c:out value="${msg}"/>';
				if ( '' != msg ) {
					if ( 'ERR_001' == msg ) {
						alert('아이디 혹은 비밀번호가 틀렸습니다.');
					}
				}
				document.getElementById('btnLogin').addEventListener('click', function(){
					let userId = document.getElementById('userId');
					let userPw = document.getElementById('userPw');
					if ( '' == userId.value.trim() ) {
						alert('아이디를 입력해주세요.');
						userId.style.backgroundColor = "skyblue";
						userId.focus();
						return;
					}
					userId.style.backgroundColor = "";
					if ( '' == userPw.value.trim() ) {
						alert('비밀번호를 입력해주세요.');
						userPw.style.backgroundColor = "skyblue";
						userPw.focus();
						return;
					}
					userPw.style.backgroundColor = "";
					let frm1 = document.getElementById('frm1');
					frm1.action = '<c:url value="/login"/>';
					frm1.method = 'post';
					frm1.submit();
				});
			</script>
		</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
