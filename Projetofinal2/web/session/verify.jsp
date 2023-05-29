<%
    if(session.getAttribute("newUserSession") == null) {
        response.sendRedirect(request.getContextPath());
    }
%>