/* Copyright 2005 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html  
$Id: AutocompleteServlet.java,v 1.2 2005/04/01 19:20:29 gmurray71 Exp $ */
package com.jpassion.ajax;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class AutocompleteServlet extends HttpServlet{
    
    private HashMap employees = new HashMap();
    private ArrayList<org.me.hello.NameHandler> arrayObjectes = new ArrayList<org.me.hello.NameHandler>();
    
    public void init(ServletConfig config) throws ServletException{
        //employees.put("1", new EmployeeBean("1","Greg","Murray"));
    }

    public void doGet(HttpServletRequest request, HttpServletResponse  response) throws IOException, ServletException{
        arrayObjectes = (ArrayList<org.me.hello.NameHandler>) getServletContext().getAttribute("llistaRegistres");
        possarObjectesHashMap();
        
	    String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();
        if (targetId != null) targetId = targetId.trim().toLowerCase();
        boolean namesAdded = false;
		if ("nomICognom".equals(action)) {

            Iterator it = employees.keySet().iterator();
            while (it.hasNext()) {
                String id = (String)it.next();
                org.me.hello.NameHandler e = (org.me.hello.NameHandler)employees.get(id);
                // simple matching only for start of first or last name
                if (e.getNomICognom().toLowerCase().startsWith(targetId) && !targetId.equals("")){
                    sb.append("<employee>");
                    sb.append("<id>" + e.getNomUsuari()+ "</id>");
                    sb.append("<firstName>" + e.getNomICognom()+ "</firstName>");
                    sb.append("<lastName>" + e.getTelefon()+ "</lastName>");
                    sb.append("</employee>");
                    namesAdded = true;
                }
            }
		    if (namesAdded) {
			    response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
		        response.getWriter().write("<employees>" + sb.toString() + "</employees>");
			} else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
	    } 
        /*if ("telefon".equals(action)){
            Iterator it = employees.keySet().iterator();
            while (it.hasNext()){
                String id = (String)it.next();
                EmployeeBean e = (EmployeeBean)employees.get(id);
                // simple matching only for start of first or last name
                if (e.getLastName().toLowerCase().startsWith(targetId) && !targetId.equals("")){
                    sb.append("<employee>");
                    sb.append("<id>" + e.getId() + "</id>");
                    sb.append("<firstName>" + e.getFirstName() + "</firstName>");
                    sb.append("<lastName>" + e.getLastName() + "</lastName>");
                    sb.append("</employee>");
                    namesAdded = true;
                }
            }
		    if (namesAdded) {
			    response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
		        response.getWriter().write("<employees>" + sb.toString() + "</employees>");
			} else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
		}*/
        //context.getRequestDispatcher("/employees.jsp").forward(request, response);
    }
    
    public void possarObjectesHashMap(){
        int llargadaArrayObjectes = arrayObjectes.size();
        int cont;
        
        for(cont=0; cont<llargadaArrayObjectes; cont++){
            employees.put(cont, arrayObjectes.get(cont));
        }
    }
}