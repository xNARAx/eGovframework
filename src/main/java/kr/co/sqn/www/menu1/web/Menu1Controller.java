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
package kr.co.sqn.www.menu1.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.sqn.www.common.CustomMessageSource;
import kr.co.sqn.www.menu1.service.Menu1Service;
import kr.co.sqn.www.menu1.vo.Menu1DefaultVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : SampleController.java
 * @Description : Sample Controller Class
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
public class Menu1Controller {

	@Resource(name="cstmMessageSource")
	CustomMessageSource messageSource ;
	
	/** SampleService */
	@Resource(name = "menu1Service")
	private Menu1Service menu1Service;

	/** PropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/menu1.do")
	public String selectSampleList(@ModelAttribute("searchVO") Menu1DefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println(">>>>" + messageSource.getMessage("button.list"));
		System.out.println(">>>>" + propertiesService.getString("test.propertie"));
		System.out.println(">>>>");
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = menu1Service.selectSampleList(searchVO);
		model.addAttribute("resultList", sampleList);

		int totCnt = menu1Service.selectSampleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/menu1/menu1_list";
	}

	
	
    @RequestMapping(value = "/sampleView.json")
    public String selectSampleView(ModelMap model) throws Exception {
        
        return "/menu1/sapme_json";
    }
    
    @RequestMapping(value = "/sampleJson.json")
    public @ResponseBody JsonResult selectSampleJson(ModelMap model) throws Exception {

        Map resultMap = new HashMap();
        resultMap.put("list", 1);
        
        JsonResult jo = new JsonResult();
        jo.setResultMsg("성공");
        jo.setData(resultMap);
        
        return jo;
    }
    
    public class JsonResult {
    	String resultCode = "0000";
    	String resultMsg = "Success";
    	Object data;
    	
		public String getResultCode() {
			return resultCode;
		}
		public void setResultCode(String resultCode) {
			this.resultCode = resultCode;
		}
		public String getResultMsg() {
			return resultMsg;
		}
		public void setResultMsg(String resultMsg) {
			this.resultMsg = resultMsg;
		}
		public Object getData() {
			return data;
		}
		public void setData(Object data) {
			this.data = data;
		}
    }
}
