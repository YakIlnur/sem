<%@tag description="Layout" pageEncoding="UTF-8"%>
<%@attribute name="title" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        My Blog
        <c:if test="${not empty title}" >:: ${title}</c:if>
    </title>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/login.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>


    <%--<link href="/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="/resources/css/style.css" rel="stylesheet">--%>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/style.css" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/css/dark.css" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/css/animate.css" type="text/css" />
    <link rel="stylesheet" href="/resources/canvas/css/magnific-popup.css" type="text/css" />

    <link rel="stylesheet" href="/resources/canvas/css/responsive.css" type="text/css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/blocks/menu.jsp"/>

<div class="container">
    <jsp:doBody/>
</div>

<jsp:include page="/WEB-INF/pages/blocks/footer.jsp"/>

</body>
</html>