package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.CodingBoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.persistence.CodingBoardDAO;

@Service
public class CodingBoardServiceImpl implements CodingBoardService{
	
	@Inject
	private CodingBoardDAO boardDAO;
	
	@Override
	public void create(CodingBoardVO board) throws Exception {
		boardDAO.create(board);
	}
	
	@Override
	public CodingBoardVO read(Integer board_number) throws Exception {
		return boardDAO.read(board_number);
	}
	
	@Override
	public void update(CodingBoardVO board) throws Exception {
		boardDAO.update(board);
	}
	
	@Override
	public void delete(Integer board_number) throws Exception {
		boardDAO.delete(board_number);
	}
	
	@Override
	public List<CodingBoardVO> listAll() throws Exception {
		return boardDAO.listAll();
	}
	
	@Override
	public List<CodingBoardVO> listPage(Criteria cri) throws Exception {
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
