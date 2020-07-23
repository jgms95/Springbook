package kr.co.persistence;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO loginpost(LoginDTO login);

	int checkId(MemberDTO dto);

	MemberDTO findId(MemberDTO dto);

	MemberDTO findPw(MemberDTO dto);

	String findAuthority(String id);

	MemberDTO readId(String id);

}
