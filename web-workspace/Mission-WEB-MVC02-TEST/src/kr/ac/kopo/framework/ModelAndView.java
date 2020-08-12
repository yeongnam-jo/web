package kr.ac.kopo.framework;

import java.util.HashMap;
import java.util.Map;

/*
 	Model: JSP에서 사용할 데이터 저장 객체(request 공유영역에 등록)
 	View : 포워드시킬 JSP 주소 or 리다이렉트시킬 가상 주소 정보를 저장하는 목적
 */

public class ModelAndView {
	
	private String view;
	private Map<String, Object> model;
	
	public ModelAndView() {
		model = new HashMap<>();
	}

	public ModelAndView(String view) {
		this(); //model 객체를 생성하기 위해서. 위의 new HashMap<>();
		this.view = view;
	}
	
	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public Map<String, Object> getModel() {
		return model;
	}

	public void setModel(Map<String, Object> model) {
		this.model = model;
	}

	public void addAttribute(String key, Object value) {
		model.put(key, value);
	}
	
}
