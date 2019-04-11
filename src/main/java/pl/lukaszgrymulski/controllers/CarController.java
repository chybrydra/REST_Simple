package pl.lukaszgrymulski.controllers;

import pl.lukaszgrymulski.models.Car;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("/")
public class CarController {

//    @GET
//    @Produces(MediaType.TEXT_HTML)
//    public String homePage(){
//        return "";
//    }

    @GET
    @Path("/cars")
    @Produces({MediaType.APPLICATION_JSON})
    public List<Car> findAll(){
        List<Car> carsList = new ArrayList<>();
        carsList.add(new Car(1, "Opel", "Astra", "1993"));
        carsList.add(new Car(2, "Chonda", "Siwik", "2000"));
        carsList.add(new Car(3, "Drezyna", "Ręczna", "1800"));
        return carsList;
    }

}
