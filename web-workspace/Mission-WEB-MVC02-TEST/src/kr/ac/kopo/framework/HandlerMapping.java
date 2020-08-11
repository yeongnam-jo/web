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
			Class<?> clz = Class.forName(ctrl.trim()); // split 해도 완벽하게 분할되지 않나봄. trim을 해야 함. 이러면 class가 로딩된다.
			Object target = clz.newInstance(); //clz 클래스로 객체를 생성한다. Object 타입으로 만듦. 반환값이 Object라서 그렇다.
			
			Method[] methods = clz.getMethods(); // 해당 객체 내에 있는 모든 메소드를 가져올 수 있다. 부모 클래스의 메소드까지 다 가져옵니다. 메소드 형의 methods 변수를 만든다.
			for(Method method : methods) { // 모든 메소드로 반복문이 돈다.
				//System.out.println(method);
				RequestMapping reqAnno = method.getAnnotation(RequestMapping.class); //requestmapping 어노테이션이 없으면 null이 반환됨. 어노테이션이 있으면 어노테이션의 주소값이 나올 것임(?)
				
				// System.out.println("reqAnno : " + reqAnno);
				
				if(reqAnno != null) {
					String uri = reqAnno.value(); // 해당 어노테이션의 value 
					//System.out.println("uri : " + uri);
					CtrlAndMethod cam = new CtrlAndMethod(target, method); // 컨트롤러, 메소드
					
					mappings.put(uri, cam);
					
				}
			}
		}
 	}
	
	public CtrlAndMethod getCtrlAndMethod(String uri) {
		return mappings.get(uri);
	}

}
