package dao;

import bean.CommentaireBean;
import bean.LoginBean;
import dao.Provider.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static dao.Provider.Provider.DATE_FORMAT;

public class CommentaireDao {

    public static List<CommentaireBean> getAllCommentsOfStatus(long idStatus) {
        List<CommentaireBean> commentaireBeans = new ArrayList<>();

        try {
            Connection connection = ConnectionProvider.getCon();

            PreparedStatement preparedStatement = connection.prepareStatement("select id, texte, date_publication, login_proprietaire from commentaire where id_status = ? ");
            preparedStatement.setLong(1, idStatus);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CommentaireBean commentaireBean = new CommentaireBean();

                commentaireBean.setId(resultSet.getLong(1));
                commentaireBean.setTexte(resultSet.getString(2));

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMAT, Locale.FRANCE);
                commentaireBean.setDate(LocalDateTime.parse(resultSet.getString(3), formatter));

                String login = resultSet.getString(4);

                LoginBean loginBean;
                if ((loginBean = LoginDao.basicInformation(login)) != null) {
                    commentaireBean.setLoginBean(loginBean);
                } else {
                    throw new SQLException("Erreur");
                }

                commentaireBeans.add(commentaireBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return commentaireBeans;
    }
}
