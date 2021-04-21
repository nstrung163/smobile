package com.training.model;

public class ResponseDataModel {
	private int responseCode;
	private String responseMsg;
	private Object data;

	public ResponseDataModel() {
		
	}
	
	public ResponseDataModel(int responseCode, String responseMsg) {
		this.responseCode = responseCode;
		this.responseMsg = responseMsg;
	}

	public ResponseDataModel(int responseCode, String responseMsg, Object data) {
		this.responseCode = responseCode;
		this.responseMsg = responseMsg;
		this.data = data;
	}
	//	Getter and setter

	/**
	 * @return the responseCode
	 */
	public int getResponseCode() {
		return responseCode;
	}

	/**
	 * @param responseCode the responseCode to set
	 */
	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}

	/**
	 * @return the responseMsg
	 */
	public String getResponseMsg() {
		return responseMsg;
	}

	/**
	 * @param responseMsg the responseMsg to set
	 */
	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}

	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}
	
}
