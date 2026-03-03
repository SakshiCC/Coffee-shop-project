/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.sql.*;

/**
 *
 * @author SAKSHI
 */
@MultipartConfig(maxFileSize=16177216)
public class demo2 extends HttpServlet {

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
        PrintWriter out=response.getWriter();
        int imgid=Integer.parseInt(request.getParameter("pid"));
       // out.println(imgid);
        String fn=request.getParameter("piname");
         String fp=request.getParameter("ppath");
         String fpname=request.getParameter("pname");
         Double fprz=Double.parseDouble(request.getParameter("price"));
         String fd=request.getParameter("textar");
         int subcatid = Integer.parseInt(request.getParameter("subcategory"));
        Part p1=request.getPart("img");
        //out.println(p1);
         
        int result=0;
       //out.println(p1);
        String filename=extractfilename(p1);
        out.println(filename);
       // String filename=extractfilename(p1);
       String savepath="C:\\Users\\SAKSHI\\Documents\\NetBeansProjects\\Coffee_Shop\\web\\cofimg"+File.separator+filename;
       
       
       //out.println(savepath);
       if(filename.equals(""))
       {
      try
      {
       File filesavedir=new File(fp);
       p1.write(savepath+File.separator);
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
           File filesavedir=new File(savepath);
       p1.write(savepath+File.separator);
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
               PreparedStatement ps=con.prepareStatement("update product set pname=? ,pimg=?, pimg_path=?, p_price=?, pdesc=?,sub_cid=? where pid=?");
             // out.println("insert");
              
                if(filename.equals(""))
                {
                    
                   //out.println("p");
             
                ps.setString(2,fn);
                 ps.setString(3,fp);
                
                }
                else
                {
                 //  out.println("r");
                   
                    ps.setString(2,filename);
                 ps.setString(3,savepath);
                  
                }
                   ps.setInt(7,imgid);
                    ps.setString(1,fpname);
                     ps.setDouble(4,fprz);
                     ps.setString(5,fd);
                     ps.setInt(6,subcatid);
             
                 ps.executeUpdate();
                response.sendRedirect("productins.jsp");
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
