package model;

public class MemberDTO {
	private String mem_id;
	private String mem_password;
	private String name;
	private String email;
	private String reg_date;
	
	public MemberDTO() {

	}

	public MemberDTO(String mem_id, String mem_password, String name, String email, String reg_date) {
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.name = name;
		this.email = email;
		this.reg_date = reg_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_password=" + mem_password + ", name=" + name + ", email=" + email
				+ ", reg_date=" + reg_date + "]";
	}

	
	
	
}
