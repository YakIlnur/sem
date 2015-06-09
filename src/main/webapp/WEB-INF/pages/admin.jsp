<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:applicationLayout title="Admin Page">
    <div class="row">
        <div class="col-md-6">
            <c:forEach var="user" items="${listUser}" varStatus="status">
                <h4>${user.username}</h4>

                <h4>${user.password}</h4>

                <h4>${user.authority}</h4>
                <%--<a href="/deleteUser?username=${user.username}">Delete</a>--%>
                <a href="<c:url value="/deleteUser?username=${user.username}"/>">Delete</a>

                <c:url var="edit_user_role"  value="users/${user.username}/edit" />
                <form action="${edit_user_role}" method="get">

                    <div class="col_full">
                        <input type="hidden" id="login-form-username" name="username" value="${user.username}"
                               class="form-control"/>
                    </div>

                    <div class="col_full">
                        <input type="text" id="login-form-role" name="role" value="" class="form-control"/>
                    </div>

                    <div class="col_full nobottommargin">
                        <button class="btn btn-info" id="login-form-submit"
                                name="login-form-submit" value="login">Edit
                        </button>
                    </div>
                </form>
                <hr>
            </c:forEach>
        </div>
    </div>
</t:applicationLayout>