package model;



public class adminDTO {
	private String admin_id;
	private String admin_pw;
	
	private adminDTO() {

	}

	private adminDTO(String admin_id, String admin_pw) {
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	@Override
	public String toString() {
		return "adminDTO [admin_id=" + admin_id + ", admin_pw=" + admin_pw + "]";
	}
	
	
	
}
