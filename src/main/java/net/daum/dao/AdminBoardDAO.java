package net.daum.dao;

import java.util.List;

import net.daum.vo.BoardVO;

public interface AdminBoardDAO {

	int getListCount(BoardVO b);
	List<BoardVO> getBoardList(BoardVO b);
	void insertBoard(BoardVO b);
	BoardVO getAdminBoardCont(int board_no);
	void editBoard(BoardVO eb);
	void deleteBoard(int no);

}
