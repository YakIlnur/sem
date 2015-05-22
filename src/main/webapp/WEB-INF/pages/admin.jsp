<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<head>
    <title>Admin_Page</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body>


<div class="row">
    <div class="col-md-6">
        <div class="col-md-6"><h3>Users</h3></div>
        <br/>
        ${searchUserResult}
        <br/>
        <table class="table table-hover">
            <th>Delete</th>
            <c:forEach var="user" items="${listUser}" varStatus="status">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.authority}</td>
                    <td>
                        <a href="/deleteUser?username=${user.username}">Delete</a>
                    </td>
                    <td>
                            <form action="users/${user.username}/edit" method="get">

                                <div class="col_full">
                                    <input type="text" id="login-form-username" name="username" value="${user.username}" class="form-control" />
                                </div>

                                <div class="col_full">
                                    <input type="text" id="login-form-role" name="role" value="" class="form-control" />
                                </div>

                                <div class="col_full nobottommargin">
                                    <button class="button button-3d button-black nomargin" id="login-form-submit" name="login-form-submit" value="login">Edit</button>
                                </div>
                            </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>