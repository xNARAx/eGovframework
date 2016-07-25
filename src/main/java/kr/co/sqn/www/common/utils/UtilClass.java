package kr.co.sqn.www.common.utils;


import java.text.DecimalFormat;
import java.util.UUID;


/**
 * <pre>
 * squarenet.smartq.common
 * StaticClass.java
 * </pre>
 * @author	:	ckh
 * @Date	:	2012. 10. 24.
 * @Version	:	JDK 1.6.0
 * @Description	:	서버상에서 바로 사용 할 수 있는 값
 */
public class UtilClass {
	
	/**
	 * <pre>
	 * 처리내용 : UUID 생성
	 * </pre>
	 * @Date	:	2013. 3. 7.	
	 * @Return	:	String
	 */
	public static String createUUID() {
		return UUID.randomUUID().toString();
	}
	
	
	/**
	 * <pre>
	 * 처리내용 : 바이트로 문자 자르기
	 * </pre>
	 * @Date	:	2013. 4. 1.	
	 * @Return	:	String
	 */
	public static String cutFirstStrInByte(String str, int endIndex, boolean point)
	{
		StringBuffer sbStr = new StringBuffer(endIndex);
		int iTotal=0;
		String lastStr = "";
		for(char c: str.toCharArray())
		{
			iTotal+=String.valueOf(c).getBytes().length;
			if(iTotal>endIndex){
				if(point)
					lastStr = "..";
				break;
			}	
			sbStr.append(c);
		}
		return sbStr.toString() + lastStr;
	}
	
	
	/**
	 * String UnEscape 처리
	 * 
	 * @param src
	 * @return
	 */
	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src
							.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src
							.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}

	/**
	 * String Escape 처리
	 * @param src
	 * @return
	 */
	public static String escape(String src) {
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length() * 6);
		for (i = 0; i < src.length(); i++) {
			j = src.charAt(i);
			if (Character.isDigit(j) || Character.isLowerCase(j)
					|| Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}
	
	/**
	 * <pre>
	 * 처리내용 : 금액표시
	 * </pre>
	 * @Date	:	2013. 10. 16.	
	 * @Return	:	String
	 */
	public static String setDecimalFormat(String str)
	{
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(Double.parseDouble(str));
	}
	
	
	/**
	 * <pre>
	 * 처리내용 : 요일변환
	 * </pre>
	 * @Date	:	2013. 10. 16.	
	 * @Return	:	String
	 */
	public static String setWeekDayChange(Object obj)
	{
		String rtn="";
		if(obj!=null){
			rtn = obj.toString().toLowerCase().replaceAll("mo", "월").replaceAll("tu", "화").replaceAll("we", "수").replaceAll("th", "목").replaceAll("fr", "금").replaceAll("sa", "토").replaceAll("su", "일");
		}
		
		return rtn;
	}
}
