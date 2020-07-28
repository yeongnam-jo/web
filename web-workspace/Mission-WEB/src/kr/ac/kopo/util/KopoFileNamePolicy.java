package kr.ac.kopo.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class KopoFileNamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		String name = f.getName();
		String ext = "";
		int dot = name.lastIndexOf("."); // 입력값이 문자열에 없을 때의 리턴 값은 -1이다.
		if (dot != -1) { 
			ext = name.substring(dot); 
		} else {
			ext = "";
		}
		String str = "kopo" + UUID.randomUUID(); // UUID를 통해 유일한 식별자를 생성할 수 있음.
		
		// getParent() ==>  부모 경로에 대한 경로명을 문자열로 넘겨준다.
		File renameFile = new File(f.getParent(), str + ext);  // 부모 경로에 '유일한식별자.파일확장자' file 생성
		
		return renameFile; // file을 반환한다.
	}
}
