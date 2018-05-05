package bean;

import java.awt.image.BufferedImage;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class StatusBean implements Serializable {

    private long id;
    private String titre;
    private String texte;
    private BufferedImage image;
    private Date date;
    private LoginBean loginBean;
    private List<CommentaireBean> commentaireBeanList;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public BufferedImage getImage() {
        return image;
    }

    public void setImage(BufferedImage image) {
        this.image = image;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public LoginBean getLoginBean() {
        return loginBean;
    }

    public void setLoginBean(LoginBean loginBean) {
        this.loginBean = loginBean;
    }

    public List<CommentaireBean> getCommentaireBeanList() {
        return commentaireBeanList;
    }

    public void setCommentaireBeanList(List<CommentaireBean> commentaireBeanList) {
        this.commentaireBeanList = commentaireBeanList;
    }
}
