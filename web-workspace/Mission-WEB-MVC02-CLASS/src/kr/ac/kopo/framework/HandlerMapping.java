package kr.ac.kopo.framework;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.framework.annotation.RequestMapping;

/*
 		key		: 요청 uri
 		value	: controller + method
 		
 		"/board/list.do" ==> new BoardController() + list()
 */
public class HandlerMapping {
	
	private Map<String, CtrlAndMethod> mappings;
	
	public HandlerMapping(String ctrlNames) throws Exception {
		/*
		 	kr.ac.kopo.board.controller.BoardController
  			|kr.ac.kopo.login.controller.LoginController
		 */
		mappings = new HashMap<>();
		
		String[] ctrls = ctrlNames.split("\\|");
		for(String ctrl : ctrls) {
//			System.out.println(ctrl);
			
			Class<?> clz = Class.forName(ctrl.trim());
			Object target = clz.newInstance();
			Method[] methods = clz.getMethods();
			for(Method method : methods) {
//				System.out.println(method);
				RequestMapping reqAnno = method.getAnnotation(RequestMapping.class);
//				System.out.println("reqAnno : " + reqAnno);
				
				if(reqAnno != null) {
					String uri = reqAnno.value();
//					System.out.println("uri : " + uri);
					CtrlAndMethod cam = new CtrlAndMethod(target, method);
					
					mappings.put(uri, cam);
				}
			}
		}
	}
	
	public CtrlAndMethod getCtrlAndMethod(String uri) {
		return mappings.get(uri);
	}
}












