<%-- 
    Document    : traitement du QCM
    Description : retourne par Ajax si le test est réussi ou non
--%>


<%@page import="java.lang.Integer"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    com.metier.ESTSession maSession = (com.metier.ESTSession)session.getAttribute("maSession");
    if (maSession == null) {  
        request.getRequestDispatcher("eventSkyTracker.jsp?action=pbAdminMode").forward(request, response);
    }
    // retourne par Ajax les infos de la galaxie concernée
    String pseudo = request.getParameter("pseudo");
    String mod = request.getParameter("mod");
    if(pseudo.equals(null) || mod.equals(null)){
        request.getRequestDispatcher("eventSkyTracker.jsp?action=a_gestion").forward(request, response);
    }
    User user = User.getByPseudo(con, pseudo);
    if(mod.equals("true")){
        user.setBlocked(true);
        user.save(con);
        request.getRequestDispatcher("../eventSkyTracker.jsp?action=a_msg&msg=L'utilisateur "+pseudo+" est maintenant bloqué.").forward(request, response);
    }
    else if(mod.equals("false")){
        user.setBlocked(false);
        user.save(con);
        request.getRequestDispatcher("../eventSkyTracker.jsp?action=a_msg&msg=L'utilisateur "+pseudo+" est maintenant débloqué.").forward(request, response);
    }
    
%>