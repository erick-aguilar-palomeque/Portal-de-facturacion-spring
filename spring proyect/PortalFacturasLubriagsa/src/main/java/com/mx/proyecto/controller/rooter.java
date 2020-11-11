package com.mx.proyecto.controller;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.json.*;

import com.mx.proyecto.dao.Objeto_test;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

    @RequestMapping(value = "index.do")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("titulo", "SPRING MVC");
        mv.addObject("mensaje", "Esta es una prueba de CRUD :: SPRING");
        
        mv.setViewName("hello");
        
        return mv;
    }
    
    @RequestMapping(value = "get.do")
    @ResponseBody
    public String retorna_string() {        
        return "Hola daniel";        
    }
    
    @RequestMapping(value = "insert.do")
    @ResponseBody
    public String insert() {
        
        System.out.println("Se obtienen del modelo la informacón insert.do");
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        Objeto_test obj = (Objeto_test) ctx.getBean("Objeto_test");
        String retorno = "Registro creado";
        if(!obj.insert())
        {
            retorno = "Error al ingresar registro";
        }
        return retorno;
    }
            
    @RequestMapping(value = "select.do",method = RequestMethod.GET)
    @ResponseBody
    public String select() {        
        System.out.println("Se obtienen del modelo la informacón select.do");
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        Objeto_test obj_sap = (Objeto_test) ctx.getBean("Objeto_test");
        
        JSONObject retorno = new JSONObject();
        retorno.put("data", obj_sap.select());
                
        return retorno.toString();
        
    }
}
