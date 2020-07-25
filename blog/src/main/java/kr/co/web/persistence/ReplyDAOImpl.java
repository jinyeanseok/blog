package kr.co.web.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	SqlSession session;
	
	private static final String NS = "replyMapper";
	private static final String CREATE = NS + ".createReply";
	private static final String UPDATE = NS + ".updateReply";
	private static final String DELETE = NS + ".deleteReply";
	private static final String LISTPAGE = NS + ".listPageReply";
	private static final String GETTOTALCOUNT = NS + ".getTotalCountReply";
	
	@Override
	public void create(ReplyVO reply) throws Exception {
		session.insert(CREATE, reply);
	}
	
	@Override
	public void update(ReplyVO reply) throws Exception {
		session.update(UPDATE, reply);
	}
	
	@Override
	public void delete(Integer reply_number) throws Exception {
		session.delete(DELETE, reply_number);
	}
	
	@Override
	public List<ReplyVO> listPage(Integer board_number, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("board_number", board_number);
		paramMap.put("cri", cri);
		
		return session.selectList(LISTPAGE, paramMap);
	}
	
	@Override
	public int getTotalCount(Integer board_number) {
		return session.selectOne(GETTOTALCOUNT, board_number);
	}
}
