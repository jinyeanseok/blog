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
	public void register(ReplyVO vo) throws Exception {
		replyDAO.create(vo);
		
	}
	@Override
	public void modify(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
		
	}
	@Override
	public void remove(ReplyVO vo) throws Exception {
		replyDAO.delete(vo);
	}
	
	@Override
	public List<ReplyVO> readReply(int board_number) throws Exception {
		return replyDAO.readReply(board_number);
	}
	
	@Override
	public ReplyVO selectReply(int reply_number) throws Exception {
		return replyDAO.selectReply(reply_number);
	}
}
