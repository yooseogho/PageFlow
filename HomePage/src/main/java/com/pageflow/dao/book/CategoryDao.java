
package com.pageflow.dao.book;

import org.apache.ibatis.annotations.*;

@Mapper
public interface CategoryDao {
	/** 주어진 카테고리 코드에 해당하는 카테고리 이름을 반환 */
	@Select("select category_name from category where category_code=#{categoryCode}")
	public String findNameByCategoryCode(Long categoryCode);
	
	/** 주어진 카테고리 코드의 부모 카테고리 코드를 반환 */
	@Select("SELECT category_parent FROM category WHERE category_code = #{categoryCode}")
	public Long findParentIdById(Long categoryId);
	
	
}
