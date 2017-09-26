<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'student_list.jsp' starting page</title>
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.11.1.js" type="text/javascript"
    charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.js" type="text/javascript"
    charset="utf-8"></script>
</head>
<body>
    <div class="container" style="width:70%">
       <div align="center">
           <h2 style="display: inline" >学生信息管理系统</h2> 欢迎您：${student.getName()} <a href="${pageContext.request.contextPath}/loginFilter?method=loginOut">退出</a>
       </div>
       <hr/>
       
       <form id="mainForm" action="" method="post">
           <table class="table table-bordered table-hover table-striped">
               <tr>
                  <td>
                      <input type="checkbox" id="selectAll" onClick="selectAlls();"/>
                  </td>
                  <td>ID</td>
                  <td>姓名</td>
                  <td>年龄</td>
                  <td>性别</td>
                  <td>住址</td>
                  <td>出生日期</td>
                  <td>删除</td>
                  <td>修改</td>
               </tr>
               <c:forEach items="${list}" var="student">
                  <tr>
                      <td>
                          <input type="checkbox" name="selectIds" value="${student.id}"/>
                      </td>
                      <td>${student.id}</td>
                      <td>${student.name}</td>
                      <td>${student.age}</td>
                      <td>${student.gender}</td>
                      <td>${student.address}</td>
                      <td>${student.birthday}</td>
                      <td><a href="javascript:void(0);"
                          onclick="delStudent('${student.getId()}')">删除</a>
                      </td>
                      <td><a
                          href="${pageContext.request.contextPath}/student?method=toUpdate&id=${student.getId()}">修改</a>
                      </td>
                  </tr>
               </c:forEach>
           </table>
       </form>
    </div>
</body>
</html>
