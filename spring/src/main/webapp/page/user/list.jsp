<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
	<head>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.js"/>"></script>
		<script type="text/javascript">
			
			function showJsonData(){
				$.ajax( {  
			        type : "get",  
			        url : "<%=request.getContextPath()%>/user/show_json",  
			        dataType:"json",
			        data: {"username":'airman'},
			        success : function(msg) {
			            $('#sp1').html(msg.username+"~~~~~~~"+msg.nickname+"~~~~~~"+msg.email); 
			        }  
			    });
			}
			
			function addJsonData(){
				alert($('#userForm').serialize());
				$.ajax( {  
			        type : "post",  
			        url : "<%=request.getContextPath()%>/user/add_json",  
			        dataType:"json",
			        data: $('#userForm').serialize(),
			        success : function(msg) {
			            $('#sp2').html(msg.username+"~~~~~~~"+msg.nickname+"~~~~~~"+msg.email); 
			        }  
			    });
			}
		</script>
</head>
<body>
	<c:forEach items="${users}" var="user">
		${user.value.username}----${user.value.nickname}----${user.value.password}----${user.value.email}
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/user/${user.value.username}">查看</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/user/${user.value.username}/update">编辑</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/user/${user.value.username}/delete">删除</a>
		<br/>
	</c:forEach>
	<br/>
	<a href="<%=request.getContextPath()%>/user/add">继续添加用户</a>
	<br>
	<input type="button" onclick="showJsonData()" value="get user">
	<span id="sp1"></span>
	
	<form:form method="POST" modelAttribute="user" id="userForm">
		username: <form:input path="username"/><br/>
		nickname: <form:input path="nickname"/><br/>
		password: <form:password path="password"/><br/>
		yourmail: <form:input path="email"/><br/>
		<input type="button" value="添加新用户" onclick="addJsonData()"/>
	</form:form>
	<span id="sp2"></span>
</body>
</html>