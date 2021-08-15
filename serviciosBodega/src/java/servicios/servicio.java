/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import modelo.Bodega;
import modelo.Ciudad;
import modelo.Contenedor;
import modelo.ContenedorDAO;
import modelo.Producto;

/**
 *
 * @author leninrkb
 */
@WebService(serviceName = "servicio")
public class servicio {

    /**
     * This is a sample web service operation
     */
    //Para poder listar
    ContenedorDAO ed = new ContenedorDAO();
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    ContenedorDAO c = new ContenedorDAO();

    @WebMethod(operationName = "getDatos")
    public List<Contenedor> getDatos(@WebParam(name = "producto") String producto) {

        return c.getDatos(producto);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public Boolean login(@WebParam(name = "usuario") String usuario, @WebParam(name = "contrasenia") String contrasenia) {
        //TODO write your implementation code here:
        return c.login(usuario, contrasenia);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "tipoUsuario")
    public String tipoUsuario(@WebParam(name = "usuario") String usuario) {
        //TODO write your implementation code here:
        return c.tipoUsuario(usuario);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getProductos")
    public List<Producto> getProductos(@WebParam(name = "nombre") String nombre) {
        //TODO write your implementation code here:
        return c.getProductos(nombre);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ciudadUsuario")
    public String ciudadUsuario(@WebParam(name = "usuario") String usuario) {
        //TODO write your implementation code here:
        return c.ciudadUsuario(usuario);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getDatosXCiudad")
    public List<Contenedor> getDatosXCiudad(@WebParam(name = "ciudad") String ciudad, @WebParam(name = "producto") String producto) {
        //TODO write your implementation code here:
        return c.getDatosXCiudad(ciudad, producto);
    }

    @WebMethod(operationName = "bodegasCiudad")
    public List<Bodega> bodegasCiudad(@WebParam(name = "ciudad") String ciudad) {
        //TODO write your implementation code here:
        return c.bodegasCiudad(ciudad);
    }

    @WebMethod(operationName = "verificarCompra")
    public Boolean verificarCompra(@WebParam(name = "bodegaID") String bodegaID, @WebParam(name = "productoID") String productoID, @WebParam(name = "cantidad") Integer cantidad) {
        //TODO write your implementation code here:
        return c.verificarCompra(bodegaID, productoID, cantidad);
    }
    
    @WebMethod(operationName = "comprar")
    public Boolean comprar(@WebParam(name = "bodegaID") String bodegaID, @WebParam(name = "productoID") String productoID, @WebParam(name = "cantidad") Integer cantidad) {
        //TODO write your implementation code here:
        return c.comprar(bodegaID, productoID, cantidad);
    }
    /**
     * Web service operation
     */
    @WebMethod(operationName = "addproducto")
    public Boolean addproducto(@WebParam(name = "nombre") String nombre, @WebParam(name = "precio") Integer precio) {
       return ed.addproducto(nombre, precio);
        
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "editproducto")
    public Boolean editproducto(@WebParam(name = "id") String id, @WebParam(name = "nombre") String nombre, @WebParam(name = "precio") Integer precio) {
        //TODO write your implementation code here:
        return  ed.editproducto(id, nombre, precio);
       
    }
    
    
    @WebMethod(operationName = "getCiudades")
    public List<Ciudad> getCiudades() {
        //TODO write your implementation code here:
      return ed.getCiudades();
        
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ingresarProducto")
    public Boolean ingresarProducto(@WebParam(name = "bodegaID") String bodegaID, @WebParam(name = "productoID") String productoID, @WebParam(name = "cantidad") int cantidad) {
        //TODO write your implementation code here:
        return ed.ingresarProducto(bodegaID, productoID, cantidad);
    }
}
