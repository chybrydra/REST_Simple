package pl.lukaszgrymulski.models;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@Table(name="cars")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="model")
    private String model;

    @Column(name="brand")
    private String brand;

    @Column(name="production_year")
    private String productionYear;

    @Column(name="user_id")
    private int userId;

    @Column(name="fuel_type")
    private String fuelType;

    @Column(name="reg_plate")
    private String regPlate;

    public Car() {
    }

    public Car(String brand, String model, String productionYear, int userId, String fuelType, String regPlate) {
        this.brand = brand;
        this.model = model;
        this.productionYear = productionYear;
        this.userId = userId;
        this.fuelType = fuelType;
        this.regPlate = regPlate;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getRegPlate() {
        return regPlate;
    }

    public void setRegPlate(String regPlate) {
        this.regPlate = regPlate;
    }
}
