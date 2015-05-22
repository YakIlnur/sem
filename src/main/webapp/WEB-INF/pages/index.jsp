<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="Hello">

    <h1>${mess}</h1>

    <h1>${home}</h1>

    <sec:authorize access="isAnonymous()">

        <a href="/sign_up">Sign_up</a><br/>
        <a href="/sign_in">Sign_in</a><br/>
        <br/>

    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <div style="float: left">${pageContext.request.userPrincipal.name}:</div>
        <form action="/logout" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <button type="submit" class="button button-3d button-mini button-rounded button-red">
                <i class="icon-off"></i>
            </button>
        </form>
        <a href="/posts/new">New Post</a>
        <br/>
    </sec:authorize>

    <a href="/users/Ilnur">User with username</a><br/>
    <a href="/posts/1">Post with id=1</a><br/>
    <a href="/posts">All Posts</a><br/>
    <a href="/users">All Users</a><br/>

</t:applicationLayout>