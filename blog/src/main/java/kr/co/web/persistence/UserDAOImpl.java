package kr.co.web.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String NS = "userMapper";
	private static final String REGISTER = NS + ".register";
	private static final String LOGIN = NS + ".login";
	private static final String LOGINBCRYPT = NS + ".loginBcrypt";
	private static final String MODIFY = NS + ".modify";
	private static final String REMOVE = NS + ".remove";
	private static final String IDOVERLAP = NS + ".idOverlap";
	
	@Override
	public void register(UserVO vo) throws Exception {
		session.insert(REGISTER, vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return session.selectOne(LOGINBCRYPT, vo);
	}
	
	@Override
	public void modify(UserVO vo) throws Exception {
		session.update(MODIFY, vo);
	}
	
	@Override
	public void remove(UserVO vo) throws Exception {
		session.delete(REMOVE, vo);
	}
	
	@Override
	public int idOverlap(UserVO vo) throws Exception {
		int result = session.selectOne(IDOVERLAP, vo);
		return result;
	}
	
}
