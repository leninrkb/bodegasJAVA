/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author leninrkb
 */
public interface Crud {
    public List getDatos(String producto);
    public Boolean login(String usuario, String contrasenia);
    public String tipoUsuario(String usuario); 
    public List getProductos();
    public String ciudadUsuario(String usuario);
    public List getDatosXCiudad(String ciudad, String producto);
}
