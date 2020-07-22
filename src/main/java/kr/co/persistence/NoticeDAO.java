package kr.co.persistence;

import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;

public interface NoticeDAO {

	PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to);

}
