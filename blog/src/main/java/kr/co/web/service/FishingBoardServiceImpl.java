package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.FishingBoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.persistence.CodingBoardDAO;
import kr.co.web.persistence.FishingBoardDAO;

@Service
public class FishingBoardServiceImpl implements FishingBoardService{
	
	@Inject
	private FishingBoardDAO boardDAO;
	
	@Override
	public void create(FishingBoardVO board) throws Exception {
		boardDAO.create(board);
	}
	
	@Override
	public FishingBoardVO read(Integer board_number) throws Exception {
		return boardDAO.read(board_number);
	}
	
	@Override
	public void update(FishingBoardVO board) throws Exception {
		boardDAO.update(board);
	}
	
	@Override
	public void delete(Integer board_number) throws Exception {
		boardDAO.delete(board_number);
	}
	
	@Override
	public List<FishingBoardVO> listAll() throws Exception {
		return boardDAO.listAll();
	}
	
	@Override
	public List<FishingBoardVO> listPage(Criteria cri) throws Exception {
		return boardDAO.listPage(cri);
	}
	
	@Override
	public int totalCount(Criteria cri) throws Exception {
		return boardDAO.totalCount(cri);
	}
	
	@Override
	public int viewCount(int board_number) throws Exception {
		return boardDAO.viewCount(board_number);
	}
	
	@Override
	public void updateReplyCount(int board_number) throws Exception {
		boardDAO.updateReplyCount(board_number);
	}

}
