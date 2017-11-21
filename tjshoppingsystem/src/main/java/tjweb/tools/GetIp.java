package tjweb.tools;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;

public class GetIp {
	public static String getIp(HttpServletRequest request)throws Exception{
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtils.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtils.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			}else {
				return ip;
			}
		}else {
			return request.getRemoteAddr();
		}
	}
}
