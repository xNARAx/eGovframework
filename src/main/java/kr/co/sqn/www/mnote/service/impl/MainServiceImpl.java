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
package kr.co.sqn.www.mnote.service.impl;

import java.util.List;

import kr.co.sqn.www.mnote.mapper.MainMapper;
import kr.co.sqn.www.mnote.service.MainService;
import kr.co.sqn.www.mnote.vo.GroupVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : HomeServiceImpl.java
 * @Description : HomeService Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired MainMapper mainDAO;

	@Override
	public List<?> selectGroupList(GroupVO groupVO) throws Exception {
		return mainDAO.selectGroupList(groupVO);
	}
	
	@Override
	public GroupVO selectGroupDetail(GroupVO groupVO) throws Exception {
		return mainDAO.selectGroupDetail(groupVO);
	}
	
	@Override
	public List<?> selectPersonList(GroupVO groupVO) throws Exception {
		return mainDAO.selectPersonList(groupVO);
	}

}
