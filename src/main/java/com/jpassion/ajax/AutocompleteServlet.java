/* Copyright 2005 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html  
$Id: AutocompleteServlet.java,v 1.2 2005/04/01 19:20:29 gmurray71 Exp $ */
package com.jpassion.ajax;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class AutocompleteServlet extends HttpServlet{
    
    private ArrayList<org.me.hello.NameHandler> arrayObjectes = new ArrayList<org.me.hello.NameHandler>();
    
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse  response) throws IOException, ServletException{
        arrayObjectes = (ArrayList<org.me.hello.NameHandler>) getServletContext().getAttribute("llistaRegistres");
	    String camp = request.getParameter("action");
        String valor = request.getParameter("id");
        StringBuffer sb = new StringBuffer();
        boolean namesAdded = false;
        int llargadaArrayObjectes = arrayObjectes.size();
        
        for(int cont=0; cont<llargadaArrayObjectes; cont++){
            if(camp.equals("nomICognom")){
                String resultat = arrayObjectes.get(cont).getNomICognom();
                if(resultat.toLowerCase().startsWith(valor) && !valor.equals("")){
                    sb.append("<usuari>");
                    sb.append("<nomICognom>" + arrayObjectes.get(cont).getNomICognom() + "</nomICognom>");
                    sb.append("<telefon>" + arrayObjectes.get(cont).getTelefon() + "</telefon>");
                    sb.append("<correuE>" + arrayObjectes.get(cont).getCorreuE() + "</correuE>");
                    sb.append("</usuari>");
                    namesAdded = true;
                }
            }else{
                String resultat = arrayObjectes.get(cont).getTelefon();
                if(resultat.toLowerCase().startsWith(valor) && !valor.equals("")){
                    sb.append("<usuari>");
                    sb.append("<telefon>" + arrayObjectes.get(cont).getTelefon() + "</telefon>");
                    sb.append("<nomICognom>" + arrayObjectes.get(cont).getNomICognom() + "</nomICognom>");
                    sb.append("<correuE>" + arrayObjectes.get(cont).getCorreuE() + "</correuE>");
                    sb.append("</usuari>");
                    namesAdded = true;
                }
            }
        }
        if(namesAdded){
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write("<usuaris>" + sb.toString() + "</usuaris>");
        }else{
            //nothing to show
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
    }
}