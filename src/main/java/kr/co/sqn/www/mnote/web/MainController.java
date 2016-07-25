package kr.co.sqn.www.mnote.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import kr.co.sqn.www.common.CustomMessageSource;
import kr.co.sqn.www.gate.vo.LoginVO;
import kr.co.sqn.www.mnote.service.HomeService;
import kr.co.sqn.www.mnote.service.MainService;
import kr.co.sqn.www.mnote.vo.GroupVO;
import kr.co.sqn.www.mnote.vo.HomeVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;

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
@RequestMapping("/note")
public class MainController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="cstmMessageSource")
	CustomMessageSource messageSource ;
	
	/** PropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name="homeService")
	protected HomeService homeService;
	
	@Resource(name="mainService")
	protected MainService mainService;
	
	
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("groupVO") GroupVO groupVO, ModelMap model, LoginVO loginVO) throws Exception {
		
		HomeVO homeVO = new HomeVO(); 
		homeVO.setGrp_typ("02");
		homeVO.setParent_id(groupVO.getGrp_id_01());
		
		List<?> list = homeService.selectHomeList(homeVO);
		model.addAttribute("list_left", list);
		
		//뒤로가기표기를 위함
		model.addAttribute("grp_id_01", groupVO.getGrp_id_01());
		model.addAttribute("grp_id_02", groupVO.getGrp_id_02());
		
		//초기페이지일 경우 2뎁스의 맨 위 부서 그룹 아이디 가져옴
		if((groupVO.getGrp_id_02() == null || (groupVO.getGrp_id_02().equals(""))) && (list.size() > 0))
			model.addAttribute("grp_id_02", ((HomeVO)list.get(0)).getGrp_id());

		GroupVO gg = mainService.selectGroupDetail(groupVO);
		
		model.addAttribute("grp_gubun", groupVO.getGrp_gubun());
		model.addAttribute("grp_nm", gg.getGrp_nm());
		
		return "/note/main";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mainGroupPersonList.do")
	public String mainGroupPersonList(@ModelAttribute("groupVO") GroupVO groupVO, ModelMap model, LoginVO loginVO) throws Exception {
		
		groupVO.setUser_id(loginVO.getUser_id());
		
		List<GroupVO> list_group = (List<GroupVO>) mainService.selectGroupList(groupVO);

		//사람 리스트 - 그룹아이디로 사람리스트 받아옴
		String[] grp_ids = new String[list_group.size()+1];
		grp_ids[0] = groupVO.getGrp_id_02();
		for(int i = 0; i < list_group.size(); i++){
			grp_ids[i+1] = list_group.get(i).getGrp_id();
		}
		groupVO.setGrp_ids(grp_ids);
		List<GroupVO> list_person = (List<GroupVO>) mainService.selectPersonList(groupVO);
		
		
		//그룹과 사람 리스트를 합침
		List<GroupVO> list = new ArrayList<GroupVO>();
		
		//2뎁스 사람리스트
		for(int i = 0; i < list_person.size(); i++){
			if(groupVO.getGrp_id_02().equals(list_person.get(i).getGrp_id())){
				list.add(list_person.get(i));
			}
		}
		
		//그룹리스트에 사람리스트 삽입
		GroupVO tempGroup = null;
		GroupVO tempPerson = null;
		List<GroupVO> list_group_re = new ArrayList<GroupVO>();
		List<GroupVO> list_person_re = null;
		
		for(int j = 0; j < list_group.size(); j++){
			
			tempGroup = list_group.get(j);
			list_person_re = new ArrayList<GroupVO>();
			
			for(int i = 0; i < list_person.size(); i++){
				tempPerson = list_person.get(i);
				if(tempGroup.getGrp_id().equals(tempPerson.getGrp_id())){
					list_person_re.add(tempPerson);
				}
			}
			tempGroup.setPlist(list_person_re);
			list_group_re.add(tempGroup);
		}
		
		//그룹리스트
		list.addAll(list_group_re);
		model.addAttribute("list", list);
		model.addAttribute("grp_id_02", groupVO.getGrp_id_02());
		model.addAttribute("grp_gubun", groupVO.getGrp_gubun());
		
		return "/note/main_1";
	}
}
