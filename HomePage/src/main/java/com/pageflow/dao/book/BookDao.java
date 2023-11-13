
package com.pageflow.dao.book;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.dto.book.*;
import com.pageflow.entity.book.*;

@Mapper
public interface BookDao {
  // 셀렉트키 활용
  @SelectKey(statement = "select book_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "bno")

  /** 책 등록 */
  @Insert("INSERT INTO book (bno, category_code, book_title, book_image, book_intro, book_content, publish_date, book_price, stock, translator, publisher_name, author_name) "
      + "VALUES (#{bno}, #{categoryCode}, #{bookTitle}, #{bookImage}, #{bookIntro}, #{bookContent}, #{publishDate}, #{bookPrice}, #{stock}, #{translator, jdbcType = VARCHAR}, #{publisherName}, #{authorName})")
  public Integer save(Book book);

  /** 도서 페이지 (최근 5권의 소설, 참고도서, 만화를 선택해서 리스트 보여주기) (book-mapper에 있음) */
  public List<BookDto.Recent> find5Recent(Long categoryParent, String memberId, Long gradeCode);

  /** 책 정보 가져오기 (book-mapper에 있음) */
  public Book findByBook(Long bno, String memberId, Long gradeCode);

  /** 주어진 책 번호에 해당하는 책의 카테고리 코드를 반환 */
  @Select("SELECT category_code FROM book WHERE bno = #{bno} and rownum = 1")
  public Long findCategoryCodeByBno(Long bno);

  /** 작가의 다른 작품 가져오기 (book-mapper에 있음) */
  public List<Book> findOtherBooksByAuthor(String authorName);

  /** 작가 이름을 검색해 작가의 책 정보 리스트 보여주기 */
  public List<BookDto.BookList> searchAuthorBook(String authorName, String memberId, Long gradeCode, Long startRownum,
      Long endRownum);

  /** 작가의 작품 도서의 총 개수 구하기 */
  @Select("select count(*) from book where author_name = #{keyword}")
  public Long authorBookCount(String keyword);

  /** 출판사 이름을 검색해 출판사의 책 정보 리스트 보여주기 */
  public List<BookDto.BookList> searchPublisherBook(String publisherName, String memberId, Long gradeCode,
      Long startRownum, Long endRownum);

  /** 출판사의 작품 도서의 총 개수 구하기 */
  @Select("select count(*) from book where publisher_name = #{keyword}")
  public Long publisherBookCount(String keyword);

  /** 작품 종류별로 페이징해서 가지고 오기 (book-mapper에 있음) */
  public List<BookDto.BookList> findBookByCategoryParent(Long categoryParent, String memberId, Long gradeCode,
      Long startRownum, Long endRownum);

  /** 작품 장르별로 페이징해서 가지고 오기 (book-mapper에 있음) */
  public List<BookDto.BookList> findBookByCategoryCode(Long categoryCode, Long categoryParent, String memberId,
      Long gradeCode, Long startRownum, Long endRownum);

  /** 작품 종류별로 총 개수 구하기 */
  @Select("select count(*) from book inner join category on book.category_code=category.category_code where category.category_parent = #{categoryParent}")
  public Long categoryParentCount(Long categoryParent);

  /** 작품 장르별로 총 개수 구하기 */
  @Select("select count(*) from book inner join category on book.category_code=category.category_code where category.category_code = #{categorycode}")
  public Long categoryCodeCount(Long categoryCode);

  /** 관리자가 도서 상품 관리하기 위한 리스트 (book-mapper에 있음) */
  public List<Book> findAll(Long startRownum, Long endRownum);

  /** 관리자 페이지에 있는 도서 리스트 총 개수 구하기 */
  @Select("select count(*) from book")
  public Long adminBookListCount();

  /** 도서 삭제 */
  @Delete("delete from book where bno= #{bno}")
  public Long deleteById(Long bno);

  /** 도서를 찾기 위해서 BNO 를 통해 책 정보 출력 */
  @Select("select * from book where bno = #{bno} and rownum = 1")
  public Book findByBno(Long bno);

  /** 등록된 도서를 관리자가 수정하기 */
  @Update("update book set category_code=#{categoryCode}, book_title=#{bookTitle}, book_image=#{bookImage}, book_intro = #{bookIntro}, book_content = #{bookContent},"
      + "publish_date = #{publishDate}, book_price = #{bookPrice}, stock = #{stock}, translator = #{translator, jdbcType = VARCHAR}, publisher_name = #{publisherName}, author_name = #{authorName}"
      + "where bno = #{bno}")
  public Long bookUpdate(Book book);

  /** 검색어와 일치하는 작가, 출판사, 책 제목을 가진 도서의 정보를 목록으로 보여주는 페이지 (book-mapper에 있음) */
  public List<BookDto.BookList> searchList(String keyword, String memberId, Long gradeCode, Long startRownum,
      Long endRownum);

  /** 검색한 도서 목록의 총 개수 구하기 */
  /** 관리자 상품 검색 페이지 도서 총 개수 */
  @Select("select count(*) from book where author_name like '%' || #{keyword} || '%' or publisher_name like '%' || #{keyword} || '%' "
      + "or book_title like '%' || #{keyword} || '%' ")
  public Long searchListCount(String keyword);

  /** 관리자 상품 검색 리스트 (book-mapper에 있음) */
  public List<Book> adminSearchList(Long startRownum, Long endRownum, String keyword);
  
  /** 새로나온 책 소개 */
  @Select("select * from book b inner join category c on b.category_code = c.category_code order by publish_date desc")
  public List<BookDto.NewBook> newBook();

}
