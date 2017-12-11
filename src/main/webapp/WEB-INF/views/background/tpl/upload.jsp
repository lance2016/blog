<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<form id="uploadForm"  class="col-md-3 col-md-offset-2">

    上传文件：<input type="file" name="uploadfile">
              <input type="submit" class="btn btn-primary" value="上传" onclick="doUpload()">
</form>
<script type="text/javascript">

    function doUpload() {
        var formData = new FormData($( "#uploadForm" )[0]);
        $.ajax({
            url: '<%=basePath%>user/upload',
            type: 'POST',
            cache: false,
            data: formData,
            async: false,
            contentType: false,
            processData: false,
            success: function (returndata) {
                alert("上传成功");
                load("upload","#right");
            },
            error: function (returndata) {
                alert(returndata);
            }
        });
    }

</script>
