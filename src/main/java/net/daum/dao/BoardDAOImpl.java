package net.daum.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.daum.vo.BoardVO;

@Repository //이 애노테이션을 등록해서 스프링에 DAOImpl 인식
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;//자동 의존성 주입.
	//mybatis 쿼리문 실행객체

	@Override
	public void insertBoard(BoardVO b) {
      this.sqlSession.insert("board_in",b);
      //insert()메서드는 레코드 저장, board_in은 insert 아이디명
      //아이디명은 유일해야 한다.중복 있어면 안된다.
	}//게시판 저장	

	@Override
	public List<BoardVO> getBoardList(BoardVO b) {
		return this.sqlSession.selectList("board_li",b);
//selectList()메서드는 복수개의 레코드를 검색해서 컬렉션 List로
//반환한다. select 아이디명 board_li		
	}//게시판 목록

	@Override
	public int getListCount(BoardVO b) {
		return this.sqlSession.selectOne("board_row",b);
//selectOne() 메서드는 단 한개의 레코드만 반환. board_row는
//select 아이디명		
	}//총레코드 개수

	@Override
	public void updateHit(int board_no) {
		this.sqlSession.update("board_hi",board_no);
		//board_hi는 update 아이디명,update()메서드가 레코드
		//수정. this.은 생략가능
	}//조회수 증가	

	@Override
	public BoardVO getBoardCont(int board_no) {
		return this.sqlSession.selectOne("board_co",board_no);
	}//내용보기

	@Override
	public void updateLevel(BoardVO rb) {
		this.sqlSession.update("reply_up",rb);		
	}//답변 레벨 증가

	@Override
	public void replyBo(BoardVO rb) {
		this.sqlSession.insert("reply_in",rb);		
	}//답변 저장

	@Override
	public void editBoard(BoardVO eb) {
		this.sqlSession.update("board_up", eb);		
	}//게시물 수정

	@Override
	public void delBoard(int board_no) {
		this.sqlSession.delete("board_del",board_no);
		//delete()메서드로 레코드 삭제, board_del은 delete 아이
		//디 명
	}//게시물 삭제
}












