package rest;

import bean.CommentaireBean;
import bean.StatusBean;
import dao.CommentaireDao;
import dao.StatusDao;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/commentaire")
public class CommentaireService {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/allCommentaireOfStatus/{id}")
    public Response allStatusOfFriends(@PathParam("id") long id_status) {
        List<CommentaireBean> commentaireBeans = CommentaireDao.getAllCommentsOfStatus(id_status);
        GenericEntity<List<CommentaireBean>> entity = new GenericEntity<List<CommentaireBean>>(commentaireBeans){};
        return Response.ok(entity).build();
    }
}
