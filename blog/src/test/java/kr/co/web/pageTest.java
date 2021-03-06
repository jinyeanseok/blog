package kr.co.web;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.service.BoardService;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//Runner 클래스(테스트 메소드를 실행하는 클래스) 를 SpringJUnit4ClassRunner로 함
@RunWith(SpringJUnit4ClassRunner.class)
//location 속성 경로에 있는 xml 파일을 이용해서 스프링이 로딩됨
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class pageTest {
	@Inject
	private BoardService service;
	private static Logger logger = LoggerFactory.getLogger(pageTest.class);
	
	@Test
	public void listPageTest() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<BoardVO> boards = service.listPage(cri);
		for (BoardVO board : boards) {
			logger.info(board.getBoard_number()+ ":" + board.getTitle());
		}		
	}
	
	@Test
	public void getTotalCountTest() throws Exception {
		Criteria cri = new Criteria();
		Integer totalCount = service.totalCount(cri);
		logger.info("totalCount: "+totalCount.toString());
	}
}