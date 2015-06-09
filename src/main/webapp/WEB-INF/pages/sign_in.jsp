<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="Sign_in">
    <div class="container clearfix">
        <div class="tabs divcenter nobottommargin clearfix" id="tab-login-register" style="max-width: 500px;">
            <div class="tab-container">
                <div class="tab-content clearfix" id="tab-login">
                    <div class="panel panel-default">
                        <div class="panel-body" style="padding: 40px;">

                            <c:if test="${not empty error}">
                                ${error}
                            </c:if>
                            <c:if test="${not empty msg}">
                                ${msg}
                            </c:if>

                            <c:url var="sign_in"  value="/sign_in" />
                            <form id="login-form" class="nobottommargin" name='loginForm' action="${sign_in}" method='POST'>

                                <h3>Login to your Account</h3>

                                <div class="col_full">
                                    <label for="login-form-username">Username:</label>
                                    <input type="text" id="login-form-username" name="username" value="" class="form-control" />
                                </div>

                                <div class="col_full">
                                    <label for="login-form-password">Password:</label>
                                    <input type="password" id="login-form-password" name="password" value="" class="form-control" />
                                </div>

                                <div class="col_full nobottommargin">
                                    <button class="button button-3d button-black nomargin" id="login-form-submit" name="login-form-submit" value="login">Sign_in</button>
                                </div>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</t:applicationLayout>