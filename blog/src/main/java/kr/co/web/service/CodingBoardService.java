package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.CodingBoardVO;
import kr.co.web.domain.Criteria;

public interface CodingBoardService {
	
	public void create(CodingBoardVO board) throws Exception;
	
	public CodingBoardVO read(Integer board_number) throws Exception;
	
	public void update(CodingBoardVO board) throws Exception;
	
	public void delete(Integer board_number) throws Exception;
	
	public List<CodingBoardVO> listAll() throws Exception;
	
	public List<CodingBoardVO> listPage(Criteria cri) throws Exception;
	
	public int totalCount(Criteria cri) throws Exception;
	
	public int viewCount(int board_number) throws Exception;
	
	public void updateReplyCount(int board_number) throws Exception;
}
