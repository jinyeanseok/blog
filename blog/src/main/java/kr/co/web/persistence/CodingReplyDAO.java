package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.CodingReplyVO;

public interface CodingReplyDAO {
	
	public void create(CodingReplyVO vo) throws Exception;
	public void update(CodingReplyVO vo) throws Exception;
	public void delete(CodingReplyVO vo) throws Exception;
	public List<CodingReplyVO> readReply(int board_number) throws Exception;
	public CodingReplyVO selectReply(int reply_number) throws Exception;
}
