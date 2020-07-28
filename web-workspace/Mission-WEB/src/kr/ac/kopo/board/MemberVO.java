package kr.ac.kopo.board;

public class MemberVO {

	private String name;
	private String id;
	private String password;
	private String email;
	private String domain;
	private String tel1;
	private String tel2;
	private String tel3;
	private String post;
	private String addr1;
	private String addr2;
	private String type;
	private String reg_date;
	
	
	public MemberVO() {
	}
	
	
	public MemberVO(String name, String id, String password, String email, String domain, String tel1, String tel2,
			String tel3, String post, String addr1, String addr2, String type, String reg_date) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.domain = domain;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.type = type;
		this.reg_date = reg_date;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}




	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}




	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}




	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}




	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}




	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}




	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}




	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}




	/**
	 * @return the domain
	 */
	public String getDomain() {
		return domain;
	}




	/**
	 * @param domain the domain to set
	 */
	public void setDomain(String domain) {
		this.domain = domain;
	}




	/**
	 * @return the tel1
	 */
	public String getTel1() {
		return tel1;
	}




	/**
	 * @param tel1 the tel1 to set
	 */
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}




	/**
	 * @return the tel2
	 */
	public String getTel2() {
		return tel2;
	}




	/**
	 * @param tel2 the tel2 to set
	 */
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}




	/**
	 * @return the tel3
	 */
	public String getTel3() {
		return tel3;
	}




	/**
	 * @param tel3 the tel3 to set
	 */
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}




	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}




	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}




	/**
	 * @return the addr1
	 */
	public String getAddr1() {
		return addr1;
	}




	/**
	 * @param addr1 the addr1 to set
	 */
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}




	/**
	 * @return the addr2
	 */
	public String getAddr2() {
		return addr2;
	}




	/**
	 * @param addr2 the addr2 to set
	 */
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}




	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}




	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}




	/**
	 * @return the reg_date
	 */
	public String getReg_date() {
		return reg_date;
	}




	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return super.toString();
	}



	
	
	
	
	
}
