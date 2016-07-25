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
package kr.co.sqn.www.mnote.vo;

import java.util.List;


/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class GroupVO {

	private static final long serialVersionUID = 1L;

	String grp_id;
	String[] grp_ids;
    String grp_nm;
    String grp_nm_eng;
    String grp_tel;
    String grp_fax;
    String grp_typ;
    String parent_id;
    String sort_no;
    String grp_gubun;

    String grp_id_01;
    String grp_id_02;
    
    String user_id;
    String user_nm;
    String position_nm;
    String assignment_nm;
    String favorite_user_id;
    String favorite_user_yn;
    String tel;
    String cell_tel;
    String email;
    String cell_tel_public_yn;
    String email_public_yn;
    String main_grp_id;
    String image_url;
    
    List<GroupVO> plist;
    
    public String getGrp_id() {
		return grp_id;
	}
	public void setGrp_id(String grp_id) {
		this.grp_id = grp_id;
	}
	public String[] getGrp_ids() {
		return grp_ids;
	}
	public void setGrp_ids(String[] grp_ids) {
		this.grp_ids = grp_ids;
	}
	public String getGrp_nm() {
		return grp_nm;
	}
	public void setGrp_nm(String grp_nm) {
		this.grp_nm = grp_nm;
	}
	public String getGrp_nm_eng() {
		return grp_nm_eng;
	}
	public void setGrp_nm_eng(String grp_nm_eng) {
		this.grp_nm_eng = grp_nm_eng;
	}
	public String getGrp_tel() {
		return grp_tel;
	}
	public void setGrp_tel(String grp_tel) {
		this.grp_tel = grp_tel;
	}
	public String getGrp_fax() {
		return grp_fax;
	}
	public void setGrp_fax(String grp_fax) {
		this.grp_fax = grp_fax;
	}
	public String getGrp_typ() {
		return grp_typ;
	}
	public void setGrp_typ(String grp_typ) {
		this.grp_typ = grp_typ;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getSort_no() {
		return sort_no;
	}
	public void setSort_no(String sort_no) {
		this.sort_no = sort_no;
	}
	
	public String getGrp_gubun() {
		return grp_gubun;
	}
	public void setGrp_gubun(String grp_gubun) {
		this.grp_gubun = grp_gubun;
	}
	
	public String getGrp_id_01() {
		return grp_id_01;
	}
	public void setGrp_id_01(String grp_id_01) {
		this.grp_id_01 = grp_id_01;
	}
	public String getGrp_id_02() {
		return grp_id_02;
	}
	public void setGrp_id_02(String grp_id_02) {
		this.grp_id_02 = grp_id_02;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getPosition_nm() {
		return position_nm;
	}
	public void setPosition_nm(String position_nm) {
		this.position_nm = position_nm;
	}
	public String getAssignment_nm() {
		return assignment_nm;
	}
	public void setAssignment_nm(String assignment_nm) {
		this.assignment_nm = assignment_nm;
	}
	public String getFavorite_user_id() {
		return favorite_user_id;
	}
	public void setFavorite_user_id(String favorite_user_id) {
		this.favorite_user_id = favorite_user_id;
	}
	public String getFavorite_user_yn() {
		return favorite_user_yn;
	}
	public void setFavorite_user_yn(String favorite_user_yn) {
		this.favorite_user_yn = favorite_user_yn;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCell_tel() {
		return cell_tel;
	}
	public void setCell_tel(String cell_tel) {
		this.cell_tel = cell_tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCell_tel_public_yn() {
		return cell_tel_public_yn;
	}
	public void setCell_tel_public_yn(String cell_tel_public_yn) {
		this.cell_tel_public_yn = cell_tel_public_yn;
	}
	public String getEmail_public_yn() {
		return email_public_yn;
	}
	public void setEmail_public_yn(String email_public_yn) {
		this.email_public_yn = email_public_yn;
	}
	public List<GroupVO> getPlist() {
		return plist;
	}
	public void setPlist(List<GroupVO> plist) {
		this.plist = plist;
	}
	public String getMain_grp_id() {
		return main_grp_id;
	}
	public void setMain_grp_id(String main_grp_id) {
		this.main_grp_id = main_grp_id;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
}
