package rest;

import bean.StatusBean;
import dao.StatusDao;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/status")
public class StatusService {

    @GET
    @Path("/allStatus/${login}")
    public Response allStatus(@QueryParam("login") String login) {
        List<StatusBean> statusBeans = StatusDao.getAllStatusByUsers(login);
        GenericEntity<List<StatusBean>> entity = new GenericEntity<List<StatusBean>>(statusBeans){};
        return Response.ok(entity).build();
    }

    @GET
    @Path("/allStatus")
    public Response allStatus() {
        List<StatusBean> statusBeans = StatusDao.getAllStatus();
        GenericEntity<List<StatusBean>> entity = new GenericEntity<List<StatusBean>>(statusBeans){};
        return Response.ok(entity).build();
    }
}
