package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.domain.ItemDTO;

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
		System.out.println(ino);
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
	


}
