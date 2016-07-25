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
package kr.co.sqn.www.mnote.web;

import java.util.List;

import javax.annotation.Resource;

import kr.co.sqn.www.common.CustomMessageSource;
import kr.co.sqn.www.gate.vo.LoginVO;
import kr.co.sqn.www.mnote.service.HomeService;
import kr.co.sqn.www.mnote.vo.HomeVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : HomeController.java
 * @Description : Controller Class
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

@Controller
@RequestMapping("/note")
public class HomeController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="cstmMessageSource")
	CustomMessageSource messageSource ;
	
	/** PropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name = "homeService")
	protected HomeService homeService;
	
	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/home.do")
	public String home(@ModelAttribute("homeVO") HomeVO homeVO, ModelMap model, LoginVO loginVO) throws Exception {
		LOGGER.debug(">>>> {}", loginVO.getUser_id());
		homeVO.setGrp_typ("01");

		List<?> list = homeService.selectHomeList(homeVO);
		model.addAttribute("list", list);
		
		return "/note/home";
	}
}
