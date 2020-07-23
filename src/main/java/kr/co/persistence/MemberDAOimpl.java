package kr.co.persistence;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

@Repository
public class MemberDAOimpl implements MemberDAO{
	
	
	@Autowired
	private SqlSession session;

	private final String NS = "m.e.m";
	
	@Override
	public void insert(MemberDTO dto) {
		session.insert(NS + ".insert",dto); //"m.e.m" mapper에 id가 insert인 것을 실행
	}

	@Override
	public MemberDTO loginpost(LoginDTO login) {
		return session.selectOne(NS+".loginpost",login);
	}

	@Override
	public int checkId(MemberDTO dto) {
		return session.selectOne(NS+".checkId",dto);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return session.selectOne(NS+".findId",dto);
	}

	@Override
	public MemberDTO findPw(MemberDTO dto) {
		return session.selectOne(NS+".findPw",dto);
	}

	@Override
	public String findAuthority(String id) {
		return session.selectOne(NS+".findAuthority",id);
	}

	@Override
	public MemberDTO readId(String id) {
		return session.selectOne(NS+".readId",id);
	}

	

}
