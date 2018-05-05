import rest.LoginService;
import rest.StatusService;
import rest.UsersService;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/rest")
public class ApplicationConfig extends Application {
    /*public Set<Class<?>> getClasses() {
        return new HashSet<>(Arrays.asList(LoginService.class, StatusService.class, UsersService.class));
    }*/
}
