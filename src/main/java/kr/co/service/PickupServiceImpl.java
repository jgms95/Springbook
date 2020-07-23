package kr.co.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PickupDTO;
import kr.co.persistence.PickupDAO;


@Service
public class PickupServiceImpl implements PickupService{

	@Inject
	private PickupDAO pickupDao;

	@Override
	public List<PickupDTO> pickupList(String id) {
		
		return pickupDao.pickupList(id);
	}

	@Override
	public void pickupDelete(int pno) {

		pickupDao.pickupDelete(pno);
	}

	


}
