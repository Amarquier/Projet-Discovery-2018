<%-- 
    Document    : Suppression d'une actualité en mode administrateur
    Description : recoit par Ajax l'actu à supprimer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.persistence.Actu"%>
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
    int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Actu</title>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">

<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<link rel="apple-touch-icon" href="images/apple-touch-icon-57x57.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png"/>
<link rel="icon" href="images/apple-touch-icon-57x57.png" />
<link rel="stylesheet" href="js/jquery.mobile/jquery.mobile-1.4.5.min.css">

<%-- theme personnalisé à cette adresse :
http://themeroller.jquerymobile.com
--%>
<link rel="stylesheet" href="css/themes/ESTRed.css" />
<link rel="stylesheet" href="css/themes/jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="css/EST1.css">

<script type="text/javascript" src="js/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.mobile/jquery.mobile-1.4.5.min.js"></script>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
        data-theme="b" data-position="fixed" data-fullscreen="true">
        <h1>Actu</h1>
        <%@include file="../includes/a_user.jspf" %>
    </div>
    <div role="main" class="ui-content">
        <br/><br/>
        <br/><br/><br/><br/>
        <div class="centrer"><h1>Voulez-vous vraiment supprimer cette actualité ?</h1></div>
        <br/><br/>
        
        <div align="center">
            <div class="ui-grid-a">
                <div class="ui-block-a">
                        <form id="formDelActu" method="post" action="eventSkyTracker.jsp?action=a_actuDel_req">
                            <input name="id" id="id" type="hidden" value="<%=id%>"/>
                        </form>    
                        <a href="javascript:{}" onclick="document.getElementById('formDelActu').submit();" id="btnReference" data-position-to="window"
                       data-role="button"  class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                            Supprimer
                        </a>
                </div>
                <div class="ui-block-b">
                    <a href="eventSkyTracker.jsp?action=a_actu" data-ajax="false"
                     class="ui-btn ui-shadow ui-corner-all ui-btn-a"> Non </a>
                </div>
            </div>
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    </div>
    
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>