package com.mycompany.domain;

import java.util.ArrayList;

public class StringListVO {
	private ArrayList<StringListVO> stringListVO;
	private String element;
	public ArrayList<StringListVO> getStringListVO() {
		return stringListVO;
	}
	public void setStringListVO(ArrayList<StringListVO> stringListVO) {
		this.stringListVO = stringListVO;
	}
	public String getElement() {
		return element;
	}
	public void setElement(String element) {
		this.element = element;
	}

}
