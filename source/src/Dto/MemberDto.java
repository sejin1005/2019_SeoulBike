package Dto;

public class MemberDto {
	String ID;
	String PWD;
	String PHONE;
	String EMAIL;
	String BIKE_PWD;
	String GENDER;
	
	public MemberDto() {
		
	}
	
	public MemberDto(String ID, String PWD, String PHONE, String EMAIL, String BIKE_PWD, String GENDER) {
		this.ID = ID;
		this.PWD = PWD;
		this.EMAIL = EMAIL;
		this.PHONE = PHONE;
		this.BIKE_PWD = BIKE_PWD;
		this.GENDER = GENDER;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String pWD) {
		PWD = pWD;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getBIKE_PWD() {
		return BIKE_PWD;
	}

	public void setBIKE_PWD(String bIKE_PWD) {
		BIKE_PWD = bIKE_PWD;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}

	

	
	
}
