package au.usyd.elec5619.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.Comment;

@Repository(value = "CommentAdminManagerDAO")
public class CommentAdminManagerDAO {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Comment getCommentById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Comment comment = (Comment) currentSession.get(Comment.class, id);
		return comment;
	}
	
	public void updateComment(Comment comment) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(comment);
	}
	
	public void deleteComment(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Comment comment = (Comment) currentSession.get(Comment.class, id);
		currentSession.delete(comment);
	}
	
	public List<Comment> getComments() {
		return this.sessionFactory.getCurrentSession().createQuery("FROM Comment").list();
	}
}