/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author SAKSHI
 */
@MultipartConfig(maxFileSize=16177216)
public class uploadimg1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int result;
        int subcatid = Integer.parseInt(request.getParameter("subcategory"));
        String pnm= request.getParameter("pname");
        String des= request.getParameter("textar");
         double pprz=Double.parseDouble(request.getParameter("price"));
        Part p1 = request.getPart("img");
         String filename = extractfilename(p1);
         String savepath="C:\\Users\\SAKSHI\\Documents\\NetBeansProjects\\Coffee_Shop\\web\\cofimg"+File.separator+filename;
         File filesavedir=new File(savepath);
         p1.write(savepath+File.separator);
         
        
        try
        {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
              PreparedStatement ps5=con.prepareStatement("select pname from product");
               ResultSet rs=ps5.executeQuery();
                        int f=0;
         while(rs.next())
         {
                     if(rs.getString("pname").equals(pnm))
                     {
                         f=1;
                     }
         }
         if(f==1)
         {
              RequestDispatcher rd=request.getRequestDispatcher("/productins.jsp?f=invalid");  
          rd.include(request, response);  
         }
            else
         {
               
               
               
                PreparedStatement ps=con.prepareStatement("insert into product(pname, pimg, pimg_path, p_price, pdesc,sub_cid) values(?,?,?,?,?,?)");
                ps.setString(1, pnm);
                ps.setString(2, filename);
                ps.setString(3, savepath);
                ps.setDouble(4, pprz);
                 ps.setString(5, des);
                 ps.setInt(6, subcatid);
                result= ps.executeUpdate();
//            out.println("Inserted data Successfully");
            
            if(result>0)
            {
             RequestDispatcher rd=request.getRequestDispatcher("productins.jsp");
             rd.include(request, response);
            }
            else
            {
              response.sendRedirect("admhom.html");
              
            }
         }
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e)
        {
         out.println(e);
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
 String extractfilename(Part part)
    {
     String cd=part.getHeader("content-disposition");
     String[] items=cd.split(";");
     for(String s:items)
     {
       if(s.trim().startsWith("filename"))
       {
       return s.substring(s.indexOf("=")+2,s.length()-1);
       
       }
     }
     return"";
    }
}
