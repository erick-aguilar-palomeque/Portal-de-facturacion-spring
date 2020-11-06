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
 * @author danie
 */
public class Objeto_test {
    private DataSource dataSource;
        
    public List<Map<String,Object>> select()
    {
        String query = "SELECT * FROM USUARIOS";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<Map<String,Object>> empRows = jdbcTemplate.queryForList(query);
        for(Map<String,Object> empRow : empRows){
            System.out.println(String.valueOf(empRow.get("nombre")));
        }
        return empRows;
    }
    
    public boolean insert(String nombre)
    {
        
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        boolean flag=true;
        int num_afectados=0;
        try
        {
            num_afectados=jdbcTemplate.update(
                        "INSERT INTO usuarios(nombre) VALUES (?)",
                        nombre
            );
            System.out.println(num_afectados);
        }catch (DataAccessException e)
        {
            flag=false;
        }
        return flag;
    }
    

    /**
     * @return the dataSource
     */
    public DataSource getDataSource() {
        return dataSource;
    }

    /**
     * @param dataSource the dataSource to set
     */
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    
}
