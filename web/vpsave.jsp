<%-- 
    Document   : vpsave
    Created on : 24 Feb, 2018, 8:42:24 PM
    Author     : SHRUTI SAGAR MOHANTA
--%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visitorpass Save</title>
    </head>
    <body>
        <%
            File file ;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "F:\\data";
            String vp_name = null;
            String vp_desg = null;
            String vp_from = null;
            String vp_vtar = null;
            String vp_mbmk = null;
            String vp_mbno = null;
            String vp_mail = null;
            String vp_vhcl = null;
            String vp_ltmd = null;
            String vp_ltsn = null;
            String vp_vdfm = null;
            String vp_vdto = null;
            String vp_phto = null;

            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

               DiskFileItemFactory factory = new DiskFileItemFactory();
               factory.setSizeThreshold(maxMemSize);
               factory.setRepository(new File("F:\\temp"));
               ServletFileUpload upload = new ServletFileUpload(factory);
               upload.setSizeMax( maxFileSize );
               try{ 
                  List fileItems = upload.parseRequest(request);
                  Iterator i = fileItems.iterator();
                  out.println("<html>");
                  out.println("<body>");
                  while ( i.hasNext () ) 
                  {
                     FileItem fi = (FileItem)i.next();
                     
                     try {
                         if(fi.getFieldName().equals("vp_name")){
                             vp_name = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_desg")){
                             vp_desg = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_from")){
                             vp_from = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_vtar")){
                             vp_vtar = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_mbmk")){
                             vp_mbmk = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_mbno")){
                             vp_mbno = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_mail")){
                             vp_mail = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_vhcl")){
                             vp_vhcl = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_ltmd")){
                             vp_ltmd = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_ltsn")){
                             vp_ltsn = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_vdfm")){
                             vp_vdfm = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_vdto")){
                             vp_vdto = fi.getString();
                         }
                         if(fi.getFieldName().equals("vp_phto")){
                             vp_phto = fi.getString();
                         }
                         
                     } catch (Exception e) {
                         System.out.println(e);
                     }

                     if ( !fi.isFormField () )  {
                         String fieldName = fi.getFieldName();
                         String fileName = fi.getName();
                         boolean isInMemory = fi.isInMemory();
                         long sizeInBytes = fi.getSize();
                         file = new File( filePath + "yourFileName") ;
                         fi.write( file ) ;
                         out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                     }
                  }
                  %>
                        <sql:update var="rs1" dataSource="jdbc/test">
                            INSERT INTO visitorpass (VP_DATE,VP_NAME,VP_DESG,VP_FROM,VP_VTAR,VP_MBMK,VP_MBNO,VP_MAIL,VP_VHCL,VP_LTMD,VP_LTSN,VP_VDFM,VP_VDTO,VP_PHTO)
                            VALUES (CURDATE(),?,?,?,?,?,?,?,?,?,?,STR_TO_DATE(?,'%d-%m-%Y'),STR_TO_DATE(?,'%d-%m-%Y'),?)
                            <sql:param value="<%=vp_name%>" />
                            <sql:param value="<%=vp_desg%>" />
                            <sql:param value="<%=vp_from%>" />
                            <sql:param value="<%=vp_vtar%>" />
                            <sql:param value="<%=vp_mbmk%>" />
                            <sql:param value="<%=vp_mbno%>" />
                            <sql:param value="<%=vp_mail%>" />
                            <sql:param value="<%=vp_vhcl%>" />
                            <sql:param value="<%=vp_ltmd%>" />
                            <sql:param value="<%=vp_ltsn%>" />
                            <sql:param value="<%=vp_vdfm%>" />
                            <sql:param value="<%=vp_vdto%>" />
                            <sql:param value="<%=vp_phto%>" />
                        </sql:update>
                  <%
                  out.println("</body>");
                  out.println("</html>");
               }catch(Exception ex) {
                  out.println(ex);
               }
            }else{
               out.println("<html>");
               out.println("<body>");
               out.println("<p>No file uploaded</p>"); 
               out.println("</body>");
               out.println("</html>");
            }
         %>
        
<%=vp_name%>
<%=vp_desg%>
<%=vp_from%>
<%=vp_vtar%>
<%=vp_mbmk%>
<%=vp_mbno%>
<%=vp_mail%>
<%=vp_vhcl%>
<%=vp_ltmd%>
<%=vp_ltsn%>
<%=vp_vdfm%>
<%=vp_vdto%>
<%=vp_phto%>

    </body>
</html>
