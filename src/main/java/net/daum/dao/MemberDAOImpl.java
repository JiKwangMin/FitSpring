package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import net.daum.vo.MemberVO;
import net.daum.vo.QnaVO;
import net.daum.vo.ReviewVO;
import net.daum.vo.ToAddressVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject //자동 의존성 주입
	private SqlSession sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void memberJoin(MemberVO vo) {
		sqlSession.insert("memberJoin", vo);

	}

	@Override
	public int idCheck(String mem_id) throws Exception {
		return this.sqlSession.selectOne("idcheck", mem_id);
	}


	@Override
	public void updatePw(MemberVO vo) {
		this.sqlSession.update("p_edit",vo);	
		
	}

	@Override
	public MemberVO findpw(MemberVO vo) {
		return sqlSession.selectOne("find_pw",vo);
	}

	@Override
	public MemberVO findid(MemberVO vo) {
		return sqlSession.selectOne("findid",vo);
	}


	@Override
	public MemberVO getMember(String mem_id) {
		return this.sqlSession.selectOne("medit",mem_id); //mybatis에서 selectOne()메서드는 단 한개의 레코드만 반환, m_edit는 매퍼 xml태그에서 설정할 유일한 select 아이디명
	}

	@Override
	public MemberVO loginCheck(MemberVO m) {
		
		return this.sqlSession.selectOne("loginCheck",m);
	}

	@Override
	public String getState(String mem_id) {
		this.sqlSession.update("loginup",mem_id);//로그인변경
		return this.sqlSession.selectOne("get_state", mem_id);//정보가져오기
	}

	@Override
	public MemberVO getMeminfo(MemberVO mm) {
		return this.sqlSession.selectOne("get_cart",mm);
	}

	

	@Override
	public int getPoint(String mem_id) {
		return sqlSession.selectOne("getpoint",mem_id);
	}

	@Override
	public void mp(MemberVO mm) {
		sqlSession.update("mp",mm);
	}

	@Override
	public String getpwd(ReviewVO ri) {
		return this.sqlSession.selectOne("get_pwd", ri);
	}

	@Override
	public String getrepwd(QnaVO qi) {
		return this.sqlSession.selectOne("get_qpwd",qi);
	}

	@Override
	public String getqid(QnaVO qi) {
		return this.sqlSession.selectOne("get_qid", qi);
	}

	@Override
	public String getrid(ReviewVO ri) {
		return this.sqlSession.selectOne("get_rid", ri);
	}	

	@Override
	public void addressSave(ToAddressVO vo) {
		this.sqlSession.insert("save",vo);
	}

	@Override
	public int addressCnt(ToAddressVO vo) {
		return this.sqlSession.selectOne("addressCnt",vo);
	}

	@Override
	public void addressDefaultChange(ToAddressVO vo) {
		this.sqlSession.update("addressDefaultChange",vo);
	}

	@Override
	public List<ToAddressVO> addressBook(ToAddressVO vo) {
		return this.sqlSession.selectList("addressBook",vo);
	}

	@Override
	public void addressEdit(ToAddressVO vo) {
		this.sqlSession.update("addressEdit",vo);
	}

	@Override
	public void addressDel(int to_addr_no) {
		this.sqlSession.delete("addressDel",to_addr_no);
	}

	@Override
	public ToAddressVO getAddress(ToAddressVO address) {
		return this.sqlSession.selectOne("getAddress",address);
	}

}
