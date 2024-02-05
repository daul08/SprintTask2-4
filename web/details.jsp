<%@ page import="models.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04.02.2024
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <%
        Tasks task = (Tasks) request.getAttribute("task");
    %>
    <div class="container p-0">
        <div class="row justify-content-center">
            <form action="/updateTask" method="post">
                <div class="col-md-6">
                    <div class="mb-3">
                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <label for="exampleInputName" class="form-label">Наименование:</label>
                        <input type="text" name="name" value="<%=task.getName()%>" class="form-control" id="exampleInputName">
                    </div>
                    <div class="mb-1">
                        <label for="exampleInputName1" class="form-label">Описание:</label>
                    </div>
                    <div class="mb-3">
                        <textarea id="exampleInputName1" name="description" rows="4" class="form-control"><%=task.getDescription()%></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputName2" class="form-label">Крайниый срок:</label>
                        <input type="date" name="deadlineDate" value="<%=task.getDeadlineDate()%>" class="form-control" id="exampleInputName2">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputName3" class="form-label">Выполнено:</label>
                        <select name="status" id="exampleInputName3" style="width: 100%;">
                            <option value="true" <% if (task.isStatus()) {%>selected <%}%>> Да</option>
                            <option value="false" <%if (!task.isStatus()) {%>selected<%}%>>Нет</option>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-success">Сохранить</button>
                    </div>
                </div>
            </form>
            <div>
                <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Удалить</button>
            </div>
            </div>
        </div>


    <!-- Modal for УДАЛИТЬ-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Подтвердите удаление</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/deleteTask" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <h1 style="text-align: center">Вы уверены что хотите удалить запись?</h1>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Нет</button>
                        <button type="submit" class="btn btn-success">Да</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>
