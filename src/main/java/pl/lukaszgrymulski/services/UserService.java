package pl.lukaszgrymulski.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import pl.lukaszgrymulski.models.User;
import pl.lukaszgrymulski.persistence.HibernateConfig;

import java.util.List;

public class UserService {

    private final SessionFactory sessionFactory = HibernateConfig.getSessionFactory();

    public List<User> listAllUsers(){
        Session currentSession = sessionFactory.openSession();
        currentSession.beginTransaction();

        Query<User> query = currentSession.createQuery("from User", User.class);
        List<User> users = query.getResultList();

        currentSession.getTransaction().commit();
        currentSession.close();
        return users;
    }
}
