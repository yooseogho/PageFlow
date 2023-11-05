package com.pageflow.service.book;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.book.*;
import com.pageflow.entity.book.*;

@Service
public class CategoryService {
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	// 해당 책의 카테고리 이름과 부모 카테고리 이름 출력
	public List<Category> getCategoryPath(Long bno) {
//		주어진 책 번호(bno)에 해당하는 책이 속한 카테고리의 코드를 데이터베이스에서 조회
	    Long categoryCode = bookDao.findCategoryCodeByBno(bno);
	    
//	    반환할 카테고리 리스트를 생성 / 각각의 카테고리 정보가 담길 공간을 마련
	    List<Category> categoryList = new ArrayList<>();
	    
//	  	이 while 루프에서는 주어진 책이 속한 모든 계층의 카테고리 정보를 가져옴
	    while (categoryCode != null) {
	        // 현재 처리 중인 카테고리 코드에 대응하는 이름을 찾음
	        String categoryName = categoryDao.findNameByCategoryCode(categoryCode);
	        
	        // 현재 처리 중인 카테고리 코드에 대응하는 부모카테고리를 찾음
	        Long categoryParent = categoryDao.findParentIdById(categoryCode);

	        if (categoryName != null) {
	            Category category = new Category();
	            
	            // Category 객체에 필요한 정보 (ID, name, parentID) 설정
	            category.setCategoryCode(categoryCode);
	            category.setCategoryName(categoryName);
	            category.setCategoryParent(categoryParent); 
	            
	            // 생성된 Category 객체 추가
	            categoryList.add(0, category);  
	        }
	        
	        // 다음 루핑에서 부모 카테고리에 대해서 같은 작업들을 수행하기 위해 categoryCode의 변수값을 부모 카테고리 값으로 변경
	        categoryCode = categoryParent;
	    }
	    
	    return 	categoryList;  // 최종적으로 구성된 categorylist 반환
	}
	

}
