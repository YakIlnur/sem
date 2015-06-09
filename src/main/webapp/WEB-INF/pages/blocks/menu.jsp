<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header class="sticky-style" id="header">
    <nav id="header-wrap">
        <nav class="content rightmargin-lg leftmargin-lg">

            <nav id="primary-menu">

                <ul class="sf-js-enabled" style="touch-action: pan-y;" ;>
                    <li class="mega-menu">
                        <%--<a class="sf-with-ul" href="/">--%>
                        <a class="sf-with-ul" href="<c:url value="/"/>">
                            <div>Main</div>
                        </a>
                    </li>
                    <li class="mega-menu">
                        <%--<a class="sf-with-ul" href="/myBlog">--%>
                        <a class="sf-with-ul" href="<c:url value="/myBlog"/>">
                            <div>My Blog</div>
                        </a>
                    </li>
                </ul>

                <sec:authorize access="isAnonymous()">

                    <ul class="sf-js-enabled" style="touch-action: pan-y;">
                        <li class="mega-menu">
                                <%--<a class="sf-with-ul" href="/sign_up">--%>
                            <a class="sf-with-ul" href="<c:url value="/sign_up"/>">
                                <div>Sign up</div>
                            </a>
                        </li>
                        <li class="mega-menu">
                                <%--<a class="sf-with-ul" href="/sign_in">--%>
                            <a class="sf-with-ul" href="<c:url value="/sign_in"/>">
                                <div>Sign in</div>
                            </a>
                        </li>
                    </ul>

                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <ul class="sf-js-enabled" style="touch-action: pan-y;">

                        <li class="mega-menu">
                                <%--<a class="sf-with-ul" href="/posts/new">--%>
                            <a class="sf-with-ul" href="<c:url value="/posts/new"/>">
                                <div>New Post</div>
                            </a>
                        </li>

                        <li class="mega-menu">
                                <%--<a class="sf-with-ul" href="/logout">--%>
                            <a class="sf-with-ul" href="<c:url value="/logout"/>">
                                <div>Logout</div>
                            </a>
                        </li>
                    </ul>
                </sec:authorize>

            </nav>
        </nav>
    </nav>
</header>
