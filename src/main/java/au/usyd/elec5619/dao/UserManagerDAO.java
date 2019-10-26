package au.usyd.elec5619.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.User;

@Repository(value = "UserManagerDAO")
public class UserManagerDAO {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public User getUserbyEmail (String email) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User where email =:Email").setString("Email", email);
		User user = (User)query.uniqueResult();
		return user;
	}
	
	public User getUserbyId(Long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		User user = (User) currentSession.get(User.class,id);
		return user;
	}
	
	public void addUser(User user) {
		this.sessionFactory.getCurrentSession().save(user);
	}
    
	public void updateUser(User user) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(user);
	}
}