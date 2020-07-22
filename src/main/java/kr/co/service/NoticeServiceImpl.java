package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;
import kr.co.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Inject
	private NoticeDAO noticeDao;

	@Override
	public PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to) {
		return noticeDao.noticelist(to);
	}
}
