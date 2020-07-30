package kr.co.web.persistence;

import kr.co.web.domain.UserVO;

public interface UserDAO {

	public void register(UserVO vo) throws Exception;
	public UserVO login(UserVO vo) throws Exception;
	public void modify(UserVO vo) throws Exception;
	public void remove(UserVO vo) throws Exception;
}
