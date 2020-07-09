package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.BoardVO;

public interface BoardDAO {

	public void create(BoardVO board) throws Exception;
	
	public BoardVO read(Integer board_number) throws Exception;
	
	public void update(BoardVO board) throws Exception;
	
	public void delete(Integer board_number) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public Integer getMaxBoard_number() throws Exception;
}
