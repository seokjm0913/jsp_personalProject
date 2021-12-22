package model;

public class BoardInfoDTO {
	private int buyer_no;
	private String detailedConsultationFields;
	private String buyer_country;
	private String buyer_name; 
	private String cmpName; 
	private String cmpName_website;
	private String contact_email; 
	private String content; 
	private String reg_date;
	
	public BoardInfoDTO() {
		
	}

	private BoardInfoDTO(int buyer_no, String detailedConsultationFields, String buyer_country, String buyer_name,
			String cmpName, String cmpName_website, String contact_email, String content, String reg_date) {
		this.buyer_no = buyer_no;
		this.detailedConsultationFields = detailedConsultationFields;
		this.buyer_country = buyer_country;
		this.buyer_name = buyer_name;
		this.cmpName = cmpName;
		this.cmpName_website = cmpName_website;
		this.contact_email = contact_email;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getBuyer_no() {
		return buyer_no;
	}

	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}

	public String getDetailedConsultationFields() {
		return detailedConsultationFields;
	}

	public void setDetailedConsultationFields(String detailedConsultationFields) {
		this.detailedConsultationFields = detailedConsultationFields;
	}

	public String getBuyer_country() {
		return buyer_country;
	}

	public void setBuyer_country(String buyer_country) {
		this.buyer_country = buyer_country;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getCmpName() {
		return cmpName;
	}

	public void setCmpName(String cmpName) {
		this.cmpName = cmpName;
	}

	public String getCmpName_website() {
		return cmpName_website;
	}

	public void setCmpName_website(String cmpName_website) {
		this.cmpName_website = cmpName_website;
	}

	public String getContact_email() {
		return contact_email;
	}

	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BoardInfoDTO [buyer_no=" + buyer_no + ", detailedConsultationFields=" + detailedConsultationFields
				+ ", buyer_country=" + buyer_country + ", buyer_name=" + buyer_name + ", cmpName=" + cmpName
				+ ", cmpName_website=" + cmpName_website + ", contact_email=" + contact_email + ", content=" + content
				+ ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
}
