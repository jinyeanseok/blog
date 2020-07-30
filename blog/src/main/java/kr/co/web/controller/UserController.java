package kr.co.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.UserVO;
import kr.co.web.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("registerGET");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo, RedirectAttributes ra) throws Exception {
		logger.info("registerPOST");
		service.register(vo);
		ra.addFlashAttribute("result", "registerOK");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginGET(UserVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		logger.info("post login");
		
		// HttpServletRequest를 사용하면 값을 받아 올수 있다.
		HttpSession session = req.getSession();
		
		UserVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("user", null);
			ra.addFlashAttribute("result", "loginFalse");
		} else {
			session.setAttribute("user", login);
			String id = req.getParameter("identification");
			ra.addFlashAttribute("result", "loginOK");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value ="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("logout");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public void modifyGET() throws Exception {
		logger.info("modifyGET");
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, UserVO vo, RedirectAttributes ra) throws Exception {
		logger.info("modifyPOST");		
		service.modify(vo);
		session.invalidate();
		ra.addFlashAttribute("result", "updateOK");
		return "redirect:/";
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.GET)
	public void removeGET() throws Exception {
		logger.info("removeGET");
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String removePOST(UserVO vo, HttpSession session, RedirectAttributes ra) throws Exception {
		logger.info("removePOST");
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		String oldPass = user.getPassword();
		String newPass = vo.getPassword();
		
		if(oldPass.equals(newPass)) {
			service.remove(vo);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/";
		} else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/user/remove";
		}
	}
	
}
