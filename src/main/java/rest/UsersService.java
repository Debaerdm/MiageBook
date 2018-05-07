package rest;

import bean.LoginBean;
import dao.LoginDao;

import javax.ws.rs.*;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/users")
public class UsersService {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/allusers")
    public Response getAllUsers() {
        List<LoginBean> loginBeanList = LoginDao.getAllUsers();
        GenericEntity<List<LoginBean>> entity = new GenericEntity<List<LoginBean>>(loginBeanList){};
        return Response.ok(entity).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/allusers/{login}")
    public Response getAllFriends(@PathParam("login") String login){
        List<LoginBean> loginBeansListFriends = LoginDao.getAllFriends(login);
        GenericEntity<List<LoginBean>> entity = new GenericEntity<List<LoginBean>>(loginBeansListFriends){};

        return Response.ok(entity).build();
    }
}
