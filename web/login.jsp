<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
	<title>Visitor Pass</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />	
</head>
<body>
	<div align="center">
		<c:if test="${param.user == 'admin' && param.pass == 'admin123'}">
			<c:set var="login" value="${'admin'}" scope="session" />		
			<c:redirect url="main.jsp" />
					
		</c:if>
		<c:redirect url="index.html" />
	</div>
</body>
</html>