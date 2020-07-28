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
	private static final String CREATE = NS + ".writeReply";
	private static final String UPDATE = NS + ".updateReply";
	private static final String DELETE = NS + ".deleteReply";
	private static final String READ = NS + ".readReply";
	private static final String SELECTREPLY = NS + ".selectReply";
	
	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(CREATE, vo);
	}
	
	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(UPDATE, vo);
	}
	
	@Override
	public void delete(ReplyVO vo) throws Exception {
		session.delete(DELETE, vo);
	}
	
	@Override
	public List<ReplyVO> readReply(int board_number) throws Exception {
		return session.selectList(READ, board_number);
	}
	
	@Override
	public ReplyVO selectReply(int reply_number) throws Exception {
		return session.selectOne(SELECTREPLY, reply_number);
	}
}
