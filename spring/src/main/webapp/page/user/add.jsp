<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- 这里并没有指定action=""，说明表单是提交给自己的，说白了就是"哪来的回哪儿去 --%>

<form:form method="POST" modelAttribute="user">
	username: <form:input path="username"/><br/>
	nickname: <form:input path="nickname"/><br/>
	password: <form:password path="password"/><br/>
	yourmail: <form:input path="email"/><br/>
	<input type="submit" value="添加新用户"/>
</form:form>