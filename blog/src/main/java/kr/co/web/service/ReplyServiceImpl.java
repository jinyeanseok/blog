package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;
import kr.co.web.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	ReplyDAO replyDAO;
	
	@Override
	public void register(ReplyVO reply) throws Exception {
		replyDAO.create(reply);
		
	}
	@Override
	public void modify(ReplyVO reply) throws Exception {
		replyDAO.update(reply);
		
	}
	@Override
	public void remove(Integer reply_number) throws Exception {
		replyDAO.delete(reply_number);
	}
	@Override
	public List<ReplyVO> listReplyPage(Integer board_number, Criteria cri) throws Exception {
		return replyDAO.listPage(board_number, cri);
	}
	@Override
	public int getTotalCount(Integer board_number) throws Exception {
		return replyDAO.getTotalCount(board_number);
	}
	
	
}
