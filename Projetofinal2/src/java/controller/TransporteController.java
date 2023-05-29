package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Transporte;
import model.TransporteDAO;

@WebServlet(name = "TransporteController", urlPatterns = {"/TransporteController"})
public class TransporteController extends HttpServlet {
    private int cod;
    private String tipo;
    private int assentos;
    private String combustivel;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        if(request.getParameter("cod") != null) {
            this.cod = Integer.parseInt(request.getParameter("cod"));
        }
        
        
        //Recebendo dados do formulário de cadastro
        this.tipo = request.getParameter("tipo");
        this.assentos = Integer.parseInt(request.getParameter("assentos"));
        this.combustivel = request.getParameter("combustivel");
        
        try {
        
            if(request.getParameter("cod") == null) {
                Transporte tr = new Transporte
                                (this.tipo,
                                 this.assentos,
                                 this.combustivel);

                TransporteDAO transpDAO = new TransporteDAO();
                transpDAO.insertTransporte(tr);
                response.sendRedirect("lista.jsp");
            } else {
                Transporte tr = new Transporte
                                (this.cod,
                                 this.tipo,
                                 this.assentos,
                                 this.combustivel);

                TransporteDAO transpDAO = new TransporteDAO();
                transpDAO.updateTransporte(tr);
                response.sendRedirect("home.jsp");
            }
            
        } catch(SQLException | ClassNotFoundException erro) {
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Transportes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Ocorreu algum erro :(</h1>");
            out.println("</body>");
            out.println("</html>");
            }
        }
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
