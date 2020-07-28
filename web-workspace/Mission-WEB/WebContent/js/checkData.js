/**
 * form 관련 기능 파일...
 */


function isNull(obj, msg){
	if(obj.value ==''){
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}