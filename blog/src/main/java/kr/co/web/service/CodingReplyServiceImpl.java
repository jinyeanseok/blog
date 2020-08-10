package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.CodingReplyVO;
import kr.co.web.persistence.CodingReplyDAO;

@Service
public class CodingReplyServiceImpl implements CodingReplyService{
	
	@Inject
	CodingReplyDAO replyDAO;
	
	@Override
	public void register(CodingReplyVO vo) throws Exception {
		replyDAO.create(vo);
		
	}
	@Override
	public void modify(CodingReplyVO vo) throws Exception {
		replyDAO.update(vo);
		
	}
	@Override
	public void remove(CodingReplyVO vo) throws Exception {
		replyDAO.delete(vo);
	}
	
	@Override
	public List<CodingReplyVO> readReply(int board_number) throws Exception {
		return replyDAO.readReply(board_number);
	}
	
	@Override
	public CodingReplyVO selectReply(int reply_number) throws Exception {
		return replyDAO.selectReply(reply_number);
	}
}
