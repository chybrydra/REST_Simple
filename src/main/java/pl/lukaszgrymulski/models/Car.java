package pl.lukaszgrymulski.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Car {

    private int id;
    private String brand;
    private String model;
    private String productionYear;

    public Car() {
    }

    public Car(int id, String brand, String model, String productionYear) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.productionYear = productionYear;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(String productionYear) {
        this.productionYear = productionYear;
    }
}
