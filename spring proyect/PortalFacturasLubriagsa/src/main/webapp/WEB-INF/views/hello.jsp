<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="${pageContext.request.contextPath}/js/utileria.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <!--<link rel="stylesheet" href="<c:url value="./../../css/styles.css" />"/>-->
        <!--ESTE ES EL LINK-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
        <!--<link rel="stylesheet" href="./../../css/styles.css"/>-->
        <!--SI LE DOY CTRL + CLICK SE PUEDE VER QUE LA RUTA ES CORRECTA-->
         <!--ACA PUSE UNA ETIQUETA STYLE (ASI SI FUNCIONA)-->
        <style>
/*            body{
                background-color: red;
            }*/
        </style>
        
        <title>Spring Web MVC</title>
    </head>
    <body style="width:80%">
        <h1>${titulo}</h1>
        <p>${mensaje}</p>
        
        Nombre
        <input type="text" id="txt_nombre">
        
        <button id="btn_guardar" OnClick="insert()"> Guardar </button>
        
    </body>
</html>

