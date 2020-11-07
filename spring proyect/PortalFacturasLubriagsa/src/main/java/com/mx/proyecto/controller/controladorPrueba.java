/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mx.proyecto.controller;

import com.mx.proyecto.dao.objetoPrueba;
import org.json.JSONObject;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

    @Controller
    public class controladorPrueba {
        
        @RequestMapping (value = "insert2.do")
        @ResponseBody
        public String insert (@RequestParam(required = false) String nombre_prueba) {
            System.out.println("EL NOMBRE ES: "+nombre_prueba);
            System.out.println("Esta entrando al insert2 ");
            ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext ("spring.xml");
            objetoPrueba obj = (objetoPrueba) ctx.getBean("objetoPrueba");
            String retorno = "Registro2 creado";
            if (!obj.insert(nombre_prueba)){
                retorno = "Error al registrar en la segunda tabla";
            }
            return retorno;
        }
        @RequestMapping (value = "select2.do", method = RequestMethod.GET)
        @ResponseBody
        public String select (){
            System.out.println("Se hace el segundo select");
            ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext ("spring.xml");
            objetoPrueba obj = (objetoPrueba) ctx.getBean ("objetoPrueba");

            JSONObject retorno = new JSONObject();
            retorno.put("data", obj.select());

            return retorno.toString();
        }
}


