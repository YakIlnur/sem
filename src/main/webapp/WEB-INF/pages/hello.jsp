<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:applicationLayout title="Hello">

    <a href="/newUser">Registration</a><br/>
    <a href="/Sign_in">Sign_in</a><br/>
    <a href="/users/1">User with id=1</a><br/>
    <a href="/posts/1">Post with id=1</a><br/>
    <a href="/posts">All Posts</a><br/>
    <a href="/users">All Users</a><br/>

</t:applicationLayout>