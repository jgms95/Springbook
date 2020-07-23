package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;

@Repository
public class BookSaleDAOImpl implements BookSaleDAO{

	@Autowired
	private SqlSession session;

	private final String NS = "b.k.s";

	@Override
	public void insert(ItemDTO dto) {
		Integer ino = session.selectOne(NS+".getIno");
		if(ino!=null) {
			ino += 1;
		}else {
			ino = 1 ;
		}
		dto.setIno(ino);
	
		session.insert(NS+".insert",dto);
		
		
	}@Override
	public List<ItemDTO> list() {
		
		
		// TODO Auto-generated method stubc
		return session.selectList(NS+".list");
	}
	@Override
	public void delete(int ino) {
		// TODO Auto-generated method stub
		System.out.println(ino);
		
		session.delete(NS+".delete", ino);
	}
	@Override
	public PageTO<ItemDTO> list(PageTO<ItemDTO> to) {
//		
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());




		List<ItemDTO> list = session.selectList(NS+".list", null, rowBounds);

		to.setList(list);

		Integer amount = session.selectOne(NS+".getAmount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}

		return to;
}
	@Override
	public ItemDTO updateui(int ino) {
		
		return session.selectOne(NS+".updateui", ino);
	}
	
	@Override
	public void update(ItemDTO dto) {
		// TODO Auto-generated method stub
		session.update(NS+".update", dto);
	}
	@Override
	public List<ItemDTO> searchlist(String cataCode) {
	
		return session.selectList(NS+".searchlist", cataCode);
	}
	@Override
	public PageTO<ItemDTO> searchlist(PageTO<ItemDTO> to, String cataCode) {
		
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());




		List<ItemDTO> list = session.selectList(NS+".searchlist", cataCode, rowBounds);    // catacode 가운데 넣으면 mapper로 가는건지 모르겠다 (차후확인)

		to.setList(list);

		Integer amount = session.selectOne(NS+".searchgetAmount", cataCode);      
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}

		return to;
	}


}
