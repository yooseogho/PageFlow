package com.pageflow.dao.bookReview;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.pageflow.entity.bookReview.*;

@Mapper
public interface BookReviewDao {

	// 리뷰 작성하기
	@SelectKey(statement = "select book_review_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "rno")
	@Insert("INSERT INTO book_review (rno, review_content, review_writer, review_date, bno, ono) VALUES (#{rno}, #{reviewContent}, #{reviewWriter}, #{reviewDate}, #{bno}, #{ono})")
	public BookReview save(BookReview bookReview);

	// 페이징 - 리뷰글의 총 개수
	@Select("select count(*) from book_review")
	public Long count();
	
	// 페이징 쿼리	
	public List<BookReview> findBookReviewPaging(Long startRownum,Long endRownum);
	

	// 상품 리뷰들의 개수
	@Select("select count(*) from book_review where rno=#{rno}")
	public Long countByrno(Long rno);	
	
	// 상품을 삭제할 때 상품의 리뷰들을 모두 삭제
	@Delete("delete from book_review where bno=#{bno}")
	public Integer deleteBybno(Long bno);
	
	// 리뷰 1개 삭제
	@Delete("delete from book_review where rno=#{rno} and review_Writer=#{reviewWriter}")
	public Integer deleteByIdAndReviewWriter(Long rno, String reviewWriter);
	
	// 리뷰글 수정
	@Update("UPDATE book_review SET review_content = #{reviewContent} WHERE rno = #{rno} AND review_writer = #{reviewWriter}")
	public Integer changeReviewContent(BookReview bookReview);

	
	// 특정 상품의 리뷰들을 출력
	@Select("select * from book_review where bno=#{bno} order by rno desc")
	public List<BookReview> findBybno(Long bno);
	

	@Select("select * from book_review")
	public List<BookReview> getAllBookReviews();
	
	

}
