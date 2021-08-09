package kr.co.sinsa.admin.vo;

public class AdminVO {
	private String ADID;
	private String ADPW;
	private String ADNAME;
	public String getADID() {
		return ADID;
	}
	public void setADID(String aDID) {
		ADID = aDID;
	}
	public String getADPW() {
		return ADPW;
	}
	public void setADPW(String aDPW) {
		ADPW = aDPW;
	}
	public String getADNAME() {
		return ADNAME;
	}
	public void setADNAME(String aDNAME) {
		ADNAME = aDNAME;
	}
	@Override
	public String toString() {
		return "AdminVO [ADID=" + ADID + ", ADPW=" + ADPW + ", ADNAME=" + ADNAME + "]";
	}
	
	
	

}
