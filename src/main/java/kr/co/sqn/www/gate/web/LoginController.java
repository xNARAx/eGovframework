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
package kr.co.sqn.www.gate.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.sqn.www.common.CustomMessageSource;
import kr.co.sqn.www.gate.service.LoginService;
import kr.co.sqn.www.gate.vo.LoginVO;
import kr.co.sqn.www.gate.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : LoginController.java
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
@RequestMapping("/gate/login")
public class LoginController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="cstmMessageSource")
	CustomMessageSource messageSource ;
	
	/** Validator */	
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name = "loginService")
	protected LoginService loginService;
	
	
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		return "/login";
	}
	
	@RequestMapping(value = "/actionLogin.do")
	public String actionLogin(@ModelAttribute("UserVO") UserVO userVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		// TODO : 로그인한 정보가 맞는지 처리 필요.
		UserVO resultVO = new UserVO(); //loginService.selectUserDetail(userVO);
		
        if (resultVO != null && resultVO.getUser_id() != null && !resultVO.getUser_id().equals("")) {
        	
        	LoginVO loginVO = new LoginVO();
			loginVO.setUser_id(resultVO.getUser_id());
			loginVO.setUser_nm(resultVO.getUser_nm());
			loginVO.setGrp_gubun(resultVO.getGrp_gubun());
			loginVO.setStore_id(resultVO.getStore_id());

        	// 2-1. 로그인 정보를 세션에 저장
        	request.getSession().setAttribute("loginVO", loginVO);

    		return "redirect:/note/home.do";

        } else {
        	model.addAttribute("message", messageSource.getMessage("fail.common.login"));
        	return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
        }
	}
}
