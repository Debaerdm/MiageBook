package rest;

import dao.LoginDao;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("/login")
public class LoginService {

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response loginExist(String login) {
        System.out.println(login);
        if (login.length() > 3 && login.length() < 17 && LoginDao.exist(login)) {
            return Response.status(Response.Status.OK).entity("Success").build();
        }

        return Response.status(Response.Status.NOT_FOUND).entity("Error").build();
    }

}
