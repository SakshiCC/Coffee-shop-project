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
public class TableAdd extends HttpServlet {

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
         double price=Double.parseDouble(request.getParameter("price"));
         String desc=request.getParameter("desc");
         int tcat=Integer.parseInt(request.getParameter("tcat"));
         int tid=Integer.parseInt(request.getParameter("tblid"));
         Part p1=request.getPart("img");
          String filename=extractfilename(p1);
       //  out.println(filename);
   String savepath="C:\\Users\\SAKSHI\\Documents\\NetBeansProjects\\Coffee_Shop\\web\\tableimages"+File.separator+filename;
// out.println(savepath);
    File filesavedir=new File(savepath);
    p1.write(savepath+File.separator);
    int result=0;
    int f1=0;
 try {
            Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
   //out.println("success");
   PreparedStatement ps=con.prepareStatement("select tid from tables");
   ResultSet rt=ps.executeQuery();
   while(rt.next())
   {
           if(tid==rt.getInt(1))
           {    f1=1;
               response.sendRedirect("tablemg.jsp?f=invalid&tcatid="+tcat); 
           }
   }
   if(f1==0)
   {
    ps=con.prepareStatement("insert into tables(t_price,tdesc,timg,timg_path,t_cid,tid) values(?,?,?,?,?,?)");
     ps.setDouble(1, price);
    ps.setString(2, desc);
     ps.setString(3,filename);
   ps.setString(4, savepath);
    ps.setInt(5, tcat);
    ps.setInt(6, tid);
  result= ps.executeUpdate();
   //out.println("inserted data");
 
   con.close();
   if(result>0)
       {
           //response.sendRedirect("view.jsp");
           RequestDispatcher rd=request.getRequestDispatcher("/tablemg.jsp?tcatid="+tid);  
          rd.include(request, response);  
       }
       else
       {
           response.sendRedirect("admhome.jsp");
       }
   }
   
  }
catch(Exception e)
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
 private   String extractfilename(Part part)
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