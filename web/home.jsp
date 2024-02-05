<%@ page import="models.Tasks" %>
<%@ page import="java.util.List" %><%--  Created by IntelliJ IDEA.
  User: admin
  Date: 01.02.2024
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div>

</div>
<div class="container p-0">
    <div class="mt-1">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            + Добавить задание
        </button>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Tasks> tasksList = (List<Tasks>) request.getAttribute("tasks");
            String status;
            for(Tasks task: tasksList) {
                if (task.isStatus()) {
                    status = "Да";
                }
                else status = "Нет";
             %>
        <tr>
            <td><%=task.getId()%></td>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadlineDate()%></td>
            <td><%=status%></td>
            <td>
                <a class="btn btn-dark" href="/details?id=<%=task.getId()%>">Детали</a>
            </td>
        </tr>
            <%}
        %>
        </tbody>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Добавить задачу</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/addTask" method="post">
                    <div class="mb-3">
                        <label for="exampleInputName" class="form-label">Наименование:</label>
                        <input type="text" name="name" class="form-control" id="exampleInputName">
                    </div>
                    <div class="mb-1">
                        <label for="exampleInputName1" class="form-label">Описание:</label>
                    </div>
                    <div class="mb-3">
                        <textarea id="exampleInputName1" name="description" rows="4" class="form-control"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputName2" class="form-label">Крайниый срок:</label>
                        <input type="date" name="deadlineDate" class="form-control" id="exampleInputName2">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputName3" class="form-label">Выполнено:</label>
                        <select name="status" id="exampleInputName3" style="width: 100%;">
                            <option value="true"> Да</option>
                            <option value="false">Нет</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-success">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
