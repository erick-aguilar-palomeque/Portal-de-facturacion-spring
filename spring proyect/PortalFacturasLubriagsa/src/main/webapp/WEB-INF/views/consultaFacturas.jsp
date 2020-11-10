<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap jquery -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>        
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <script src="${pageContext.request.contextPath}/js/utileria.js"></script>
        <!--PDF-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
        <!--<script src="${pageContext.request.contextPath}/js/pdfGenerator.js" type="module"></script>-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultaFacturasStyle.css">

    <title>Document</title>
</head>

<body>
    <header class="main-header">
        <div class="left">
            <i class="icon-menu" id="btn-menu"></i>
            <a href="home.do">
                <h1>PORTAL FACTURACION</h1>
            </a>
        </div>
        <div class="right">
            <i class="icon-user-circle-o"></i>
            <i class="icon-down-dir" id="btn-user"></i>
        </div>
    </header>

    <div class="user-window" id="user-window">
        <p>Erick Aguilar</p>
        <p>aguilar505088@gmail.com</p>
    </div>

    <div class="container-menu" id="container-menu">
        <div class="cont-menu" id="cont-menu">
            <nav>
                <a href="consulta.do">
                    <i class="icon-doc-text"></i><span>Consulta formularios</span>
                </a>
            </nav>
        </div>
    </div>

    <div class="pseudo-body" id="pseudo-body">
        <div class="section-div" id="contenido">
            <h1 class="f-title">Consulta de facturas</h1>
            <div class="filtros">
                <fieldset>
                    <legend>Filtros</legend>
                    <div class="up">
                        <div class="anio">
                            Año:
                            <input type="number" value="2020" min="2000" max="2020" step="1">
                        </div>
                        <div class="mes">
                            Mes:
                            <select name="anio-mes" id="anio-mes" class="select"></select>
                        </div>
                        <div class="dia">
                            Día:
                            <input type="number" value="1" min="1" max="31" step="1">
                        </div>
                        <div class="hora-inicial">
                            Hora inicial:
                            <div class="selects">
                                <select name="hora-inicial-hora" id="hora-inicial-hora" class="select"></select>
                                <select name="hora-inicial-minuto" id="hora-inicial-minuto" class="select"></select>
                                <select name="hora-inicial-segundo" id="hora-inicial-segundo" class="select"></select>
                            </div>
                        </div>
                        <div class="hora-final">
                            Hora final:
                            <div class="selects">
                                <select name="hora-final-hora" id="hora-final-hora" class="select"></select>
                                <select name="hora-final-minuto" id="hora-final-minuto" class="select"></select>
                                <select name="hora-final-segundo" id="hora-final-segundo" class="select"></select>
                            </div>
                        </div>

                    </div>
                    <div class="down">
                        <a href="#open-modal-uno">
                            <button class="boton-generico" id="btn-search-filtros">Buscar
                            </button>
                        </a>
                    </div>
                </fieldset>
            </div>
            <!--Fin filtros -->
            
            <button id="btn_guardar" class="boton-generico" OnClick="get()"> Ver </button>   
            <button id="btn_generate_pdf" class="boton-generico" OnClick="generatePdf()"> Generar pdf</button> 
            <div class="table">
                <table id="tabla-facturas" class="table-bordered table-hover">
                <!--<table id="tabla-facturas" class= "table table-bordered">-->
                    <thead>
                        <tr class="encabezado">

                            <th id="seleccionar">
                                <div class="seleccionar">
                                    <input type="checkbox">
                                </div>
                            </th>
                            <th id="folio-fiscal">
                                <div class="folio-fiscal">
                                    <span>Folio fiscal</span>
                                    <input type="text">
                                </div>
                            </th>
                            <th id="rfc-emisor">
                                <div class="rfc-emisor">
                                    <span>RFC emisor</span>
                                    <input type="text">
                                </div>
                            </th>
                            <th id="rfc-cliente">
                                <div class="rfc-cliente">
                                    <span>RFC del cliente</span>
                                    <input type="text">
                                </div>
                            </th>
                            <th id="nombre-cliente">
                                <div class="nombre-cliente">
                                    <span>Nombre del cliente</span>
                                    <input type="text">
                                </div>
                            </th>
                            <th id="serie-facturacion">
                                <div class="serie-facturacion">
                                    <span>Serie de facturacion</span>
                                    <input type="text">
                                </div>
                            </th>
                            <th id="fecha-hora-emision">
                                <div class="fecha-hora-emision">
                                    <span>Fecha y hora de Emisión</span>
                                </div>
                            </th>
                            <th id="total">
                                <div class="total">
                                    <span>Total</span>
                                </div>
                            </th>
                            <th id="status">
                                <div class="status">
                                    <span>Estado</span>
                                    <select name="status" id="status"></select>
                                </div>
                            </th>
                            <th id="visualizar">
                                <div class="visualizar">
                                    <span>Visualizar</span>
                                </div>
                            </th>
                            <th id="descargar">
                                <div class="descargar">
                                    <span>Descargar</span>
                                </div>
                            </th>
                        </tr>                        
                    </thead>
<!--                    <tbody>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <i class="icon-doc-inv"></i>
                            </td>
                            <td>
                                <button class="boton-table">PDF
                                </button>
                                <button class="boton-table">XML
                                </button>
                            </td>
                        </tr>
                    </tbody>-->
                </table>
            </div>
            <!--fin tabla-->
            <div class="facturas-seleccionadas">
                <button class="boton-generico">Enviar facturas
                </button>
                <button class="boton-generico">PDF
                </button>
                <button class="boton-generico">XML
                </button>
            </div>
            
            <div>
                <object data="${pageContext.request.contextPath}/pdfs/pdf.pdf" type="application/pdf" width="700" height="400">
                    alt : <a href="test.pdf">pdf.pdf</a>
                </object>
            </div>  
            
            <div id="botones-factura">
                <a href="${pageContext.request.contextPath}/pdfs/pdf.pdf" download rel="noopener noreferrer" target="_blank">
                    <button  class="boton-generico" > PDF </button>   
                </a>
                <button  class="boton-generico" > XML </button>   
                        
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <!-- <div class="modal-envio-facturas" id="open-modal-uno">
                <a href="#close">
                    <p>Hola</p>
                </a>
            </div> -->


        </div>
        <!--fin contentenido-->
    </div>
    <!--fin pseudo body-->
<!--    <button onclick="createPdf()">Crear</button>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
        <script> 
            function createPdf(){
                const doc = new jsPDF();
                doc.text("Hello world!", 10, 10);
                doc.save("a4.pdf");
                console.log("termino")
            }
        </script>-->
            
    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
</body>

</html>