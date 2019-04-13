package pl.lukaszgrymulski.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import pl.lukaszgrymulski.models.Car;
import pl.lukaszgrymulski.persistence.HibernateConfig;

import java.util.List;

public class CarService {

    private final SessionFactory sessionFactory = HibernateConfig.getSessionFactory();

    public List<Car> listAllCars(){
        Session currentSession = sessionFactory.openSession();
        currentSession.beginTransaction();

        Query<Car> query = currentSession.createQuery("from Car", Car.class);
        List<Car> cars = query.getResultList();

        currentSession.getTransaction().commit();
        currentSession.close();
        return cars;
    }
}
