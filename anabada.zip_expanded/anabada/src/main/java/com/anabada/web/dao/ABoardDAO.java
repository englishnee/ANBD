package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;

public interface ABoardDAO {
	
	//게시글 작성
	public void write(ABoardVO boardVO) throws Exception;
	
	//전체 게시글 목록
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception;
	
	//전체 게시글 총 개수
	public int listCount(ASearchCriteria scri) throws Exception;
	
	//게시글 상세보기
	public ABoardVO read(int a_bno) throws Exception;
	
	//게시글 조회수
	public void cnt(int a_bno) throws Exception;
	
	//게시글 수정
	public void update(ABoardVO boardVO) throws Exception;
	
	//게시글 삭제
	public void delete(int a_bno) throws Exception;

	//내가 작성한 글 목록 
	public List<ABoardVO> writeList(ASearchCriteria scri) throws Exception;

	//내가 작성한 글 개수
	public int writeListCount(ASearchCriteria scri) throws Exception;

	//게시글 DB 저장
	public void reportComplaint(ComplaintVO complaintVO) throws Exception;


}
