package rest;

import bean.StatusBean;
import dao.StatusDao;

import javax.ws.rs.*;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/status")
public class StatusService {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/allStatus/{login}")
    public Response allStatus(@PathParam("login") String login) {
        List<StatusBean> statusBeans = StatusDao.getAllStatusByUsers(login);
        GenericEntity<List<StatusBean>> entity = new GenericEntity<List<StatusBean>>(statusBeans){};
        return Response.ok(entity).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/allStatusOfFriends/{login}")
    public Response allStatusOfFriends(@PathParam("login") String login) {
        List<StatusBean> statusBeans = StatusDao.getAllStatus(login);
        GenericEntity<List<StatusBean>> entity = new GenericEntity<List<StatusBean>>(statusBeans){};
        return Response.ok(entity).build();
    }
}
