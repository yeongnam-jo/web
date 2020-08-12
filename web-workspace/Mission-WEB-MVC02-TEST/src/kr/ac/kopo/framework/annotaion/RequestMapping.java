package kr.ac.kopo.framework.annotaion;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface RequestMapping { //@RequestMapping 어노테이션에 관한 정보를 설정하는 것 같다. 이 이름은 사용자가 정한 것이다. ReqeustMapping이라고.
	
	String value(); 
	// String name(); ==> 이름은 정하기 나름이다.
	
}

//@RequestMapping("문자열이");

