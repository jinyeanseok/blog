package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;

public interface ReplyDAO {
	
	public void create(ReplyVO reply) throws Exception;
	public void update(ReplyVO reply) throws Exception;
	public void delete(Integer reply_number) throws Exception;
	public List<ReplyVO> listPage(Integer board_number, Criteria cri) throws Exception;
	int getTotalCount(Integer board_number);
}
