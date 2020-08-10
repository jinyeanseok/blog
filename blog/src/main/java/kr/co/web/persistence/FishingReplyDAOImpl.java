package kr.co.web.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.Criteria;
import kr.co.web.domain.FishingReplyVO;

@Repository
public class FishingReplyDAOImpl implements FishingReplyDAO{

	@Inject
	SqlSession session;
	
	private static final String NS = "FishingreplyMapper";
	private static final String CREATE = NS + ".writeReplyFishing";
	private static final String UPDATE = NS + ".updateReplyFishing";
	private static final String DELETE = NS + ".deleteReplyFishing";
	private static final String READ = NS + ".readReplyFishing";
	private static final String SELECTREPLY = NS + ".selectReplyFishing";
	
	@Override
	public void create(FishingReplyVO vo) throws Exception {
		session.insert(CREATE, vo);
	}
	
	@Override
	public void update(FishingReplyVO vo) throws Exception {
		session.update(UPDATE, vo);
	}
	
	@Override
	public void delete(FishingReplyVO vo) throws Exception {
		session.delete(DELETE, vo);
	}
	
	@Override
	public List<FishingReplyVO> readReply(int board_number) throws Exception {
		return session.selectList(READ, board_number);
	}
	
	@Override
	public FishingReplyVO selectReply(int reply_number) throws Exception {
		return session.selectOne(SELECTREPLY, reply_number);
	}
}
