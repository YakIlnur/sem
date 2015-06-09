<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="Sign_up">
    <div class="container clearfix">
        <div class="tabs divcenter nobottommargin clearfix" id="tab-login-register" style="max-width: 500px;">
            <div class="tab-container">
                <div class="tab-content clearfix" id="tab-register">
                    <div class="panel panel-default">
                        <div class="panel-body" style="padding: 40px;">

                            <h3>Register for an Account</h3>

                            <c:url var="sign_up"  value="/saveUser" />
                            <form:form id="register-form" name="register-form" class="nobottommargin" method="POST" modelAttribute="user" action="${sign_up}">

                                <div class="col_full">
                                    <label for="register-form-username">Choose a Username:</label>
                                    <form:input path="username" type="text" id="register-form-username" name="register-form-username" value="" class="form-control"></form:input>
                                    <form:errors path="username" cssClass="error"/>
                                </div>

                                <div class="col_full">
                                    <label for="register-form-password">Choose Password:</label>
                                    <form:input path="password" type="password" id="register-form-password" name="register-form-password" value="" class="form-control"></form:input>
                                    <form:errors path="password" cssClass="error"/>
                                </div>

                                <div class="col_full nobottommargin">
                                    <button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Register Now</button>
                                </div>

                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</t:applicationLayout>