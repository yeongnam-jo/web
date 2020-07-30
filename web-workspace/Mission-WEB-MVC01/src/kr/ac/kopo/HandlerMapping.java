package kr.ac.kopo;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/*
 	핸들러매핑 : uri에 해당하는 Controller 객체를 가지고 있음.
	- FrontControllServlet을 수정할 필요가 없게 됐음.
	- Controller 종류가 늘어나면, HandlerMapping만 수정하면 된다.
	- 그런데, handlerMapping도 수정하고 싶지 않았다. bean.properties 파일에만 간단하게 추가하면 좋겠다고 생각함.
	- reflection 기술을 사용한다. (스프링 등에서도 사용함)
	
 */

public class HandlerMapping {

	// 이런 uri 줄게 해당하는 Controller 내놔
	private Map<String, Controller> mappings = null;

	// bean.properties 경로를 문자열로 저장한 변수가 propLoc
	public HandlerMapping(String propLoc) {

		mappings = new HashMap<String, Controller>(); 
		
		Properties prop = new Properties(); // properties 객체를 사용할 수 있게 해줌
		
		try {
			// bean.properties 경로는 사실 웹서버 경로여야 한다.
			InputStream inStream = new FileInputStream(propLoc); // 스트림 통로만 만들어음.
			prop.load(inStream); // load() 메소드를 통해 properties 데이터를 가져 옴.
			
			//System.out.println(prop.getProperty("/list.do")); // bean.properties에 있는 /list.do에 해당하는 값을 가져옴
			Set<Object> keys = prop.keySet();//keySet() :  key 값만 뽑아내는 메소드다. Map 에도 keySet()있다.
			
			for(Object key : keys) { // set은 순서를 보장하지 않아서 bean.properties에 작성한 순서대로 나오지 않음.
				System.out.println(key);
				
				String className = prop.getProperty(key.toString()); // name에 해당하는 value가져옴
				//System.out.println(className);
				//mappings.put("/list.do", new ListController()); 
				Class<?> clz = Class.forName(className); // clz는 class의 약어
				mappings.put(key.toString(), (Controller)clz.newInstance()); // map 선언 시 (String, Controller) 형태.
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
	
	public static void main(String[] args) throws Exception{
		/*
		java.util.Random r = new java.util.Random();
		int random = r.nextInt(100);
		System.out.println("랜덤한 수는 : " + random + "입니다.");
		*/
		
		
		/*
			위와 같은 기능을 reflection을 통해 구현해보자. // 임포트 방식이 아님. JDBC 할때도 이렇게 했음.
			1. 클래스를 로딩해야 함. 
				Class<?> clz = Class.forName("java.util.Random"); // 물음표는 어떤 타입도 들어올 수 있다는 것 // 
			2. 객체를 만든다.
		  		java.util.Random obj = (java.util.Random) clz.newInstance();
		  		System.out.println(obj.nextInt(100));

		 	예시
				Class<?> clz = Class.forName("kr.ac.kopo.ListController");
				ListController obj = (ListController)clz.newInstance();
				System.out.println(obj);
				System.out.println(obj.handleRequest(null, null));
		 */
		
		
	}


}
