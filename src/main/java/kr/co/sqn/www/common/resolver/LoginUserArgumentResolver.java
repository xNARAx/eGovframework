package kr.co.sqn.www.common.resolver;

import kr.co.sqn.www.gate.vo.LoginVO;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class LoginUserArgumentResolver implements HandlerMethodArgumentResolver {

	
	/**
	 * argument resolve (login user)
	 * 
	 * @since 1.0.0
	 */
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		LoginVO loginVO = null;
		
		if (RequestContextHolder.getRequestAttributes() != null) {
			if (RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION) != null) {
				loginVO = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
			}
		}else{
			loginVO = new LoginVO();
		}
		
		return loginVO;
	}

	/**
	 * parameter support
	 * 
	 * @since 1.0.0
	 */
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		if(LoginVO.class.isAssignableFrom(parameter.getParameterType())) {
			return true;
		}
		else {
			return false;
		}
	}


}
