package kr.ac.kopo.member;

public class MemberVO {
	private String id;
	private String password;
	
	
	public MemberVO() {
	}
	
	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
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
	
	
}
