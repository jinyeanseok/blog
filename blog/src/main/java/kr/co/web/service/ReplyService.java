package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO vo) throws Exception;
	public void modify(ReplyVO vo) throws Exception;
	public void remove(ReplyVO vo) throws Exception;
	public List<ReplyVO> readReply(int board_number) throws Exception;
	public ReplyVO selectReply(int reply_number) throws Exception;
}
