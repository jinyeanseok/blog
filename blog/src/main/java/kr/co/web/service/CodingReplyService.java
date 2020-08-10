package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.CodingReplyVO;

public interface CodingReplyService {
	public void register(CodingReplyVO vo) throws Exception;
	public void modify(CodingReplyVO vo) throws Exception;
	public void remove(CodingReplyVO vo) throws Exception;
	public List<CodingReplyVO> readReply(int board_number) throws Exception;
	public CodingReplyVO selectReply(int reply_number) throws Exception;
}
