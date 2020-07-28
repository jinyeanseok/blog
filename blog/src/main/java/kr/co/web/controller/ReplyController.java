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
	
//	@RequestMapping(value = "/{reply_number}", method = RequestMethod.DELETE)
//	public ResponseEntity<String> delete(@PathVariable("reply_number") Integer reply_number){
//		logger.debug("ReplyDelete>>{}", reply_number);
//		try {
//			service.remove(reply_number);
//			return new ResponseEntity<>("ReplyDeleteOK", HttpStatus.OK);
//		} catch(Exception e) {
//			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//	}
	
	
}
