package bean;

import java.io.Serializable;
import java.time.LocalDateTime;

public class LoginBean implements Serializable {

    private String login;
    private String password;
    private String nom;
    private String prenom;
    private String email;
    private int connecter;
    private LocalDateTime date_connection;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getConnecter() {
        return connecter;
    }

    public void setConnecter(int connecter) {
        this.connecter = connecter;
    }

    public LocalDateTime getDate_connection() {
        return date_connection;
    }

    public void setDate_connection(LocalDateTime date_connection) {
        this.date_connection = date_connection;
    }

    @Override
    public String toString() {
        return login;
    }
}
