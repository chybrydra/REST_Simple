package pl.lukaszgrymulski.controllers;

import pl.lukaszgrymulski.models.Car;
import pl.lukaszgrymulski.services.CarService;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/")
public class CarController {

    @GET
    @Path("/cars")
    @Produces({MediaType.APPLICATION_JSON})
    public List<Car> findAll(){
        CarService service = new CarService();
        List<Car> carsList = service.listAllCars();
        return carsList;
    }

    @GET
    @Path("/add-car")
    @Produces({MediaType.TEXT_HTML})
    public String getAddCarFormAsHtml() {
        CarService service = new CarService();
        String addCarForm = service.generateAddCarFormAsHtml();
        return addCarForm;
    }

}
