package Dto;

public class MapDto {
	String REGION;
	String RNUM;
	String RNAME;
	String STAND;
	String LAT;
	String LNG;
	
	public MapDto() {
	}
	
	public MapDto(String REGION, String RNUM, String RNAME, String STAND, String LAT, String LNG) {
		this.REGION = REGION;
		this.RNUM = RNUM;
		this.RNAME = RNAME;
		this.STAND = STAND;
		this.LAT = LAT;
		this.LNG = LNG;
	}

	public String getREGION() {
		return REGION;
	}

	public void setREGION(String rEGION) {
		REGION = rEGION;
	}

	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}

	public String getRNAME() {
		return RNAME;
	}

	public void setRNAME(String rNAME) {
		RNAME = rNAME;
	}

	public String getSTAND() {
		return STAND;
	}

	public void setSTAND(String sTAND) {
		STAND = sTAND;
	}

	public String getLAT() {
		return LAT;
	}

	public void setLAT(String lAT) {
		LAT = lAT;
	}

	public String getLNG() {
		return LNG;
	}

	public void setLNG(String lNG) {
		LNG = lNG;
	}

	
	
	
}
