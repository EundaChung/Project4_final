<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: eunda
  Date: 2023/11/17
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="fileform_ok.jsp" enctype="multipart/form-data">
  이미지를 선택하세요 : <input type="file" name="img1" />
  <input type="submit" value="upload"/>
    <%
        String filename= "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        MultipartRequest multpartRequest = null;
        multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

        filename = multpartRequest.getFilesystemName("photo");
%>
    파일명 : <%=filename%> <br/>
    <img src ="${pageContext.request.contextPath}/upload/<%=filename%>">

</form>

</body>
</html>


