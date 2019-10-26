package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;

import au.usyd.elec5619.domain.Comment;

public interface CommentManager extends Serializable {

	public List<Comment> getAllComments();

	public void addComment(Comment comment);

	public void deleteComment(long id) throws Exception;

	public void updateComment(Comment comment);

	public Comment getCommentById(long id);

	public List<Comment> getCommentsByKeyWord(String keyWord);

	public List<Comment> getCommentsByUser(long userId);

	public List<Comment> getCommentsByProduct(long productId);

}