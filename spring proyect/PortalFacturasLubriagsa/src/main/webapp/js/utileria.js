/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    function insert()
    {
        $.ajax({
            url : 'insert.do',
            type : "POST",
            data: {},
            beforeSend : function(xhr) {
            },
            success : function(jsonResponse, textStatus, jqXHR) {
                alert(jsonResponse);
                get();
            },
            error : function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });
    }
    
    function insert2()
    {
        $.ajax({
            url : 'insert2.do',
            type : "POST",
            data: {nombre_prueba:$("#txt_nombre2").val()},
            beforeSend : function(xhr) {
            },
            success : function(jsonResponse, textStatus, jqXHR) {
                alert(jsonResponse);
                get();
            },
            error : function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });
    }

    
    var tabla=null;
    var tabla2=null;
    function get()
    {
        /*$.ajax({
            url : 'get.do',
            type : "POST",
            data: {},
            beforeSend : function(xhr) {
            },
            success : function(jsonResponse, textStatus, jqXHR) {
                alert(jsonResponse);
            },
            error : function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });*/
        
        if(tabla!=null){tabla.destroy();}
            tabla=$('#tabla').DataTable( {
                "ajax": "select.do",
                "columns": [
                    { "data": "id" }
                ]
        } );
        
//        if(tabla2!=null){tabla2.destroy();}//si la tabla esta vacia la destruimos
//            tabla2=$('#tabla2').DataTable({
//                "ajax": "select2.do",
//                "columns": [
//                    {data: "id_prueba"},
//                    {data: "nombre_prueba"}                 
//                ]
//            });
        
        
    }
    
    
