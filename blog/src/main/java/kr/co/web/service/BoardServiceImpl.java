package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.BoardVO;
import kr.co.web.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;
	
	public void create(BoardVO board) throws Exception {
		boardDAO.create(board);
	}
	
	public BoardVO read(Integer board_number) throws Exception {
		return boardDAO.read(board_number);
	}
	
	public void update(BoardVO board) throws Exception {
		boardDAO.update(board);
	}
	
	public void delete(Integer board_number) throws Exception {
		boardDAO.delete(board_number);
	}
	
	public List<BoardVO> listAll() throws Exception {
		return boardDAO.listAll();
	}

}
