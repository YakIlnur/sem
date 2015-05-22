<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="All posts">
    <c:forEach items="${posts}" var="post">
        <div class="entry clearfix">
            <div class="entry-image">
                <a href="#" data-lightbox="image"><img class="image_fade" src="/resources/images/17.jpg" alt="Standard Post with Image"></a>
            </div>
            <div class="entry-title">
                <h2><a href="/posts/${post.id}">${post.title}</a></h2>
            </div>
            <ul class="entry-meta clearfix">
                <li><i class="icon-calendar3"></i> ${post.data}</li>
                <li><a href="#"><i class="icon-user"></i>${post.user.username}</a></li>
                <li><i class="icon-folder-open"></i> <a href="#">Tag</a>, <a href="#">Tag</a></li>
                <li><a href="#"><i class="icon-camera-retro"></i></a></li>
            </ul>
            <div class="entry-content">
                <p>${post.content}</p>
                <a href="/posts/${post.id}" class="more-link">Read More</a>
            </div>
        </div>
    </c:forEach>
</t:applicationLayout>