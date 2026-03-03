/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class tblupimg extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        int imgid=Integer.parseInt(request.getParameter("tid"));
       // out.println(imgid);
        String fn=request.getParameter("tiname");
         String fp=request.getParameter("tpath");
         int cid=Integer.parseInt(request.getParameter("tcat"));
       double fprc=Double.parseDouble(request.getParameter("price"));
         String fd=request.getParameter("desc");
        Part p1=request.getPart("img");
       
        //out.println(p1);
         
        int result=0;
       //out.println(p1);
        String filename=extractfilename(p1);
        out.println(filename);
       // String filename=extractfilename(p1);
       String savepath="C:\\Users\\SAKSHI\\Documents\\NetBeansProjects\\Coffee_Shop\\web\\tableimages"+java.io.File.separator+filename;
       
       
       //out.println(savepath);
       if(filename.equals(""))
       {
      try
      {
       java.io.File filesavedir=new java.io.File(fp);
       p1.write(savepath+java.io.File.separator);
      }
      catch(Exception e1)
      {
         // out.println(e1);
      }
       }
       else
       {
           try
           {
           java.io.File filesavedir=new java.io.File(savepath);
       p1.write(savepath+java.io.File.separator);
      }
      catch(Exception e2)
      {
          //out.println(e2);
      }
           
       }
     
       
   try
    {
       Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15") ;
                out.println("sueccess");
               PreparedStatement ps=con.prepareStatement("update tables set t_price=? ,tdesc=?, timg=?, timg_path=?, t_cid=? where tid=?");
             // out.println("insert");
              
                if(filename.equals(""))
                {
                    
                   //out.println("p");
             
                ps.setString(3,fn);
                 ps.setString(4,fp);
                
                }
                else
                {
                 //  out.println("r");
                   
                    ps.setString(3,filename);
                 ps.setString(4,savepath);
                  
                }
                   ps.setDouble(1,fprc);
                    ps.setString(2,fd);
                    ps.setInt(6,imgid);
                     ps.setInt(5,cid);
             
                 ps.executeUpdate();
                response.sendRedirect("tablemg.jsp?tcatid="+cid);
    }
   catch(ClassNotFoundException | SQLException e)
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(tblupimg.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(tblupimg.class.getName()).log(Level.SEVERE, null, ex);
        }
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
