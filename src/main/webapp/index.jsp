<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.global.session.listener.LoginListener" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
			<style>
	        .popup {
	            display: none;
	            position: fixed;
	            top: 0;
	            left: 0;
	            width: 100%;
	            height: 100%;
	            background: rgba(0, 0, 0, 0.5);
	            z-index: 9999;
	        }
	        
	        .popup.active {
	            display: flex;
	            justify-content: center;
	            align-items: center;
	        }
	        
	        .popup-box {
	            background: white;
	            padding: 30px;
	            border-radius: 10px;
	            max-width: 400px;
	            width: 90%;
	        }
	        
	        .popup-box h2 {
	            margin-top: 0;
	        }
	        
	        .popup-footer {
	            margin-top: 20px;
	            display: flex;
	            justify-content: space-between;
	            align-items: center;
	        }
	        
	        button {
	            padding: 10px 20px;
	            background: #4CAF50;
	            color: white;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	        }
	        
	        button:hover {
	            background: #45a049;
	        }
	    </style>
	</head>
	<body>
		<c:set var="userId" value="${sessionScope.userId}"/>
		<c:set var="loginCount" value="<%= LoginListener.getLoginCount() %>"/>
		<div>
			<h1>COOKIE SESSION</h1>
		</div>
		<div>
			<h6>현재 접속자수 <c:out value="${loginCount }"/>명</h6>
		</div>
		<ul>
			<c:if test="${ empty sessionScope.userId}">
				<li><a href="<c:url value="/login"/>">Login</a></li>
			</c:if>
			<c:if test="${ not empty sessionScope.userId}">
				<li>안녕하세요 <c:out value="${userId }"/>님 <a href="<c:url value="/logout"/>">Logout</a></li>
			</c:if>
		</ul>
		<script>
			//key=value; Max-Age=60; Expires=Wed, 07 Feb 2026 12:00:00 GMT; SameSite={Strict,Lax,None}; Domain=globalin.kr; Secure;
			const uuid = crypto.randomUUID();
			const exp = 'Wed, 07 Feb 2026 12:00:00 GMT';
			document.cookie = 'uuid='+uuid+'; Max-Age=60; Path=/; SameSite=Lax; ';
			console.log(document.cookie);
		</script>
		
		
		<div class="popup" id="myPopup">
	        <div class="popup-box">
	            <h2>공지사항</h2>
	            <p>신규 서비스 오픈 안내입니다.</p>
	            <p>많은 관심 부탁드립니다!</p>
	            
	            <div class="popup-footer">
	                <label>
	                    <input type="checkbox" id="todayClose">
	                    오늘 하루 보지 않기
	                </label>
	                <button onclick="closePopup()">닫기</button>
	            </div>
	        </div>
	    </div>
	    <script>
	        window.onload = function() {
	            var hide = getCookie('hidePopup');
	            if (hide !== 'true') {
	                document.getElementById('myPopup').classList.add('active');
	            }
	        };
	        function setCookie(name, value, days) {
	            var expires = "";
	            if (days) {
	                var date = new Date();
	                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	                expires = "; expires=" + date.toUTCString();
	            }
	            document.cookie = name + "=" + value + expires + "; path=/";
	        }
	        function getCookie(name) {
			    const cookies = Object.fromEntries(
			        document.cookie.split('; ').map(c => c.split('='))
			    );
			    return cookies[name] || null;
			}
	        function closePopup() {
	            var checkbox = document.getElementById('todayClose');
	            if (checkbox.checked) {
	                setCookie('hidePopup', 'true', 1);
	            }
	            document.getElementById('myPopup').classList.remove('active');
	        }
	        document.getElementById('myPopup').onclick = function(event) {
	            if (event.target.id === 'myPopup') {
	                closePopup();
	            }
	        };
	    </script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>