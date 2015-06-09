<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:applicationLayout title="Edit post">
    <div class="container clearfix">
        <div class="tabs divcenter nobottommargin clearfix">
            <div class="tab-container">
                <div class="tab-content clearfix" id="tab-register">
                    <div class="panel panel-default ">
                        <div class="panel-body" style="padding: 40px;">
                            <h1>Edit post</h1>

                            <%--<form:form id="new-post-form" class="nobottommargin" method="POST" commandName="post" action="/posts/${post.id}/edit">--%>
                            <c:url var="post_edit_url"  value="/posts/${post.id}/edit" />
                            <form:form id="new-post-form" class="nobottommargin" method="POST" commandName="post" action="${post_edit_url}">

                                <div class="col_full">
                                    <label class="control-label" for="post_id"></label>
                                    <form:input path="id" type="hidden" id="post_id" name="post_id" value="${post.id}" class="form-control"></form:input>
                                </div>

                                <div class="col_full">
                                    <label class="control-label" for="post_title">Title</label>
                                    <form:input path="title" type="text" id="post_title" name="post_title" value="${post.title}" class="form-control"></form:input>
                                </div>

                                <div class="col_full">
                                    <label class="control-label" for="post_content">Content</label>
                                    <form:textarea path="content"  id="post_content" name="post_content" value="${post.content}" class="form-control"></form:textarea>
                                </div>

                                <div class="col_full nobottommargin">
                                    <button class="button button-3d nomargin" id="register-form-submit"
                                            name="register-form-submit" value="register">Save
                                    </button>
                                </div>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:applicationLayout>