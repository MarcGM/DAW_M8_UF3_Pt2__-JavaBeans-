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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DAW_M8_UF3_PT2__Formulari de registre</title>
    </head>
    <body>

        <h1>Formulari de registre</h1>
    
        <form action="response.jsp">
            Nom d'usuari: <input type="text" name="nomUsuari" value="" />
            <br /><br />
            Nom i cognom: <input type="text" name="nomICognom" value="" />
            <br /><br />
            Telèfon: <input type="text" name="telefon" value="" />
            <br /><br />
            Correu electrònic: <input type="text" name="correuE" value="" />
            <br /><br /> 
           <input type="submit" value="Donar d'alta" />
        </form>
        
    </body>
</html>
