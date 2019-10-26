package au.usyd.elec5619.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.elec5619.domain.Comment;

@Service(value="simpleCommentManager")
@Transactional
public class SimpleCommentManager implements CommentManager {
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getAllComments() {
		// TODO Unsolved potential type safety issue
		System.out.println("getAll sf:" + this.sessionFactory);
		return this.sessionFactory.getCurrentSession().createQuery("FROM Comment").list();
	}

	@Override
	public void addComment(Comment comment) {
		System.out.println("add sf:" + this.sessionFactory);
		this.sessionFactory.getCurrentSession().save(comment);
	}

	@Override
	public void deleteComment(long id) throws Exception {
		Comment comment = this.getCommentById(id);
		if ( comment.getId() == id ) {
			this.sessionFactory.getCurrentSession().delete(comment);
		} else {
			throw new Exception("Comment not found");
		}
	}
	
	@Override
	public void updateComment(Comment comment) {
		this.sessionFactory.getCurrentSession().update(comment);
	}

	@Override
	public Comment getCommentById(long id) {
		return (Comment) this.sessionFactory.getCurrentSession().get(Comment.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getCommentsByKeyWord(String keyWord) {
		// TODO Unsolved potential type safety issue
		String hql = String.format("FROM Comment where subject like %%s% or content like %%s%", keyWord, keyWord);
		return this.sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getCommentsByUser(long userId) {
		// TODO Unsolved potential type safety issue
		String hql = String.format("FROM Comment where userId = %d", userId);
		return this.sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getCommentsByProduct(long productId) {
		// TODO Unsolved potential type safety issue
		String hql = String.format("FROM Comment where productId = %d", productId);
		return this.sessionFactory.getCurrentSession().createQuery(hql).list();
	}

}