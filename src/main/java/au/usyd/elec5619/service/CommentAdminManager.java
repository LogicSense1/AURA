package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.Comment;

public interface CommentAdminManager extends Serializable{
	
	public List<Comment> getComments();
	
	public Comment getCommentById(int id);
	
	public void updateComment(Comment comment);
	
	public void deleteComment(int id);
	
}