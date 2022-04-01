package net.daum.dao;

import java.util.List;

import net.daum.vo.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO b);
	List<BoardVO> getBoardList(BoardVO b);
	int getListCount(BoardVO b);
	void updateHit(int board_no);
	BoardVO getBoardCont(int board_no);
	void updateLevel(BoardVO rb);
	void replyBo(BoardVO rb);
	void editBoard(BoardVO eb);
	void delBoard(int board_no);
}
