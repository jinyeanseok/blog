package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.FishingReplyVO;

public interface FishingReplyDAO {
	
	public void create(FishingReplyVO vo) throws Exception;
	public void update(FishingReplyVO vo) throws Exception;
	public void delete(FishingReplyVO vo) throws Exception;
	public List<FishingReplyVO> readReply(int board_number) throws Exception;
	public FishingReplyVO selectReply(int reply_number) throws Exception;
}
