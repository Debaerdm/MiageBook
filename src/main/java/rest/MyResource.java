package rest;

import bean.LoginBean;
import dao.LoginDao;
import servlet.LoginServlet;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("/api")
public class MyResource {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("allusers")
    public Response getAllUsers() {
        List<LoginBean> loginBeanList = LoginDao.getAllUsers();
        GenericEntity<List<LoginBean>> entity = new GenericEntity<List<LoginBean>>(loginBeanList){};
        return Response.ok(entity).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("allfriends")
    public Response getAllFriends(){
        System.out.println("getAllFriends");
        List<LoginBean> loginBeansListFriends = LoginDao.getAllFriends("Debaerdm");
        GenericEntity<List<LoginBean>> entity = new GenericEntity<List<LoginBean>>(loginBeansListFriends){};

        for (LoginBean log : loginBeansListFriends){
            System.out.println(log);
        }

        System.out.println(loginBeansListFriends.size());


        return Response.ok(entity).build();
    }

}
