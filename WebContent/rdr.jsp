<%@page import="model.dto.Student"%>
<%

	if (session.getAttribute("stu") == null) {
		response.sendRedirect("student/index.jsp");
	}
%>
<script>
	alert(1);
</script>
