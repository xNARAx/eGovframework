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
package kr.co.sqn.www.menu1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.sqn.www.menu1.mapper.Menu1Mapper;
import kr.co.sqn.www.menu1.service.Menu1Service;
import kr.co.sqn.www.menu1.vo.Menu1DefaultVO;
import kr.co.sqn.www.menu1.vo.Menu1VO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("menu1Service")
public class Menu1ServiceImpl extends EgovAbstractServiceImpl implements Menu1Service {

	private static final Logger LOGGER = LoggerFactory.getLogger(Menu1ServiceImpl.class);

	@Autowired Menu1Mapper menu1DAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 Menu1VO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertSample(Menu1VO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		menu1DAO.insertSample(vo);
		return id;
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 Menu1VO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateSample(Menu1VO vo) throws Exception {
		menu1DAO.updateSample(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 Menu1VO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deleteSample(Menu1VO vo) throws Exception {
		menu1DAO.deleteSample(vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 Menu1VO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public Menu1VO selectSample(Menu1VO vo) throws Exception {
		Menu1VO resultVO = menu1DAO.selectSample(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectSampleList(Menu1DefaultVO searchVO) throws Exception {
		return menu1DAO.selectSampleList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectSampleListTotCnt(Menu1DefaultVO searchVO) {
		return menu1DAO.selectSampleListTotCnt(searchVO);
	}

}
