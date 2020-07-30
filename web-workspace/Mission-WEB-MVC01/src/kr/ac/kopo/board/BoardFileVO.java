package kr.ac.kopo.board;

public class BoardFileVO {
	private int no;
	private int boardNo;
	private String fileOriName;
	private String fileSaveName;
	private int fileSize;
	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}
	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}
	/**
	 * @return the boardNo
	 */
	public int getBoardNo() {
		return boardNo;
	}
	/**
	 * @param boardNo the boardNo to set
	 */
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	/**
	 * @return the fileOriName
	 */
	public String getFileOriName() {
		return fileOriName;
	}
	/**
	 * @param fileOriName the fileOriName to set
	 */
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	/**
	 * @return the fileSaveName
	 */
	public String getFileSaveName() {
		return fileSaveName;
	}
	/**
	 * @param fileSaveName the fileSaveName to set
	 */
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	/**
	 * @return the fileSize
	 */
	public int getFileSize() {
		return fileSize;
	}
	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	
	public BoardFileVO() {
		
	}
	
	public BoardFileVO(int no, int boardNo, String fileOriName, String fileSaveName, int fileSize) {
		super();
		this.no = no;
		this.boardNo = boardNo;
		this.fileOriName = fileOriName;
		this.fileSaveName = fileSaveName;
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "BoardFileVO [no=" + no + ", boardNo=" + boardNo + ", fileOriName=" + fileOriName + ", fileSaveName="
				+ fileSaveName + ", fileSize=" + fileSize + "]";
	}
	
	
	
}
