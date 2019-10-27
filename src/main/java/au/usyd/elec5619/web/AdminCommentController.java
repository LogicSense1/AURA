package au.usyd.elec5619.web;

import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.Comment;
import au.usyd.elec5619.service.CommentAdminManager;

@Controller
@RequestMapping(value="/admincomment/**")
public class AdminCommentController {
	
	@Resource(name="commentAdminManager")
	private CommentAdminManager commentAdminManager;
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deleteComment(@PathVariable("id") long id) {
		
		this.commentAdminManager.deleteComment(id);
		
		return "redirect:/admin/commenttable";
	}
}