package kr.co.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.PageMaker;
import kr.co.web.domain.ReplyVO;
import kr.co.web.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO reply){
		logger.debug("ReplyRegister>>{}",reply);
		try {
			service.register(reply);
            		//제대로 등록되었으면 "ReplyRegisterOK" 문자열과 HTTP 상태 정상 
			return new ResponseEntity<>("ReplyRegisterOK", HttpStatus.OK);
		} catch(Exception e) {
        		//제대로 등록 안 되었으면 예외메시지와 HTTP 상태 400
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/{reply_number}", method = {RequestMethod.POST, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_number") Integer reply_number,
					     @RequestBody ReplyVO reply){
		logger.debug("ReplyUpdate>>{}",reply_number, reply);
		try {
			reply.setReply_number(reply_number);
			service.modify(reply);
			return new ResponseEntity<>("ReplyUpdateOK", HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/{reply_number}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_number") Integer reply_number){
		logger.debug("ReplyDelete>>{}", reply_number);
		try {
			service.remove(reply_number);
			return new ResponseEntity<>("ReplyDeleteOK", HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/all/{board_number}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("board_number") Integer board_number,
							    @PathVariable("page") Integer page){
		logger.debug("ReplyList>>{}", board_number);
		try {
			Map<String, Object> map = new HashMap<>();
			Criteria cri = new Criteria();
			cri.setPage(page);
			PageMaker pagemaker = new PageMaker(cri);
            		
			//해당 게시물에 ? page에 있는 댓글을 조회해 옴
			List<ReplyVO> list = service.listReplyPage(board_number, cri);
			map.put("list", list);
			
			//뷰에서 페이지 번호를 그리기 위해 PageMaker 객체 이용 
			int replyCount = service.getTotalCount(board_number);
			pagemaker.setTotalDataCount(replyCount);
			map.put("pageMaker", pagemaker);
			
			return new ResponseEntity<>(map, HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
	}
}
