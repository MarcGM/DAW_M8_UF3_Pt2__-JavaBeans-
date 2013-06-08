<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Refresh" content="2;url=index.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DAW_M8_UF3_PT2__Formulari de registre__response.jsp</title>
    </head>
    <body>
        <%
           if(application.getAttribute("llistaRegistres") == null){
                ArrayList<org.me.hello.NameHandler> arrayObjectes = new ArrayList<org.me.hello.NameHandler>();
                application.setAttribute("llistaRegistres", arrayObjectes);
            }
        %>
        
        <jsp:useBean id="mybean" scope="request" class="org.me.hello.NameHandler" />
        <jsp:setProperty name="mybean" property="*"  />
        <%
           ((ArrayList<org.me.hello.NameHandler>)application.getAttribute("llistaRegistres")).add(mybean);
//            ArrayList<org.me.hello.NameHandler> arrayObjectes = new ArrayList<org.me.hello.NameHandler>();
//            arrayObjectes = (ArrayList) application.getAttribute("llistaRegistres");
//            
//            //Doble comprovació de si és null.
//            if(arrayObjectes == null){
//                arrayObjectes = new ArrayList<org.me.hello.NameHandler>();
//            }
//            arrayObjectes.add(mybean);
//            application.setAttribute("llistaRegistres",arrayObjectes);
        %>
        <h1>Dades inserides corretant</h1>
        <h2>Et redireccionarà automàticament a la pàgina principal en 2 segons</h2>
    </body>
</html>
