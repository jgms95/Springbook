package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PickupDTO;

@Repository
public class PickupDAOImpl implements PickupDAO{

	@Inject
	private SqlSession session;
	
	private final String NS = "p.i.c";

	@Override
	public List<PickupDTO> pickupList(String id) {
		
		return session.selectList(NS+".pickupList", id);
		
	}

	@Override
	public void pickupDelete(int pno) {
		
		session.delete(NS + ".pickupDelete", pno);
	}

	

}
