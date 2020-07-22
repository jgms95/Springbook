package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	@Autowired
	private SqlSession session;
	private final String NS = "n.t.o";
	
	@Override
	public PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); //oracle과 stack의 인덱스만 1부터 시작하고 나머진 0부터 시작
		List<NoticeDTO> list = session.selectList(NS+".list",null,rowBounds);
		to.setList(list);
		Integer amount = session.selectOne(NS+".getAmount");
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}
}
