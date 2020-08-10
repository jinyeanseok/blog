package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.FishingReplyVO;
import kr.co.web.persistence.FishingReplyDAO;

@Service
public class FishingReplyServiceImpl implements FishingReplyService{
	
	@Inject
	FishingReplyDAO replyDAO;
	
	@Override
	public void register(FishingReplyVO vo) throws Exception {
		replyDAO.create(vo);
		
	}
	@Override
	public void modify(FishingReplyVO vo) throws Exception {
		replyDAO.update(vo);
		
	}
	@Override
	public void remove(FishingReplyVO vo) throws Exception {
		replyDAO.delete(vo);
	}
	
	@Override
	public List<FishingReplyVO> readReply(int board_number) throws Exception {
		return replyDAO.readReply(board_number);
	}
	
	@Override
	public FishingReplyVO selectReply(int reply_number) throws Exception {
		return replyDAO.selectReply(reply_number);
	}
}
