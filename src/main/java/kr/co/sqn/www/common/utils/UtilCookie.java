package kr.co.sqn.www.common.utils;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * <h3>CookieBox</h3>
 *
 * <pre>
 * 	<b> </b>
 * </pre>
 *
 * @author <a href="http://www.squarenet.co.kr">Squarenet Co., Ltd</a>
 * @author <a href="mailto:itnpeople@naver.com">조은상</a>
 * @since	1.0.0
 *
 * <pre>
 * <b>History</b>
 * 1.0.0	2013. 9. 26.	조은상	Initial Version
 * </pre>
 */
public  class UtilCookie extends HashMap<String,String> {
	
	private static final Logger logger = LoggerFactory.getLogger(UtilCookie.class);
	private static final long serialVersionUID = 3539698319684581209L;
	
	/**
	 * 생성자
	 * 
	 */
	public UtilCookie(HttpServletRequest request) {
		
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
        	
            for (int i = 0 ; i < cookies.length ; i++) {
            	
            	// 삭제 예정인 쿠키는 제외
            	//	- MaxAge=0 인 경우는 삭제 되었지만 실제 쿠키값에서는 읽기는 경우임
            	//	- 즉 삭제 예정인 쿠키임
            	logger.info("--" + cookies[i].getName() + " -- -- " + cookies[i].getValue());
            	if(cookies[i].getMaxAge() != 0) put(cookies[i].getName(), cookies[i].getValue());
            }
        }
    }
	
	
	
	
	/**
	 * 쿠키 제거
	 *
	 * @since 1.0.0
	 */
	public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {
	
		deleteCookie(request,response, cookieName, "/");
	}
	
	
	/** 
	 * 쿠키 제거
	 *
	 * @since 1.0.0
	 */
	public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String cookiePath) {
		logger.info("CookieBox.deleteCookie !!");
		Cookie[] cookies = request.getCookies();
		
		if ( cookies != null ) {
			for ( Cookie c : cookies ) {
				if ( cookieName.equals(c.getName()) ) {
					c.setMaxAge(0);
					c.setPath(cookiePath);
					c.setValue("");
					response.addCookie(c);
					break;
				}
			}
		}
	}
	
	/**
	 * 쿠키 지정
	 *		- 만료일(Expire) 은  default = "-1", 웹 브라우저 인스턴스 유지 시까지
	 *		- Path 는  default = "/"
	 *
	 * @since 1.0.0
	 */
	public static void setCookie(HttpServletResponse response, String cookieName, String cookieValue) {
		
		setCookie(response, cookieName,cookieValue,-1);
		
	}
	
	/**
	 * 쿠키 지정
	 *		- Path 는  default = "/"
	 * 
	 * @since 1.0.0
	 */
	public static void setCookie(HttpServletResponse response, String cookieName, String cookieValue, int cookieExpire) {
		
		setCookie(response, cookieName,cookieValue,"/",cookieExpire);
		
	}
	
	/**
	 * 쿠키 지정
	 *
	 * @since 1.0.0
	 */
	public static void setCookie(HttpServletResponse response, String cookieName, String cookieValue, String cookiePath, int cookieExpire) {
		
		Cookie cookie = new Cookie(cookieName, cookieValue);
		cookie.setMaxAge(cookieExpire);
		cookie.setPath(cookiePath);
		
		response.addCookie(cookie);
		
	}
	

}
