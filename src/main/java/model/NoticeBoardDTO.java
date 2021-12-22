package model;

public class NoticeBoardDTO {
	private int num;
	private String username;
	private String title;
	private String memo;
	private int viewCnt;
	private String reg_date;

	public NoticeBoardDTO() {

	}

	public NoticeBoardDTO(int num, String username, String title, String memo, int viewCnt, String reg_date) {
		this.num = num;
		this.username = username;
		this.title = title;
		this.memo = memo;
		this.viewCnt = viewCnt;
		this.reg_date = reg_date;
	}
	
	

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "NoticeBoardDTO [num=" + num + ", username=" + username + ", title=" + title + ", memo=" + memo
				+ ", viewCnt=" + viewCnt + ", reg_date=" + reg_date + "]";
	}

}
