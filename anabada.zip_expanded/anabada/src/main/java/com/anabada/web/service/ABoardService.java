package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;

public interface ABoardService {

	//게시글 작성
	public void write(ABoardVO boardVO) throws Exception;
	
	//전체 게시글 목록
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception;
	
	//전체 게시글 총 개수
	public int listCount(ASearchCriteria scri) throws Exception;
	
	//게시글 상세보기
	public ABoardVO read(int a_bno) throws Exception;
	
	//게시글 수정
	public void update(ABoardVO boardVO) throws Exception;
	
	//게시글 삭제, 관리자가 신고한 게시글 삭제
	public void delete(int a_bno) throws Exception;
	
	//마이페이지 내가 작성한 글 목록 보기
	public List<ABoardVO> myWriteList(ASearchCriteria scri) throws Exception;
	
	//내가 작성한 글 개수
	public int writeListCount(ASearchCriteria scri) throws Exception;

	//게시글 신고 DB 저장
	public void reportComplaint(ComplaintVO complaintVO) throws Exception;

	//게시글 신고 내역 상세보기
	public ABoardVO complaintRead(int a_bno) throws Exception;

	//게시글 유효성 검사
	public int deleteChk(int a_bno) throws Exception;

	//신고 유효성 검사
	public int complaintChk(Map<String, String> comChk) throws Exception;

	//게시글 상세보기에서 댓글 달면 댓글 개수 업데이트
	public void updateReplyCount(int a_bno) throws Exception;


}
