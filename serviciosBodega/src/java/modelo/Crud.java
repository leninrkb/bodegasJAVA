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

    public List getDatos(String producto);//recupera todos los datos del maestro buscando por nombre de producto

    public Boolean login(String usuario, String contrasenia); //valida el login

    public String tipoUsuario(String usuario); //retorna el tipo de usuario

    public List getProductos(String nombre);//retorna todos los productos

    public String ciudadUsuario(String usuario);//retorna la ciudad del usuario

    public List getDatosXCiudad(String ciudad, String producto);//retorna los datos del maestro segun la ciudad

    public Boolean verificarCompra(String bodegaID, String productoID, Integer cantidad);//verifica que exista suficiente stock

    public List bodegasCiudad(String ciudad); //recupera las bodegas que existen en una ciudad

    public Boolean comprar(String bodegaID, String productoID, Integer cantidad);//realiza la compra sin verificar, x lo q primero se usa verificarCompra()

    public Boolean addproducto(String nombre, Integer precio);  //Permite ingresar los productos

    public Boolean editproducto(String id, String nombre, Integer precio); //Permite editar los productos 
    
    public List getCiudades();//retorna todas ciudades existentes
    
    public Boolean ingresarProducto(String bodegaID, String productoID, Integer cantidad);//ingresa un producto al maestro
}
