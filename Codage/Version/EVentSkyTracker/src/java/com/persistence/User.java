/*
 * Projet  : eventSkyTracker
 * Fichier : User.java
 * Description : Classe interface de la table user
 * Cette table stocke les infos sur les utilisateurs connus du logiciel
 */

package com.persistence;

import java.sql.*;
import java.util.*;

public class User {
    private String    pseudo;           // la clef primaire
    private String    username;
    private String    email;            // son mail (unique)
    private String    password;         
    private String    mailconfirme;
    private int       lastCan;          // le dernier candidat qualifié
    private String    lastImg;          // ajout V2
    private String    lastImgGalaxie;   // ajout V2
    private String    lastImgDate;      // ajout V2
    private int       lastImgPos;       // ajout V2
    private int       grade;            // son grade de 1 à 5
    private boolean   blocked;          // si on l'a interdit d'accès
    private Timestamp registerDate;     // la date de son inscription
    private Timestamp lastVisitDate;    // la date de sa dernière visite
    private int       nbQualifications; // le nb de qualifications faites
    private int       nbCandidates;     // le nb de dmd de candidates
    private int       nbDecouvertes;     // le nb de dmd de decouvertes
    private int       nbConnexions;     // le nb de connexion depuis son inscription
    
    /**
     * Créer un nouvel objet persistant 
     * @param con
     * @param pseudo
     * @param username
     * @param email
     * @param password
     * @param mailconfirme
     * @return 
     * @ return  un user si le pseudo est unique sinon null
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     *                      ou le pseudo est deja dans la BD
     * 
     */
    static public User create(Connection con, String pseudo, String username, String email, 
                                          String password, String mailconfirme)  throws Exception {
        User user = new User(pseudo, username, email, password, mailconfirme);
        
        String queryString =
         "insert into user (`pseudo`, `username`, `email`, `password`,`mailconfirme` ,`lastImg`, `lastImgGalaxie`,`lastImgDate`,`lastImgPos`,`lastCan`, `grade`,"
          + " `blocked`, `registerDate`, `lastVisitDate`, `nbCandidates`, `nbDecouvertes`, `nbQualifications`, `nbConnexions`) values ("
                + Utils.toString(pseudo) + ", " 
                + Utils.toString(username) + ", " 
                + Utils.toString(email) + ", " 
                + Utils.toString(password) + ", " 
                + Utils.toString(mailconfirme) + ", "
                + Utils.toString(user.lastImg) + ", "
                + Utils.toString(user.lastImgGalaxie) + ", "
                + Utils.toString(user.lastImgDate) + ", "
                + Utils.toString(user.lastImgPos) + ", "
                + Utils.toString(user.lastCan) + ", "
                + Utils.toString(user.getGrade()) + ", " 
                + Utils.toString(user.isBlocked()) + ", " 
                + Utils.toString(user.getRegisterDate()) + ", " 
                + Utils.toString(user.getLastVisitDate()) + ", "
                + Utils.toString(user.getNbCandidates()) + ", " 
                + Utils.toString(user.getNbDecouvertes()) + ","
                + Utils.toString(user.getNbQualifications()) + ", " 
                + Utils.toString(user.getNbConnexions())
          + ")";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return user;
    }
    
    /**
     * update de l'objet user dans la ConnexionMySQL
     * @param con
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     */
    public void save(Connection con) throws Exception {
        String queryString =
         "update user set "
                + " `username` =" + Utils.toString(username) + "," 
                + " `email` =" + Utils.toString(email) + "," 
                + " `password` =" + Utils.toString(password) + "," 
                + " `mailconfirme` =" + Utils.toString(mailconfirme) + "," 
                + " `grade` =" + Utils.toString(grade) + "," 
                + " `blocked` =" + Utils.toString(blocked) + ","
                + " `lastCan` =" + Utils.toString(lastCan) + ","
                + " `lastImg` =" + Utils.toString(lastImg) + ","
                + " `lastImgGalaxie` =" + Utils.toString(lastImgGalaxie) + ","
                + " `lastImgDate` =" + Utils.toString(lastImgDate) + ","
                + " `lastImgPos` =" + Utils.toString(lastImgPos) + ","
                + " `registerDate` =" + Utils.toString(registerDate) + "," 
                + " `lastVisitDate` =" + Utils.toString(lastVisitDate)  + "," 
                + " `nbQualifications` =" + Utils.toString(nbQualifications)  + ","
                + " `nbCandidates` =" + Utils.toString(nbCandidates)  + "," 
                + " `nbDecouvertes` =" + Utils.toString(nbDecouvertes)  + "," 
                + " `nbConnexions` =" + Utils.toString(nbConnexions)
                + " where pseudo='" + pseudo + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
    }

    /**
     * suppression de l'objet user dans la BD
     * @param con
     * @return 
     * @throws SQLException    impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from user where pseudo='" + pseudo + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }
    
    /**
     * Retourne un user trouve par son pseudo, saved is true
     * @param con
     * @param  pseudo le pseudo à trouver
     * @return the user trouve par pseudo
     * @throws java.lang.Exception
     */
    public static User getByPseudo(Connection con, String pseudo) throws Exception {
        String queryString = "select * from user where pseudo='" + pseudo + "'";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            return creerParRequete(lResult);
        }
        else
            return null;
    }
    
    /**
     * Retourne le pseudo trouvé par le mail
     * @param con
     * @param  eMail le eMail à trouver
     * @return le pseudo trouvé par le mail
     * @throws java.lang.Exception
     */
    public static String getPseudoByMail(Connection con, String eMail) throws Exception {
        String queryString = "select * from user where email='" + eMail + "'";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            String    lPseudo  = lResult.getString("pseudo");
            return lPseudo;
        }
        else
            return null;
    }
    
    /**
     * retourne l'élément i trié par le nom, saved is true
     * @param con
     * @param  i       le nom de la personne courante
     * @return String la liste des nom des personnes inscrites
     * @throws java.lang.Exception
     */
    public static User find(Connection con, int i) throws Exception {
        String queryString = "select pseudo from user order by pseudo";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            String pseudoFound = lResult.getString("pseudo");
            return User.getByPseudo(con, pseudoFound);
        }
        else 
            return null;
    }
    
        /**
     * retourne le premier pseudo qui commence par i, saved is true
     * @param con
     * @param  i       ce que contient la recherche
     * @return String la liste des nom des personnes inscrites
     * @throws java.lang.Exception
     */
    public static User findByPseudo(Connection con, int i, String j) throws Exception {
        String queryString = "select pseudo from user where pseudo LIKE '%"+j+"%'order by pseudo";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            String pseudoFound = lResult.getString("pseudo");
            return User.getByPseudo(con, pseudoFound);
        }
        else 
            return null;
    }
    
    private static User creerParRequete(ResultSet result) throws Exception {
            String    lPseudo  = result.getString("pseudo");
            String    lUsername = result.getString("username");
            String    lEmail = result.getString("email");
            String    lPassword = result.getString("password");
            String    lMailConfirme = result.getString("mailconfirme");
            String    llastImg = result.getString("lastImg");
            String    llastImgGalaxie = result.getString("lastImgGalaxie");
            String    llastImgDate = result.getString("lastImgDate");
            int       llastImgPos = result.getInt("lastImgPos");
            int       llastCan = result.getInt("lastCan");
            int       lGrade = result.getInt("grade");
            boolean   lBlocked = result.getBoolean("blocked");
            Timestamp lRegisterDate = result.getTimestamp("registerDate");
            Timestamp lLastVisitDate = result.getTimestamp("lastVisitDate");
            int       lNbCandidates = result.getInt("nbCandidates");
            int       lNbDecouvertes = result.getInt("nbDecouvertes");
            int       lNbQualifications = result.getInt("nbQualifications");         
            int       lNbConnexions = result.getInt("nbConnexions");
            return new User(lPseudo, lUsername, lEmail, lPassword, lMailConfirme,
                    llastImg, llastImgGalaxie, llastImgDate, llastImgPos,
                    llastCan, lGrade, lBlocked, lRegisterDate,
                    lLastVisitDate, lNbCandidates, lNbDecouvertes, lNbQualifications, lNbConnexions);
    }
    
    /**
     * Indique si le nom d'une personne existe déjà ou non ?
     * Pour unicité du nom
     * @param con
     * @param  pseudo le nom à trouver
     * @return true si le nom existe déjà
     * @throws java.lang.Exception
     */
    public static boolean isPseudoUsed(Connection con, String pseudo) throws Exception {
        String queryString = "select pseudo from user where pseudo='" + pseudo + "'";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
    
    /**
     * Indique si le email d'une personne existe déjà ou non ?
     * Pour unicité du email
     * @param con
     * @param  email le mail à trouver
     * @return true si le email existe déjà
     * @throws java.lang.Exception
     */
    public static boolean isMailUsed(Connection con, String email) throws Exception {
        String queryString = "select `email` from user where `email`='" + email + "'";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
    
    /**
     * Indique le nb de users dans la base de données
     * @param con
     * @return lenombre de users
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from user";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
    
    /**
     * Indique le nb de users dans la base de données
     * @param con
     * @param recherche
     * @return lenombre de users
     * @throws java.lang.Exception
     */
    public static int sizeRecherche(Connection con, String recherche) throws Exception {
        int size = User.size(con);
        int sizeRecherche=0;
        for(int i=1;i<size;i++){
            if(User.findByPseudo(con, i, recherche)!=null){
                sizeRecherche = sizeRecherche + 1;
            }
        }
        return sizeRecherche;
    }
    
    /**
     * Cree et initialise completement User
     */
    private User(String pseudo, String username, String email, String password, 
            String mailconfirme, String lastImg, String lastImgGalaxie, String lastImgDate, 
            int lastImgPos, int lastCan, int grade, boolean blocked, 
            Timestamp registerDate, Timestamp lastVisitDate, int nbCandidates,
            int nbDecouvertes, int nbQualifications, int nbConnexions) {
        this.pseudo = pseudo;
        this.username = username;
        this.email = email;
        this.password = password;
        this.mailconfirme = mailconfirme;
        this.lastImg = lastImg;
        this.lastImgGalaxie = lastImgGalaxie;
        this.lastImgDate = lastImgDate;
        this.lastImgPos = lastImgPos;
        this.lastCan = lastCan;
        this.grade = grade;
        this.blocked = blocked;
        this.registerDate = (Timestamp)registerDate.clone();
        this.lastVisitDate = (Timestamp)lastVisitDate.clone();
        this.nbCandidates = nbCandidates;
        this.nbDecouvertes = nbDecouvertes;
        this.nbQualifications = nbQualifications;       
        this.nbConnexions = nbConnexions;
    }
    
    /**
     * Cree un nouvel objet user
     */
    private User(String pseudo, String username, String email, String password, 
            String mailconfirme) {
        Timestamp currentTimestamp = 
            new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        this.pseudo = pseudo;
        this.username = username;  
        this.email = email;
        this.password = password;
        this.mailconfirme = mailconfirme;
        this.grade = 1;
        this.blocked = false;
        this.lastImg = "";
        this.lastImgGalaxie = "";
        this.lastImgDate = "";
        this.lastImgPos = 1;
        this.registerDate = currentTimestamp;
        this.lastVisitDate = (Timestamp)currentTimestamp.clone();
        this.lastCan = -1;
        this.nbQualifications = 0;
        this.nbCandidates = 0;
        this.nbDecouvertes = 0;
        this.nbConnexions = 1;           
    }
    
    // --------------------- les assesseurs ----------------------------
    public String getPseudo() {
        return pseudo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) throws Exception {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) throws Exception {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws Exception {
        this.password = password;
    }
    
    public String getMailConfirme() {
        return mailconfirme;
    }

    public void setMailConfirme(String mailconfirme) throws Exception {
        this.mailconfirme = mailconfirme;
    }
    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) throws Exception {
        this.grade = grade;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) throws Exception {
        this.blocked = blocked;
    }
   
    public int getlastCan() {
        return lastCan;
    }
    
    public String getlastImgGalaxie() {
        return lastImgGalaxie;
    }

    public void setLastImgGalaxie(String lastImgGalaxie) throws Exception {
        this.lastImgGalaxie = lastImgGalaxie;
    }
   
    public String getlastImgDate() {
        return lastImgDate;
    }

    public void setLastImgDate(String lastImgDate) throws Exception {
        this.lastImgDate = lastImgDate;
    }
   
    public String getlastImg() {
        return lastImg;
    }

    public void setLastImg(String lastImg) throws Exception {
        this.lastImg = lastImg;
    }
    
    public int getlastImgPos() {
        return lastImgPos;
    }

    public void setLastImgPos(int lastImgPos) throws Exception {
        this.lastImgPos = lastImgPos;
    }

    public Timestamp getRegisterDate() {
        return (Timestamp)registerDate.clone();
    }

    public void setRegisterDate(Timestamp registerDate) throws Exception {
        this.registerDate = registerDate;
    }

    public int getNbQualifications() {
        return nbQualifications;
    }

    public void setNbQualifications(int nbQualifications) throws Exception {
        this.nbQualifications = nbQualifications;
    }
    
    public int getNbCandidates() {
        return nbCandidates;
    }

    public void setNbCandidates(int nbCandidates) throws Exception {
        this.nbCandidates = nbCandidates;
    }
    
    public int getNbDecouvertes() throws SQLException {
        return nbDecouvertes;
    }

    public void setNbDecouvertes(int nbDecouvertes) throws Exception {
        this.nbDecouvertes = nbDecouvertes;
    }
    
    public int getNbConnexions() {
        return nbConnexions;
    }

    public void setNbConnexions(int nbConnexions) {
        this.nbConnexions = nbConnexions;
    }

    public Timestamp getLastVisitDate() {
        return (Timestamp)lastVisitDate.clone();
    }

    public void setLastVisitDate(Timestamp lastVisitDate) throws Exception {
        this.lastVisitDate = lastVisitDate;
    }
    
    public CandidateSN addCandidate(Connection con, String nomImage, String chemin, 
            int certitude, int x, int y, int ra, int dec) throws Exception {
        CandidateSN lCandidate = CandidateSN.create(con, pseudo, nomImage, chemin, 
                                                     certitude, x, y, ra, dec);
        return lCandidate;
    }
    
    /**
     * toString() operator overload
     * @return   the result string
     */
    @Override
    public String toString() {
        return  " pseudo =  " + pseudo + "\t" +
                " username = " + Utils.toString(username) +
                " email = " + Utils.toString(email) +
                " password = " + Utils.toString(password) + 
                " mailconfirme = " + Utils.toString(mailconfirme) + 
                " lastCan = " + Utils.toString(lastCan) +
                " grade = " + Utils.toString(grade) + 
                " blocked = " + Utils.toString(blocked) + 
                " registerDate = " + Utils.toString(registerDate) +
                " lastVisitDate = " + Utils.toString(lastVisitDate) +
                " nbQualifications = " + Utils.toString(nbQualifications) + 
                " nbConnexions = " + Utils.toString(nbConnexions)
                + " ";
    }
}