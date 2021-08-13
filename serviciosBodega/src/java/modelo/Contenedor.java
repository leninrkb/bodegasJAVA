/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author leninrkb
 */
public class Contenedor {
    private String bodega;
    private String bodegaID;
    private String ciudad;
    private String ciudadID;
    private String producto;
    private String productoID;
    private String precio;
    private String stock;
    private String disp;

    public Contenedor(String bodega, String bodegaID, String ciudad, String ciudadID, String producto, String productoID, String precio, String stock, String disp) {
        this.bodega = bodega;
        this.bodegaID = bodegaID;
        this.ciudad = ciudad;
        this.ciudadID = ciudadID;
        this.producto = producto;
        this.productoID = productoID;
        this.precio = precio;
        this.stock = stock;
        this.disp = disp;
    }

    public Contenedor() {
    }

    public String getBodega() {
        return bodega;
    }

    public void setBodega(String bodega) {
        this.bodega = bodega;
    }

    public String getBodegaID() {
        return bodegaID;
    }

    public void setBodegaID(String bodegaID) {
        this.bodegaID = bodegaID;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCiudadID() {
        return ciudadID;
    }

    public void setCiudadID(String ciudadID) {
        this.ciudadID = ciudadID;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getProductoID() {
        return productoID;
    }

    public void setProductoID(String productoID) {
        this.productoID = productoID;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getDisp() {
        return disp;
    }

    public void setDisp(String disp) {
        this.disp = disp;
    }

    

    
    
    
}
