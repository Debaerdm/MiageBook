package dao;

import bean.LoginBean;
import bean.StatusBean;
import dao.Provider.ConnectionProvider;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static dao.Provider.Provider.DATE_FORMAT;

public class StatusDao {

    public static List<StatusBean> getAllStatus() {
        List<StatusBean> statusBeans = new ArrayList<>();

        try {
            Connection connection = ConnectionProvider.getCon();

            PreparedStatement preparedStatement = connection.prepareStatement("select id,titre,texte,image,date_publication, login from status");

            ResultSet resultSet = preparedStatement.executeQuery();

            result(statusBeans, resultSet);

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return statusBeans;
    }

    public static List<StatusBean> getAllStatusByUsers(String login) {
        List<StatusBean> statusBeans = new ArrayList<>();

        try {
            Connection connection = ConnectionProvider.getCon();

            PreparedStatement preparedStatement = connection.prepareStatement("select id,titre,texte,image,date_publication, login from status where login_proprietaire = ?");
            preparedStatement.setString(1, login);

            ResultSet resultSet = preparedStatement.executeQuery();

            result(statusBeans, resultSet);

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return statusBeans;
    }

    private static void result(List<StatusBean> statusBeans, ResultSet resultSet) throws SQLException, IOException {
        while (resultSet.next()) {
            StatusBean statusBean = new StatusBean();

            statusBean.setId(resultSet.getLong(1));
            statusBean.setTitre(resultSet.getString(2));
            statusBean.setTexte(resultSet.getString(3));

            Blob blob = resultSet.getBlob(4);

            if (blob != null) {
                InputStream in = blob.getBinaryStream();
                BufferedImage image = ImageIO.read(in);

                statusBean.setImage(image);
            }

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMAT, Locale.FRANCE);
            statusBean.setDate(LocalDateTime.parse(resultSet.getString(5), formatter));

            String login = resultSet.getString(6);

            LoginBean loginBean;
            if ((loginBean = LoginDao.basicInformation(login)) != null) {
                statusBean.setLoginBean(loginBean);
            } else {
                throw new SQLException("Erreur");
            }

            statusBeans.add(statusBean);
        }
    }

    public static boolean addStatus(StatusBean statusBean) {
        boolean status = false;

        try {
            Connection connection = ConnectionProvider.getCon();

            PreparedStatement preparedStatement = connection.prepareStatement("insert into status(titre, texte, image, date_publication, login_proprietaire) values(?,?,?,?,?)");
            preparedStatement.setString(1, statusBean.getTitre());
            preparedStatement.setString(2, statusBean.getTexte());

            if (statusBean.getImage() != null) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(statusBean.getImage(), "png", baos);
                InputStream is = new ByteArrayInputStream(baos.toByteArray());
                preparedStatement.setBlob(3, is);
            } else {
                preparedStatement.setObject(3, null);
            }

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMAT, Locale.FRANCE);
            String date = formatter.format(statusBean.getDate());

            preparedStatement.setString(4, date);
            preparedStatement.setString(5, statusBean.getLoginBean().getLogin());

            status = (preparedStatement.executeUpdate() > 0);
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return status;
    }

    public static boolean removeStatus(long id) {
        boolean status = false;

        try {
            Connection connection = ConnectionProvider.getCon();

            PreparedStatement preparedStatement = connection.prepareStatement("DELETE from status where id = ?");
            preparedStatement.setLong(1, id);

            status = (preparedStatement.executeUpdate() > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
}
