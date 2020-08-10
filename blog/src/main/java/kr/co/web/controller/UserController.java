package kr.co.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.UserVO;
import kr.co.web.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("registerGET");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo, RedirectAttributes ra) throws Exception {
		logger.info("registerPOST");
		
		int result = service.idOverlap(vo);
		
		System.out.println("중복은 1 아니면 0 = " + result );
		if(result == 1) {
			ra.addFlashAttribute("result", "registerFalse");
			return "/user/register";
		} else if(result == 0) {
			String PlaintextPassword = vo.getPassword();
			String encryptionPassword = pwdEncoder.encode(PlaintextPassword);
			vo.setPassword(encryptionPassword);
			service.register(vo);
			ra.addFlashAttribute("result", "registerOK");
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(UserVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		logger.info("post login");
		
		// HttpServletRequest를 사용하면 값을 받아 올수 있다.
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		
		// 이렇게 안하면 db에 없는 아이디를 입력하고 로그인하면 에러코드 발생
		if(login == null ) { 
			ra.addFlashAttribute("result", "loginFalse");
			return "redirect:/";
		}
		
		logger.info("원래 비밀번호 : " + login.getPassword());
		logger.info("로그인할때 입력한 비밀번호 : " + vo.getPassword());
		
		
		boolean passwordMatch = pwdEncoder.matches(vo.getPassword(), login.getPassword());
		logger.info("원래 비밀번호와 로그인할 때 입력한 비밀번호가 같으면 트루 : " + passwordMatch);
		if(login != null && passwordMatch == true) {
			session.setAttribute("user", login);
			ra.addFlashAttribute("result", "loginOK");
		} else {
			session.setAttribute("user", null);
			ra.addFlashAttribute("result", "loginFalse");
			return "redirect:/";
		}
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value ="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes ra ) throws Exception {
		logger.info("logout");
		ra.addFlashAttribute("logout", "logoutOK");
		session.invalidate();
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public void modifyGET() throws Exception {
		logger.info("modifyGET");
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, UserVO vo, RedirectAttributes ra) throws Exception {
		logger.info("modifyPOST");		
		
		String PlaintextPassword = vo.getPassword();
		String encryptionPassword = pwdEncoder.encode(PlaintextPassword);
		vo.setPassword(encryptionPassword);
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
		logger.info("로그인할 때 입력한 비밀번호  = " + oldPass);
		String newPass = vo.getPassword();
		logger.info("회원탈퇴할 때 입력한 비밀번호 = " + newPass);
		
		boolean passwordMatch = pwdEncoder.matches(newPass, oldPass);  // 첫번째 인자는 평문, 두번 째 인자는 암호화로 설정해야 오류가 안난다.
		System.out.println("비밀번호 비교 : " + passwordMatch);
		
		if(passwordMatch == true) {
			service.remove(user);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/";
		} else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/user/remove";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/idOverlap", method = RequestMethod.POST)
	public int idOverlap(UserVO vo) throws Exception {
		int result = service.idOverlap(vo);
		return result;
	}
	
}
