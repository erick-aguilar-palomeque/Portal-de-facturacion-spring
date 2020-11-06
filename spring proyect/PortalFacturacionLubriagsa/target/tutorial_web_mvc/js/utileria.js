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
            data: {nombre:$("#txt_nombre").val()},
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
                    { "data": "id" },
                    { "data": "nombre" }
                ]
        } );
        
    }
    
    
