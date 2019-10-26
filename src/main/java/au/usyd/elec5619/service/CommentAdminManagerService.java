package au.usyd.elec5619.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.dao.CommentAdminManagerDAO;
import au.usyd.elec5619.domain.Comment;
import au.usyd.elec5619.domain.User;

@Service(value="commentAdminManager")
@Transactional
public class CommentAdminManagerService implements CommentAdminManager{
	///
	private List<Comment> comments;
	///
	@Autowired
	private CommentAdminManagerDAO commentAdminManagerDAO;
	
	public Comment getCommentById(int id) {
		return this.commentAdminManagerDAO.getCommentById(id);
	}

	@Override
	public void updateComment(Comment comment) {
		this.commentAdminManagerDAO.updateComment(comment);
		
	}
	
	@Override
	public void deleteComment(int id) {
		this.commentAdminManagerDAO.deleteComment(id);
		
	}
	
	@Override
	public List<Comment> getComments() {
		return this.commentAdminManagerDAO.getComments();
	}
	
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

}