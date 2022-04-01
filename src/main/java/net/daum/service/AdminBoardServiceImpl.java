package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.daum.dao.AdminBoardDAO;
import net.daum.vo.BoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private AdminBoardDAO adminBoardDAO;

	@Override
	public int getListCount(BoardVO b) {
		return this.adminBoardDAO.getListCount(b);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO b) {
		return this.adminBoardDAO.getBoardList(b);
	}

	@Override
	public void insertBoard(BoardVO b) {
		this.adminBoardDAO.insertBoard(b);		
	}

	@Override
	public BoardVO getAdminBoardCont(int board_no) {
		return this.adminBoardDAO.getAdminBoardCont(board_no);
	}

	@Override
	public void editBoard(BoardVO eb) {
		this.adminBoardDAO.editBoard(eb);			
	}

	@Override
	public void deleteBoard(int no) {
		this.adminBoardDAO.deleteBoard(no);		
	}
}















