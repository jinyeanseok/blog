package kr.co.web.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.CodingReplyVO;

@Repository
public class CodingReplyDAOImpl implements CodingReplyDAO{

	@Inject
	SqlSession session;
	
	private static final String NS = "CodingreplyMapper";
	private static final String CREATE = NS + ".writeReplyCoding";
	private static final String UPDATE = NS + ".updateReplyCoding";
	private static final String DELETE = NS + ".deleteReplyCoding";
	private static final String READ = NS + ".readReplyCoding";
	private static final String SELECTREPLY = NS + ".selectReplyCoding";
	
	@Override
	public void create(CodingReplyVO vo) throws Exception {
		session.insert(CREATE, vo);
	}
	
	@Override
	public void update(CodingReplyVO vo) throws Exception {
		session.update(UPDATE, vo);
	}
	
	@Override
	public void delete(CodingReplyVO vo) throws Exception {
		session.delete(DELETE, vo);
	}
	
	@Override
	public List<CodingReplyVO> readReply(int board_number) throws Exception {
		return session.selectList(READ, board_number);
	}
	
	@Override
	public CodingReplyVO selectReply(int reply_number) throws Exception {
		return session.selectOne(SELECTREPLY, reply_number);
	}
}
