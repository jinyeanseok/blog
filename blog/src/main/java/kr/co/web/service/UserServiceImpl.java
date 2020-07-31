package kr.co.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.UserVO;
import kr.co.web.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO user;
	
	@Override
	public void register(UserVO vo) throws Exception {
		user.register(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return user.login(vo);
	}
	
	@Override
	public void modify(UserVO vo) throws Exception {
		user.modify(vo);
	}
	
	@Override
	public void remove(UserVO vo) throws Exception {
		user.remove(vo);
	}
	
	@Override
	public int idOverlap(UserVO vo) throws Exception {
		int result = user.idOverlap(vo);
		return result;
	}
}
