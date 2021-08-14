/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leninrkb
 */
public class ContenedorDAO implements Crud {

    PreparedStatement ps;
    ResultSet rs;
    Conexion con = new Conexion();
    Connection conn;
    Integer res;
    String msj;
    Producto pro = new Producto();

    //carga los datos dependiendo de la palabra ingresada, si no se ingresa nada carga todo. 
    //servicio para cargar y buscar
    @Override
    public List getDatos(String producto) {
        List<Contenedor> datos = new ArrayList<>();
        String sql = "";

        if (producto == null || producto == " ") {
            sql = "select * from maestrobodega m, ciudad c, producto p, bodega b "
                    + "where b.id_bod=m.id_bod_mae "
                    + "and p.id_pro=m.id_pro_mae "
                    + "and c.id_ciu=b.id_ciu_bod ";

        } else {
            sql = "select * from maestrobodega m, ciudad c, producto p, bodega b "
                    + "where b.id_bod=m.id_bod_mae "
                    + "and p.id_pro=m.id_pro_mae "
                    + "and c.id_ciu=b.id_ciu_bod "
                    + "and nom_pro like '%" + producto + "%'";
        }

        try {

            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Contenedor c = new Contenedor();

                c.setBodega(rs.getString("nom_bod"));
                c.setCiudad(rs.getString("nom_ciu"));
                c.setPrecio(rs.getString("pre_pro"));
                c.setProducto(rs.getString("nom_pro"));
                c.setStock(rs.getString("stock_mae"));
                c.setDisp(rs.getString("disp_mae"));

                c.setBodegaID(rs.getString("id_pro"));
                c.setProductoID(rs.getString("id_pro"));
                c.setCiudadID(rs.getString("id_ciu"));

                datos.add(c);
            }

        } catch (Exception e) {
        }

        return datos;
    }

    //valida el ingreso
    @Override
    public Boolean login(String usuario, String contrasenia) {
        String sql = "select * from usuario "
                + "where nom_usu='" + usuario + "' "
                + "and pass_usu='" + contrasenia + "'";

        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }

        return false;
    }

    //recupera el tipo de usuario
    @Override
    public String tipoUsuario(String usuario) {
        String tipo = null;
        String sql = "select tip_usu from usuario "
                + "where nom_usu='" + usuario + "'";

        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return tipo = rs.getString("tip_usu");
            }
        } catch (Exception e) {
        }

        return tipo;
    }

    //recuepra todos los productos
    @Override
    public List getProductos() {
        List<Producto> datos = new ArrayList<>();
        String sql = "select * from producto";

        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString("id_pro"));
                p.setNombre(rs.getString("nom_pro"));
                p.setPrecio(rs.getString("pre_pro"));

                datos.add(p);
            }
        } catch (Exception e) {
        }

        return datos;
    }

    //recupera la ciudad del usuario
    @Override
    public String ciudadUsuario(String usuario) {
        String sql = "select nom_ciu from usuario u, ciudad c "
                + "where u.id_ciu_usu=c.id_ciu "
                + "and u.nom_usu = '" + usuario + "'";
        String ciudad = "";
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return ciudad = rs.getString("nom_ciu");
            }
        } catch (Exception e) {
        }

        return ciudad;
    }

    //busca los datos del maestro por ciudad y producto
    @Override
    public List getDatosXCiudad(String ciudad, String producto) {
        List<Contenedor> datos = new ArrayList<>();
        String sql;

        if (producto == null || producto == "") {
            sql = "select * from maestrobodega m, ciudad c, producto p, bodega b "
                    + "where b.id_bod=m.id_bod_mae "
                    + "and p.id_pro=m.id_pro_mae "
                    + "and c.id_ciu=b.id_ciu_bod "
                    + "and c.nom_ciu='" + ciudad + "'";

        } else {
            sql = "select * from maestrobodega m, ciudad c, producto p, bodega b "
                    + "where b.id_bod=m.id_bod_mae "
                    + "and p.id_pro=m.id_pro_mae "
                    + "and c.id_ciu=b.id_ciu_bod "
                    + "and c.nom_ciu like '%" + ciudad + "%' "
                    + "and nom_pro like '%" + producto + "%'";
        }

        try {

            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Contenedor c = new Contenedor();

                c.setBodega(rs.getString("nom_bod"));
                c.setCiudad(rs.getString("nom_ciu"));
                c.setPrecio(rs.getString("pre_pro"));
                c.setProducto(rs.getString("nom_pro"));
                c.setStock(rs.getString("stock_mae"));
                c.setDisp(rs.getString("disp_mae"));

                c.setBodegaID(rs.getString("id_bod"));
                c.setProductoID(rs.getString("id_pro"));
                c.setCiudadID(rs.getString("id_ciu"));

                datos.add(c);
            }

        } catch (Exception e) {
        }

        return datos;
    }

    
    //verifica antes de comprar
    @Override
    public Boolean verificarCompra(String bodegaID, String productoID, Integer cantidad) {
        String sql = "select * from maestrobodega "
                + "where id_pro_mae='" + productoID + "' "
                + "and id_bod_mae='" + bodegaID + "' ";
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                String sn = rs.getString("disp_mae");
                if (sn.equals("s")) {

                    Integer stock = Integer.parseInt(rs.getString("stock_mae"));
                    if (stock >= cantidad) {
                        return true;
                    }
                }

            }

        } catch (Exception e) {
        }

        return false;
    }

    
    //retorna las bodegas de una ciudad x, si no hay ciudad retorna todo
    @Override
    public List bodegasCiudad(String ciudad) {
        List<Bodega> datos = new ArrayList<>();
        String sql = "select * from bodega b, ciudad c "
                + "where c.nom_ciu like '%" + ciudad + "%' "
                + "and b.id_ciu_bod=c.id_ciu";

        try {

            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Bodega b = new Bodega();

                b.setBodegaID(rs.getString("id_bod"));
                b.setBodega(rs.getString("nom_bod"));
                b.setBodegaRUC(rs.getString("ruc_emp_bod"));
                b.setCiudad(rs.getString("id_ciu_bod"));

                datos.add(b);
            }

        } catch (Exception e) {
        }

        return datos;
    }

    
    //verifica y compra, tiene en cuenta el stock y la disponibilidad
    @Override
    public Boolean comprar(String bodegaID, String productoID, Integer cantidad) {
        String sql = "update maestrobodega "
                + "set stock_mae=stock_mae-" + cantidad + " "
                + "where id_bod_mae='" + bodegaID + "' "
                + "and id_pro_mae='" + productoID + "' ";
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            Integer i = ps.executeUpdate();

            if (comprobarStock(bodegaID, productoID)) {
                if (updateDisponibilidad(bodegaID, productoID)) {
                    return true;
                }
            }

            return true;

        } catch (Exception e) {
        }
        return false;
    }

    //comprueba el stock
    private Boolean comprobarStock(String bodegaID, String productoID) {
        String sql = "select * from maestrobodega "
                + "where id_pro_mae='" + productoID + "' "
                + "and id_bod_mae='" + bodegaID + "' ";
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {

                Integer stock = Integer.parseInt(rs.getString("stock_mae"));
                if (stock == 0) {
                    return true;
                }
            }

        } catch (Exception e) {
        }
        return false;
    }

    //actualiza la disponibilidad del producto
    private Boolean updateDisponibilidad(String bodegaID, String productoID) {
        String sql = "update maestrobodega "
                + "set disp_mae= 'n' "
                + "where id_bod_mae='" + bodegaID + "' "
                + "and id_pro_mae='" + productoID + "' ";
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            Integer i = ps.executeUpdate();
            if (i == 0) {
                return true;
            }
        } catch (Exception e) {
        }

        return false;
    }

    
    //esta de revisar q funcione al 100%
    @Override
    public String addproducto(String id, String nombre, String precio) {
        String sql = "Insert into producto(id_pro, nom_pro, pre_pro) values(?,?,?)";

        try {
            conn = con.getConexion();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, nombre);
            ps.setString(3, precio);

            res = ps.executeUpdate();

            if (res == 1) {
                msj = "Se Ingresó El Producto";
            } else {
                msj = "No Se Ingresó El Producto";
            }
        } catch (Exception e) {
        }

        return msj;
    }

    
    //esta de revisar q funcione al 100%
    @Override
    public String editproducto(String id, String nombre, String precio) {
        String sql = "Update producto set nom_pro=?,pre_pro=? where id_pro=" + id;

        try {
            conn = con.getConexion();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, precio);
            res = ps.executeUpdate();

            if (res == 1) {
                msj = "Se Modificó El Producto";
            } else {
                msj = "No Se Modificó El Producto";
            }
        } catch (Exception e) {
        }

        return msj;
    }

    
    //esta de revisar q funcione al 100%
    @Override
    public Producto eliminarproducto(String id) {
        String sql = "delete from producto where id_pro=" + id + " ";

        try {
            conn = con.getConexion();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            res = ps.executeUpdate();

        } catch (Exception e) {
        }
        return pro;
    }

    @Override
    public List getCiudades() {
        List<Ciudad> datos = new ArrayList<>();
        String sql = "select * from ciudad";
        
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                Ciudad c = new Ciudad();
                
                c.setId(rs.getString("id_ciu"));
                c.setCiudad(rs.getString("nom_ciu"));
                
                datos.add(c);
            }
            
            return datos;
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public Boolean ingresarProducto(String bodegaID, String productoID, Integer cantidad) {
        String sql = "insert into maestrobodega(id_bod_mae, id_pro_mae, stock_mae, disp_mae) "
                + "values(?,?,?,?)";
        
        try {
            conn = con.getConexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bodegaID);
            ps.setString(2, productoID);
            ps.setInt(3, cantidad);
            ps.setString(4, "s");
            res = ps.executeUpdate();
            
            if (res == 1) {
                return true;
            }
        } catch (Exception e) {
        }
       return false;
    }

}
