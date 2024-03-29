/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import servicios.Producto;

/**
 *
 * @author leninrkb
 */
public class Servicios {

    public java.util.List<servicios.Contenedor> getDatos(java.lang.String producto) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.getDatos(producto);
    }

    public Boolean login(java.lang.String usuario, java.lang.String contrasenia) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.login(usuario, contrasenia);
    }

    public String tipoUsuario(java.lang.String usuario) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.tipoUsuario(usuario);
    }

    public String ciudadUsuario(java.lang.String usuario) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.ciudadUsuario(usuario);
    }

    public java.util.List<servicios.Contenedor> getDatosXCiudad(java.lang.String ciudad, java.lang.String producto) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.getDatosXCiudad(ciudad, producto);
    }

    public java.util.List<servicios.Bodega> bodegasCiudad(java.lang.String ciudad) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.bodegasCiudad(ciudad);
    }

    public Boolean verificarCompra(java.lang.String productoID, java.lang.String bodegaID, java.lang.Integer cantidad) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.verificarCompra(productoID, bodegaID, cantidad);
    }
    


    public Boolean comprar(java.lang.String bodegaID, java.lang.String productoID, java.lang.Integer cantidad) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.comprar(bodegaID, productoID, cantidad);
    }

    public java.util.List<servicios.Ciudad> getCiudades() {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.getCiudades();
    }

    public Boolean ingresarProducto(java.lang.String bodegaID, java.lang.String productoID, int cantidad) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.ingresarProducto(bodegaID, productoID, cantidad);
    }

    public java.util.List<servicios.Producto> getProductos(java.lang.String nombre) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.getProductos(nombre);
    }

    public Boolean addproducto(java.lang.String nombre, java.lang.Integer precio) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.addproducto(nombre, precio);
    }

    public Boolean editproducto(java.lang.String id, java.lang.String nombre, java.lang.Integer precio) {
        servicios.Servicio_Service service = new servicios.Servicio_Service();
        servicios.Servicio port = service.getServicioPort();
        return port.editproducto(id, nombre, precio);
    }
 
}
