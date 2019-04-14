package pl.lukaszgrymulski.services;

import com.google.common.io.CharStreams;
import org.apache.commons.io.IOUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import pl.lukaszgrymulski.models.Car;
import pl.lukaszgrymulski.persistence.HibernateConfig;

import com.google.common.base.Charsets;
import com.google.common.io.Files;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
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

    public String generateAddCarFormAsHtml() {
        String result = "TEST";
        try {
            InputStream stream = Thread.currentThread()
                    .getContextClassLoader()
                    .getResourceAsStream("templates/add-car-form.html");
            Charset charset = StandardCharsets.UTF_8;
            return CharStreams.toString(new InputStreamReader(stream, charset));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

}
