package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;

public interface ReplyDAO {
	
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(ReplyVO vo) throws Exception;
	public List<ReplyVO> readReply(int board_number) throws Exception;
	public ReplyVO selectReply(int reply_number) throws Exception;
}
