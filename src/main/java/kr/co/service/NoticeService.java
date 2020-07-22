package kr.co.service;

import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;

public interface NoticeService {

	PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to);

}
