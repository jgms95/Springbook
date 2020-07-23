package kr.co.service;


import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDao;

	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}


	@Override
	public MemberDTO loginpost(LoginDTO login) {
		return memberDao.loginpost(login);
	}

	@Override
	public int checkId(MemberDTO dto) {
		return memberDao.checkId(dto);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return memberDao.findId(dto);
	}

	@Override
	public MemberDTO findPw(MemberDTO dto) {
		return memberDao.findPw(dto);
	}


	@Override
	public String findAuthority(String id) {
		return memberDao.findAuthority(id);
	}


	@Override
	public MemberDTO readId(String id) {
		return memberDao.readId(id);
	}
}
