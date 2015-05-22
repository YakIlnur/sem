<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="All Users">
    <c:forEach items="${users}" var="user">
        <h1>${user.username}</h1><br/>
    </c:forEach>
</t:applicationLayout>