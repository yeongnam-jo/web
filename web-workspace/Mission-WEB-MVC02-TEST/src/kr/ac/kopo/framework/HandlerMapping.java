package kr.ac.kopo.framework;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.framework.annotaion.RequestMapping;

/*
 	key		: 요청 uri
 	value	: controller + method 
 		==> MVC01에서는 controller만 썼었다.
 		==> 지금은 하나의 컨트롤러에서 여러 메소드를 사용하기 때문에 어떤 메소드를 쓸건지도 적어줘야 함.
 		
 	"/board/list.do" ==> new BoardController() + list()
 	
 	
 */
public class HandlerMapping {
	
	//Map<String, Controller>
	private Map<String, CtrlAndMethod> mappings;
	
	public HandlerMapping(String ctrlNames) throws Exception{
		
		/*
	 		kr.ac.kopo.board.controller.BoardController
	 		|kr.ac.kopo.login.controller.LoginController
		 */
		
		mappings = new HashMap<>();
		String[] ctrls = ctrlNames.split("\\|"); // 그냥 | 하면 제대로 안됨..ㅠㅠ
		for(String ctrl : ctrls) {
			//System.out.println(ctrl);
			Class<?> clz = Class.forName(ctrl.trim());
			Object target = clz.newInstance();
			Method[] methods = clz.getMethods();
			for(Method method : methods) {
				//System.out.println(method);
				RequestMapping reqAnno = method.getAnnotation(RequestMapping.class);
				//System.out.println("reqAnno : " + reqAnno);
				
				if(reqAnno != null) {
					String uri = reqAnno.value();
					//System.out.println("uri : " + uri);
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
