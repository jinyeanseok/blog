package kr.co.web.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	// SQL문을 실행하는 메소드를 가지고 있는 SqlSession을 구현한 SqlSessionTemplate을 찾아서 객체를 자동으로 생성
	@Inject
	private SqlSession session;
	
	private static String NS = "BoardMapper";
	private static String CREATE = NS + ".create";
	private static String READ = NS + ".read";
	private static String UPDATE = NS + ".update";
	private static String DELETE = NS + ".delete";
	private static String LISTALL = NS + ".listAll";
	private static String LISTPAGE = NS + ".listPage";
	private static String GETMAXBOARD_NUMBER = NS + ".getMaxBno";
	private static String TOTALCOUNT = NS + ".totalCount";
	
	@Override
	public void create(BoardVO board) throws Exception {
		session.insert(CREATE, board);
		// 글을 작성할 때 입력한 값을 boardVO에 넣어주기 위해 파라미터값을 board로 함
	}
	
	@Override
	public BoardVO read(Integer board_number) throws Exception {
		return session.selectOne(READ, board_number);
		// 글을 읽기 위해 mapper에 where절에 게시글번호가 필요하기 때문에 board_number로 설정하고 boardVO를 리턴값으로 설정
	}
	
	@Override
	public void update(BoardVO board) throws Exception {
		session.update(UPDATE, board);
	}
	
	@Override
	public void delete(Integer board_number) throws Exception {
		session.delete(DELETE, board_number);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(LISTALL);
	}
	
	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return session.selectList(LISTPAGE, cri);
	}
	
	@Override
	public Integer getMaxBoard_number() throws Exception {
		return session.selectOne(GETMAXBOARD_NUMBER);
	}
	
	@Override
	public int totalCount(Criteria cri) throws Exception {
		return session.selectOne(TOTALCOUNT, cri);
	}
	
}
