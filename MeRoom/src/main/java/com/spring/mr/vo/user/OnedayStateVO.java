package com.spring.mr.vo.user;

public class OnedayStateVO {
	private String orIdx; // 예약번호
	private int oIdx; // 클래스번호
	private String orDate; // 예약 날짜
	private String orTime; // 예약 시간
	private int orCount; // 수량
	private String opIdx; // 결제번호
	private int opMoney; // 결제금액
	private String opDate; // 결제날짜
	private String opMethod; // 결제 방법
	private int opPoint; // 적립금
	private int orfIdx; // 환불번호
	private int orfMoney; // 환불금액
	private String orfDate; // 취소 날짜
	private String oCategory; // 카테고리
	private String oName; // 클래스명
	private String oDate; // 수강날짜
	private String oTime; // 수강시간
	private String oLocation; // 수강장소
	private int oPrice; // 수강가격
	private int oCnt; // 수강인원
	private String oImg; // 이미지
	public String getOrIdx() {
		return orIdx;
	}
	public void setOrIdx(String orIdx) {
		this.orIdx = orIdx;
	}
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public String getOrDate() {
		return orDate;
	}
	public void setOrDate(String orDate) {
		this.orDate = orDate;
	}
	public String getOrTime() {
		return orTime;
	}
	public void setOrTime(String orTime) {
		this.orTime = orTime;
	}
	public int getOrCount() {
		return orCount;
	}
	public void setOrCount(int orCount) {
		this.orCount = orCount;
	}
	public String getOpIdx() {
		return opIdx;
	}
	public void setOpIdx(String opIdx) {
		this.opIdx = opIdx;
	}
	public int getOpMoney() {
		return opMoney;
	}
	public void setOpMoney(int opMoney) {
		this.opMoney = opMoney;
	}
	public String getOpDate() {
		return opDate;
	}
	public void setOpDate(String opDate) {
		this.opDate = opDate;
	}
	public String getOpMethod() {
		return opMethod;
	}
	public void setOpMethod(String opMethod) {
		this.opMethod = opMethod;
	}
	public int getOpPoint() {
		return opPoint;
	}
	public void setOpPoint(int opPoint) {
		this.opPoint = opPoint;
	}
	public int getOrfIdx() {
		return orfIdx;
	}
	public void setOrfIdx(int orfIdx) {
		this.orfIdx = orfIdx;
	}
	public int getOrfMoney() {
		return orfMoney;
	}
	public void setOrfMoney(int orfMoney) {
		this.orfMoney = orfMoney;
	}
	public String getOrfDate() {
		return orfDate;
	}
	public void setOrfDate(String orfDate) {
		this.orfDate = orfDate;
	}
	public String getoCategory() {
		return oCategory;
	}
	public void setoCategory(String oCategory) {
		this.oCategory = oCategory;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getoTime() {
		return oTime;
	}
	public void setoTime(String oTime) {
		this.oTime = oTime;
	}
	public String getoLocation() {
		return oLocation;
	}
	public void setoLocation(String oLocation) {
		this.oLocation = oLocation;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public int getoCnt() {
		return oCnt;
	}
	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}
	public String getoImg() {
		return oImg;
	}
	public void setoImg(String oImg) {
		this.oImg = oImg;
	}
	@Override
	public String toString() {
		return "OnedayStateVO [orIdx=" + orIdx + ", oIdx=" + oIdx + ", orDate=" + orDate + ", orTime=" + orTime
				+ ", orCount=" + orCount + ", opIdx=" + opIdx + ", opMoney=" + opMoney + ", opDate=" + opDate
				+ ", opMethod=" + opMethod + ", opPoint=" + opPoint + ", orfIdx=" + orfIdx + ", orfMoney=" + orfMoney
				+ ", orfDate=" + orfDate + ", oCategory=" + oCategory + ", oName=" + oName + ", oDate=" + oDate
				+ ", oTime=" + oTime + ", oLocation=" + oLocation + ", oPrice=" + oPrice + ", oCnt=" + oCnt + ", oImg="
				+ oImg + "]";
	}
	

	
	

}
