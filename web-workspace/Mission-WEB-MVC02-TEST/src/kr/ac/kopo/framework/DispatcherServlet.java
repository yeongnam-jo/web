package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */

//web.xml에서 설정했던 매핑 정보(*.do)를 annotation을 활용해서 쉽게만들 수 있다. 
//서블릿을 생성할 때 Url mappings와 Initialization을 설정하면 아래의 형태가 나타남.
//Url mappings에 설정하면, 아래에 urlPatterns 내에 값이 들어간다.
//Initialization parameters에 name과 value를 설정하면, 아래에 initParams 내에 값에 들어간다. 그런데 value는 문자열이므로, '|'로 구분하여 여러 컨트롤러를 붙인다.
//	==> HandlerMapping.java에서 split 하여 활용한다.
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "controllers",  
							  value = "kr.ac.kopo.board.controller.BoardController"
							  		+ "|kr.ac.kopo.member.controller.MemberController")
		})

//서블릿 파일 생성 시, 어떤 메소드를 생성할건지 묻는다. init, service 메소드를 누르면 아래에 두 개의 메소드가 자동으로 생긴다.
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 핸들러매핑 역할을 할 객체를 만든다.
	private HandlerMapping mappings;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException { //ServletConfig라는 객체는 서블릿당 하나만 생성된다. 이를 통해 어떤 설정을 할 수 있음.
		// web.xml 내의 설정값에 접근할 수 있는 변수가 config이다.
		// web.xml과 같은 역할을 하는 @WebServlet() 내에 있는 initParams에 접근할 수 있다.
		String ctrlNames = config.getInitParameter("controllers"); //ctrlNames : 컨트롤러 이름. '|'로 이어붙어져 있는 문자열이다.
		System.out.println("ctrlNames : " + ctrlNames);
		try {
			mappings = new HandlerMapping(ctrlNames); //핸들러매핑 객체를 생성하자. 컨트롤러 이름을 인자로 넘기면, 저기서 알아서 만들어 준다.
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		uri = uri.substring(request.getContextPath().length());
		System.out.println("uri : " + uri);
		
		// System.out.println("mappings.getCtrlAndMethod(\"/board/list.do\") ==> " + mappings.getCtrlAndMethod("/board/list.do"));
		// System.out.println("mappings.getCtrlAndMethod(\"/login.do\") ==> " + mappings.getCtrlAndMethod("/login.do"));
	
		CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
		
		try {
			if(cam == null) {
				throw new Exception("요청 URL은 존재하지 않습니다.");
			}
			
			Object target = cam.getTarget(); // 클래스
			Method method = cam.getMethod(); // 메소드
			
			ModelAndView mav = (ModelAndView) method.invoke(target, request, response); 
			
			//String view = (String) method.invoke(target, request, response); 
			// 메소드를 실행하는 메소드 : invoke(해매개변수 3개가 온다). jsp 경로를 view에 저장
			// 각 컨트롤러의 메소드는 request, response를 인자로 사용하고 jsp 경로를 return 하기 때문에 위와같은 형태가 된다.
			
			String view = mav.getView();
			
			// request 공유영역에 객체 등록
			Map<String, Object> model = mav.getModel();
			// 여러개의 객체를 등록할 수 있으므로 for 반복문을 돈다. 이전에는 request.setAttribute("boardList", list) 등으로 
			// 각 컨트롤러에서 하나만 등록했었는데, 여러개 등록하는 일이 생기나보다.
			// 그리고, 객체를 Object 타입으로 한 이유는, 모든 클래스는 Object를 상속받기 때문인가보다. 
			// String도 Object로 받을 수 있으니까? 이렇게 한 듯!
			Set<String> keys = model.keySet(); // 맵의 key를 모두 뽑아내는 메소드 : keySet()
			for(String key : keys) {
				Object value = model.get(key);
				request.setAttribute(key, value);
			}
			
			// 응답(sendRedirect or forward)
			if(view.startsWith("redirect:")) { 
				// redirect 하는 이유는 : 굳이 jsp를 거치지 않고 바로 servlet이 응답해야 하는 경우
				// 이 경우에는 비밀번호 틀렸을 때 다른 jsp 로보내지 않고, alert창 띄우고 바로 login 서블릿으로 보내기 위해서다.
				view = view.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + view);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view); // forward 절차.
				dispatcher.forward(request, response);
			}
			
			
		} catch(Exception e) {
			response.setContentType("text/plain; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());
			// 추후 에러메세지 화면 따로 구성.
		}
		
	}

}
