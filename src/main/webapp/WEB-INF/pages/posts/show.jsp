<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:applicationLayout title="Post">

        <div class="clearfix">

            <section id="content">

                <div class="content-wrap">

                    <div class="container clearfix">

                        <div class="postcontent nobottommargin col_last clearfix">

                            <div class="single-post nobottommargin">

                                <div class="entry clearfix">

                                    <div class="entry-title">
                                        <h2>${post.title}</h2>
                                    </div>

                                    <ul class="entry-meta clearfix">
                                        <li><i class="icon-calendar3"></i>${post.data}</li>
                                        <li><a href="#"><i class="icon-user"></i>${post.user.username}</a></li>
                                        <li><a href="#"><i class="icon-camera-retro"></i></a></li>
                                    </ul>

                                    <div class="entry-image">
                                        <a href="#"><img src="/resources/images/17.jpg" alt="Blog Single"></a>
                                    </div>

                                    <div class="entry-content notopmargin">

                                        <blockquote><p>${post.content}</p></blockquote>

                                        <c:if test="${post.user.username == pageContext.request.userPrincipal.name}">
                                            <div>
                                                <%--<a href="/posts/${post.id}/delete">Delete Post</a>--%>
                                                <a href="<c:url value="/posts/${post.id}/delete"/>" class="btn btn-danger">Delete Post</a>
                                                <%--<a href="/posts/${post.id}/edit">Edit Post</a>--%>
                                                <a href="<c:url value="/posts/${post.id}/edit"/>" class="btn btn-success">Edit Post</a>
                                            </div>
                                        </c:if>

                                        <div class="si-share noborder clearfix" style="margin-right: 15px">

                                            <span>Share this Post:</span>

                                            <div>
                                                <a href="#" class="social-icon si-borderless si-facebook">
                                                    <i class="icon-facebook"></i>
                                                    <i class="icon-facebook"></i>
                                                </a>
                                                <a href="#" class="social-icon si-borderless si-twitter">
                                                    <i class="icon-twitter"></i>
                                                    <i class="icon-twitter"></i>
                                                </a>
                                                <a href="#" class="social-icon si-borderless si-vk">
                                                    <i class="icon-vk"></i>
                                                    <i class="icon-vk"></i>
                                                </a>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="sidebar nobottommargin clearfix">

                            <div class="sidebar-widgets-wrap">

                                <div class="widget clearfix">

                                    <h4>Recent Posts</h4>

                                    <div id="post-list-footer">
                                        <c:forEach items="${posts}" var="p">
                                            <div class="spost clearfix">
                                                <div class="entry-image">
                                                    <a href="<c:url value="/posts/${p.id}"/>" class="nobg"><img src="/resources/images/2.jpg" alt=""></a>
                                                </div>
                                                <div class="entry-c">
                                                    <div class="entry-title">
                                                        <%--<h4><a href="/posts/${p.id}">${p.title}</a></h4>--%>
                                                        <h4><a href="<c:url value="/posts/${p.id}"/>">${p.title}</a></h4>
                                                    </div>
                                                    <ul class="entry-meta">
                                                        <li>${p.data}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </section>

        </div>

</t:applicationLayout>