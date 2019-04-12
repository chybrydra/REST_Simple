package pl.lukaszgrymulski.controllers;

import pl.lukaszgrymulski.models.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("/")
public class UserController {

//    @GET
//    @Produces(MediaType.TEXT_HTML)
//    public String homePage(){
//        return "";
//    }

    @GET
    @Path("/users")
    @Produces({MediaType.APPLICATION_JSON})
    public List<User> findAll(){
        List<User> usersList = new ArrayList<>();
        usersList.add(new User(1, "adam@adam.pl", "Adam", "Sadam", "pass1"));
        usersList.add(new User(2, "anna@anna.pl", "Anna", "Wanna", "pass2"));
        usersList.add(new User(3, "kasia@kasia.pl", "Kasia", "Lasia", "pass3"));
        return usersList;
    }

}
