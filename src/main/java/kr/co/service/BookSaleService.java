package kr.co.service;

import java.util.List;


import kr.co.domain.ItemDTO;

public interface BookSaleService {

	void insert(ItemDTO dto);

	List<ItemDTO> list();

	void delete(int ino);



}
