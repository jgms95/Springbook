package kr.co.service;

import java.util.List;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;

public interface BookSaleService {

	void insert(ItemDTO dto);

	List<ItemDTO> list();

	void delete(int ino);

	PageTO<ItemDTO> list(PageTO<ItemDTO> to);

	ItemDTO updateui(int ino);

	void update(ItemDTO dto);

	List<ItemDTO> searchlist(String cataCode);

	PageTO<ItemDTO> searchlist(PageTO<ItemDTO> to, String cataCode);



}
