package kr.co.persistence;

import java.util.List;


import kr.co.domain.ItemDTO;

public interface BookSaleDAO {

	void insert(ItemDTO dto);

	List<ItemDTO> list();

	void delete(int ino);

}
