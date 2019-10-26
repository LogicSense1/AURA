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
	
	
	@RequestMapping(value="/add")
	public String addComment(Model uiModel) {
		
		return "add";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String editComment(@PathVariable("id") int id, Model uiModel) {
		Comment comment = this.commentAdminManager.getCommentById(id);
		uiModel.addAttribute("comment",comment);
		return null;
	}
	
	@RequestMapping(value="/edit/**", method=RequestMethod.POST)
	public String editComment(@Valid Comment comment) {
		
		this.commentAdminManager.updateComment(comment);
		System.out.println(comment.getId());
		
		return "redirect:/admin/commenttable";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deleteComment(@PathVariable("id") int id) {
		
		this.commentAdminManager.deleteComment(id);
		
		return "redirect:/admin/commenttable";
	}
}