package kr.co.web.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.CodingBoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.domain.PageMaker;
import kr.co.web.domain.CodingReplyVO;
import kr.co.web.service.CodingBoardService;
import kr.co.web.service.CodingReplyService;

@Controller
@RequestMapping("/coding/*")
public class CodingBoardController {

	private static final Logger logger = LoggerFactory.getLogger(CodingBoardController.class);
	// 로그를 찍기 위한 객체 Logger 사용
	
	@Inject
	private CodingBoardService service;
	
	@Inject
	private CodingReplyService replyService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpSession session, Model model) throws Exception {
		logger.info("register GET !!");
		
		Object loginInfo = session.getAttribute("user");
		
		if(loginInfo == null) {
			model.addAttribute("result", "loginFalse");
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(CodingBoardVO board, RedirectAttributes ra) throws Exception {
		logger.info("register POST !!");
		
		service.create(board);
		logger.info("글작성할 때 제목 : " + board.getTitle());
		
		ra.addFlashAttribute("register", "registerOK");
		
		return "redirect:/coding/listPage";
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("listAll!!");
		List<CodingBoardVO> boards = service.listAll();
		model.addAttribute("list", boards);
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, HttpSession session, Model model) throws Exception {
		logger.info("listPage!!!");
		List<CodingBoardVO> boards = service.listPage(cri);
		model.addAttribute("list", boards);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.totalCount(cri);
		pageMaker.setTotalDataCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		Object loginInfo = session.getAttribute("user");
		if(loginInfo == null) {
			model.addAttribute("result", "loginFalse");
		}
	}
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		 // 페이지 목록 유지를 위해 사용되고 있는 page, perPageNum 값 가져오기
		 logger.info("read GET!!!");
		 CodingBoardVO board  = service.read(board_number);
		 model.addAttribute("BoardVO",board);
		 logger.info(board.toString());
		 System.out.println("vo 값 확인 :" + cri.getPage());
	}
	
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String readReply(CodingBoardVO board, @RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("read");
		
		service.viewCount(board_number);
		service.updateReplyCount(board_number);
		model.addAttribute("BoardVO", service.read(board.getBoard_number()));
		model.addAttribute("cri", cri);
		
		List<CodingReplyVO> replyList = replyService.readReply(board.getBoard_number());
		model.addAttribute("replyList", replyList);
		
		return "coding/readView";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void updateGET(@RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("updateGET!!!");
		CodingBoardVO board  = service.read(board_number);
		 model.addAttribute("BoardVO",board);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(CodingBoardVO board, Criteria cri, RedirectAttributes ra) throws Exception {
		logger.info("updateGET!!!");
		service.update(board);
		ra.addFlashAttribute("result", "updateOK");
		ra.addAttribute("page", cri.getPage());
		ra.addAttribute("perPageNum", cri.getPerPageNum());
		ra.addAttribute("board_number", board.getBoard_number());
		ra.addAttribute("searchType", cri.getSearchType());
		logger.info("검색타입 : " + cri.getSearchType());
		ra.addAttribute("keyword", cri.getKeyword());
		return "redirect:/coding/readView";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteGET(@RequestParam("board_number") Integer board_number, Criteria cri, Model model) throws Exception {
		logger.info("deleteGET");
		CodingBoardVO board = service.read(board_number);
		model.addAttribute("BoardVO", board);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(@RequestParam("board_number") Integer board_number, Criteria cri, RedirectAttributes ra) throws Exception {
		logger.info("deletePOST");
		service.delete(board_number);
		ra.addFlashAttribute("result", "deleteOK");
		ra.addAttribute("page", cri.getPage());
		ra.addAttribute("perPageNum", cri.getPerPageNum());
		ra.addAttribute("searchType", cri.getSearchType());
		ra.addAttribute("keyword", cri.getKeyword());
		logger.info("검색타입 : " + cri.getSearchType());
		logger.info("페이지 : " + cri.getPage());
		return "redirect:/coding/listPage";
	}
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(CodingReplyVO vo, Criteria cri, RedirectAttributes ra) throws Exception {
		logger.info("reply write");
		
		replyService.register(vo);
		
		ra.addAttribute("board_number", vo.getBoard_number());
		ra.addAttribute("page", cri.getPage());
		ra.addAttribute("perPageNum", cri.getPerPageNum());
		ra.addAttribute("searchType", cri.getSearchType());
		ra.addAttribute("keyword", cri.getKeyword());
		
		System.out.println("댓글번호 : " + vo.getReply_number());
		return "redirect:/coding/readView";
	}
	
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(CodingReplyVO vo, Criteria cri, Model model) throws Exception {
		logger.info("reply write");
		
		CodingReplyVO reply = replyService.selectReply(vo.getReply_number());
		logger.info("댓글번호 : " + reply.getReply_number());
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getReply_number()));
		model.addAttribute("cri", cri);

		return "coding/replyUpdateView";
	}
	
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(CodingReplyVO vo, Criteria cri, RedirectAttributes ra) throws Exception {
		logger.info("reply Write");
		
		replyService.modify(vo);
		
		ra.addAttribute("board_number", vo.getBoard_number());
		ra.addAttribute("page", cri.getPage());
		ra.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/coding/readView";
	}
	
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(CodingReplyVO vo, Criteria cri, Model model) throws Exception {
		logger.info("reply Delete");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getReply_number()));
		System.out.println("댓글 번호 : " + replyService.selectReply(vo.getReply_number()) );
		model.addAttribute("cri", cri);
		
		return "coding/replyDeleteView";
	}
	
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(CodingReplyVO vo, Criteria cri, RedirectAttributes ra) throws Exception {
		logger.info("reply delete");
		
		replyService.remove(vo);
		
		ra.addAttribute("board_number", vo.getBoard_number());
		ra.addAttribute("page", cri.getPage());
		ra.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/coding/readView";
	}
}
