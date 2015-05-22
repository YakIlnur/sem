<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header class="sticky-style" id="header">
    <nav id="header-wrap">
        <nav class="content rightmargin-lg leftmargin-lg">

            <nav id="primary-menu">

                <ul class="sf-js-enabled" style="touch-action: pan-y;" ;>
                    <li class="mega-menu">
                        <a class="sf-with-ul" href="/">
                            <div>Main</div>
                        </a>
                    </li>
                    <li class="mega-menu">
                        <a class="sf-with-ul" href="/myBlog">
                            <div>My Blog</div>
                        </a>
                    </li>
                </ul>

                <sec:authorize access="isAnonymous()">

                    <ul class="sf-js-enabled" style="touch-action: pan-y;">
                        <li class="mega-menu">
                            <a class="sf-with-ul" href="/sign_up">
                                <div>Sign up</div>
                            </a>
                        </li>
                        <li class="mega-menu">
                            <a class="sf-with-ul" href="/sign_in">
                                <div>Sign in</div>
                            </a>
                        </li>
                    </ul>

                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <ul class="sf-js-enabled" style="touch-action: pan-y;">

                        <li class="mega-menu">
                            <a class="sf-with-ul" href="/posts/new">
                                <div>New Post</div>
                            </a>
                        </li>

                        <%--<li class="mega-menu">--%>
                            <%--<form action="/logout" method="post" id="logoutForm">--%>
                                <%--<input type="hidden" name="${_csrf.parameterName}"--%>
                                       <%--value="${_csrf.token}"/>--%>
                                <%--<button type="submit" class="button button-3d button-mini button-rounded button-red">--%>
                                        <%--&lt;%&ndash;<i class="icon-off"></i>&ndash;%&gt;--%>
                                    <%--<div>Logout</div>--%>
                                <%--</button>--%>
                            <%--</form>--%>
                        <%--</li>--%>

                        <li class="mega-menu">
                            <a class="sf-with-ul" href="/logout">
                                <div>Logout</div>
                            </a>
                        </li>
                    </ul>
                </sec:authorize>

            </nav>
        </nav>
    </nav>
</header>
