package bean;

import java.io.Serializable;
import java.time.LocalDateTime;

public class CommentaireBean implements Serializable {

    private long id;
    private String texte;
    private LocalDateTime date;
    private LoginBean loginBean;
    private long id_Status;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public LoginBean getLoginBean() {
        return loginBean;
    }

    public void setLoginBean(LoginBean loginBean) {
        this.loginBean = loginBean;
    }

    public long getId_Status() {
        return id_Status;
    }

    public void setId_Status(long id_Status) {
        this.id_Status = id_Status;
    }
}
