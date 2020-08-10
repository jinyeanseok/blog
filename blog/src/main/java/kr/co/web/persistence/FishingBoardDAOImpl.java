package kr.co.web.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.FishingBoardVO;
import kr.co.web.domain.FishingBoardVO;
import kr.co.web.domain.Criteria;

@Repository
public class FishingBoardDAOImpl implements FishingBoardDAO{

	// SQL문을 실행하는 메소드를 가지고 있는 SqlSession을 구현한 SqlSessionTemplate을 찾아서 객체를 자동으로 생성
	@Inject
	private SqlSession session;
	
	private static String NS = "FishingBoardMapper";
	private static String CREATE = NS + ".createFishing";
	private static String READ = NS + ".readFishing";
	private static String UPDATE = NS + ".updateFishing";
	private static String DELETE = NS + ".deleteFishing";
	private static String LISTALL = NS + ".listAllFishing";
	private static String LISTPAGE = NS + ".listPageFishing";
	private static String GETMAXBOARD_NUMBER = NS + ".getMaxBnoFishing";
	private static String TOTALCOUNT = NS + ".totalCountFishing";
	private static String VIEWCOUNT = NS + ".viewCountFishing";
	private static String UPDATEREPLYCOUNT = NS + ".updateReplyCountFishing";
	
	@Override
	public void create(FishingBoardVO board) throws Exception {
		session.insert(CREATE, board);
		// 글을 작성할 때 입력한 값을 boardVO에 넣어주기 위해 파라미터값을 board로 함
	}
	
	@Override
	public FishingBoardVO read(Integer board_number) throws Exception {
		return session.selectOne(READ, board_number);
		// 글을 읽기 위해 mapper에 where절에 게시글번호가 필요하기 때문에 board_number로 설정하고 boardVO를 리턴값으로 설정
	}
	
	@Override
	public void update(FishingBoardVO board) throws Exception {
		session.update(UPDATE, board);
	}
	
	@Override
	public void delete(Integer board_number) throws Exception {
		session.delete(DELETE, board_number);
	}
	
	@Override
	public List<FishingBoardVO> listAll() throws Exception {
		return session.selectList(LISTALL);
	}
	
	@Override
	public List<FishingBoardVO> listPage(Criteria cri) throws Exception {
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
	
	@Override
	public int viewCount(int board_number) throws Exception {
		return session.update(VIEWCOUNT, board_number);
	}
	
	@Override
	public void updateReplyCount(int board_number) throws Exception {
		session.update(UPDATEREPLYCOUNT, board_number);
	}
}
