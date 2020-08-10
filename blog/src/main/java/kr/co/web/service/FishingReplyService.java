package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.FishingReplyVO;

public interface FishingReplyService {
	public void register(FishingReplyVO vo) throws Exception;
	public void modify(FishingReplyVO vo) throws Exception;
	public void remove(FishingReplyVO vo) throws Exception;
	public List<FishingReplyVO> readReply(int board_number) throws Exception;
	public FishingReplyVO selectReply(int reply_number) throws Exception;
}
