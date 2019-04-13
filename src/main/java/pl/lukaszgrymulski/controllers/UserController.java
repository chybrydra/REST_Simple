package pl.lukaszgrymulski.controllers;

import pl.lukaszgrymulski.models.User;
import pl.lukaszgrymulski.services.UserService;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/")
public class UserController {

    @GET
    @Path("/users")
    @Produces({MediaType.APPLICATION_JSON})
    public List<User> findAll(){
        UserService service = new UserService();
        List<User> usersList = service.listAllUsers();
        return usersList;
    }

}
