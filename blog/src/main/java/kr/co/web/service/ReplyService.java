package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO reply) throws Exception;
	public void modify(ReplyVO reply) throws Exception;
	public void remove(Integer reply_number) throws Exception;
	public List<ReplyVO> listReplyPage(Integer board_number, Criteria cri) throws Exception;
	public int getTotalCount(Integer board_number) throws Exception;
}
