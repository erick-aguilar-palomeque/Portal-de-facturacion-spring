/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mx.proyecto.dao;

import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author erick
 */
public class objetoPrueba {
    private DataSource dataSource;

    public DataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public boolean insert (String nombre2){
        JdbcTemplate jdbcTemplate = new JdbcTemplate (dataSource);
        boolean flag = true;
        int num_afectados = 0;
        System.out.println("NOMBRE: "+nombre2);
        try{
            num_afectados = jdbcTemplate.update(
                    "INSERT INTO prueba (nombre_prueba) VALUES (?)",
                    nombre2
            );
        } catch (DataAccessException e){
            flag = false;
        }
        return flag;
    }
    
    public List<Map<String,Object>> select (){
        String query = "SELECT * FROM prueba";
        JdbcTemplate jdbcTemplate = new JdbcTemplate (dataSource);
        List<Map<String,Object>> ejemploRows = jdbcTemplate.queryForList(query);
        
        
        return ejemploRows;                
    }
}
