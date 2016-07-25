/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.sqn.www.mnote.service;

import java.util.List;

import kr.co.sqn.www.mnote.vo.GroupVO;

/**
 * @Class Name : HomeService.java
 * @Description : HomeService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 김나라
 * @since 2016. 07.12
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface MainService {

	/**
	 * 조회한다.
	 * @param groupVO - 조회할 정보가 담긴 VO
	 * @return 그룹목록
	 * @exception Exception
	 */
	List<?> selectGroupList(GroupVO groupVO) throws Exception;

	/**
	 * 조회한다.
	 * @param groupVO - 조회할 정보가 담긴 VO
	 * @return 그룹정보
	 * @exception
	 */
	GroupVO selectGroupDetail(GroupVO groupVO) throws Exception;
	
	

	/**
	 * 조회한다.
	 * @param groupVO - 조회할 정보가 담긴 VO
	 * @return 그룹정보
	 * @exception
	 */
	List<?> selectPersonList(GroupVO groupVO) throws Exception;
	
	

}
