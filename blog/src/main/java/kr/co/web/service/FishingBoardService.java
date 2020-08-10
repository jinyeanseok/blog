package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.FishingBoardVO;
import kr.co.web.domain.Criteria;

public interface FishingBoardService {
	
	public void create(FishingBoardVO board) throws Exception;
	
	public FishingBoardVO read(Integer board_number) throws Exception;
	
	public void update(FishingBoardVO board) throws Exception;
	
	public void delete(Integer board_number) throws Exception;
	
	public List<FishingBoardVO> listAll() throws Exception;
	
	public List<FishingBoardVO> listPage(Criteria cri) throws Exception;
	
	public int totalCount(Criteria cri) throws Exception;
	
	public int viewCount(int board_number) throws Exception;
	
	public void updateReplyCount(int board_number) throws Exception;
}
