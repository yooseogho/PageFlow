
package com.example.demo.dao.book;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.example.demo.dto.book.BookDto.*;
import com.example.demo.entity.book.Book;

@Mapper
public interface BookDao {

  // 페이징 쿼리 (맵퍼 따로만듬)
  public List<Book> findAll(Long startRownum, Long endRownum);
  
//  전체 조회
  @Select("select * from book")
  public Read selectAll();

  // 셀렉트키 활용
  @SelectKey(statement = "select book_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "bno")
  @Insert("INSERT INTO book (bno, book_title, subtitle, publish_date, book_price, stock, translator, publisher_code, author_code) "
	      + "VALUES (#{bno}, #{bookTitle}, #{subTitle}, #{publishDate}, #{bookPrice}, #{stock}, #{translator}, #{publisherCode}, #{authorCode})")
  public Integer save(Book book);

  // 페이징을 위한 책 총 갯수 확인
  @Select("select count(*) from book")
  public Long count();

  @Select("select * from book where bno=#{bno} and rownum=1")
  public Integer findById(Long bno);

  // 북 삭제
  @Delete("delete from book where bno=#{bno}")
  public Integer deleteById(Long bno);

  // 장바구니 상품 개수를 증가할 때 재고량을 확인하기 위해 사용한다
  @Select("select stock from book where bno=#{bno} and rownum=1")
  public Integer findStockById(Long bno);
  
//  도서 업데이트
  @Update("update book set book_title=#{bookTitle}, sub_title=#{subTitle}, book_price=#{bookPrice}"
      + ", translator=#{translator} where bno=#{bno}")
  public Integer updateBook(Long bno);

}
