/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Servicios;
import javax.servlet.http.HttpSession;

;

/**
 *
 * @author leninrkb
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String valor = "";
    String add = "add.jsp";
    String edit = "edit.jsp";
    Servicios s = new Servicios();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String accion = request.getParameter("accion");

        switch (accion) {
            case "inicio":
                valor = "pages/inicio.jsp";
                break;

            case "iniciosesion":
                valor = "pages/iniciosesion.jsp";
                break;

            case "ingresar":
                String usuario = request.getParameter("usuario");
                String contrasenia = request.getParameter("contrasenia");
                session.setAttribute("session_usuario", usuario);

                if (s.login(usuario, contrasenia)) {
                    if (s.tipoUsuario(usuario).equalsIgnoreCase("admin")) {
                        valor = "pages/sesion_iniciada/admin/inicio.jsp";
                    } else if (s.tipoUsuario(usuario).equalsIgnoreCase("cliente")) {
                        valor = "pages/sesion_iniciada/inicio.jsp";
                    }

                }

                break;
                
            case "cerrarsesion":
                session.invalidate();
                valor = "index.jsp";
                    break;
                    
            case "comprar":
                String producto = request.getParameter("productoID_compra");
                String ciudad = s.ciudadUsuario((String) session.getAttribute("session_usuario"));
                //s.comprar(producto);
                break;

            default:
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher(valor);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
