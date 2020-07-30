package kr.co.web.service;

import kr.co.web.domain.UserVO;

public interface UserService {

	public void register(UserVO vo) throws Exception;
	public UserVO login(UserVO vo) throws Exception;
	public void modify(UserVO vo) throws Exception;
	public void remove(UserVO vo) throws Exception;
}
