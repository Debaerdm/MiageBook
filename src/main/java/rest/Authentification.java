package rest;

import bean.LoginBean;
import dao.LoginDao;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

//@Path("/authentication")
public class Authentification {
    /*@POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/authenticate")
    public Response authenticateUser(LoginBean loginBean) {

        try {

            // Authenticate the user using the credentials provided
            authenticate(loginBean);

            // Issue a token for the user
            String token = issueToken(loginBean.getLogin());

            // Return the token on the response
            return Response.ok(token).build();

        } catch (Exception e) {
            return Response.status(Response.Status.FORBIDDEN).build();
        }
    }

    private void authenticate(LoginBean loginBean) throws Exception {
        LoginBean bean;

        if ((bean = LoginDao.validate(loginBean.getLogin(), loginBean.getPassword())) != null) {
            if (!LoginDao.connecter(bean.getLogin())) {
                throw new Exception();
            }
        } else {
            throw new Exception();
        }
    }*/

    //private String issueToken(String login) {

        /*SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);

        //We will sign our JWT with our ApiKey secret
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(apiKey.getSecret());
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());

        //Let's set the JWT Claims
        JwtBuilder builder = Jwts.builder().setId(id)
                .setIssuedAt(now)
                .setSubject(subject)
                .setIssuer(issuer)
                .signWith(signatureAlgorithm, signingKey);

        //if it has been specified, let's add the expiration
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }

        //Builds the JWT and serializes it to a compact, URL-safe string
        return builder.compact();*/

      //  return null;
    //}

}
