package Dto;


public class BikeDto {
	String BIKENUM;
	String ABLE;
	int RNUM;
	String RNAME;
	
	public BikeDto() {
		
	}
	
	public BikeDto(String BIKENUM, String ABLE, int RNUM, String RNAME) {
		this.BIKENUM = BIKENUM;
		this.ABLE = ABLE;
		this.RNUM = RNUM;
		this.RNAME = RNAME;
	}

	public String getBIKENUM() {
		return BIKENUM;
	}

	public void setBIKENUM(String bIKENUM) {
		BIKENUM = bIKENUM;
	}

	public String getABLE() {
		return ABLE;
	}

	public void setABLE(String aBLE) {
		ABLE = aBLE;
	}

	public int getRNUM() {
		return RNUM;
	}

	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}

	public String getRNAME() {
		return RNAME;
	}

	public void setRNAME(String rNAME) {
		RNAME = rNAME;
	}
	
	
	
}
