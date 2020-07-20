package com.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.service.FindHospitalServiceImpl;

@Controller
public class HospitalController {
	@Autowired
	FindHospitalServiceImpl findHospitalService;

	@RequestMapping(value="/findHospitalList.do")

	public void hospital() {

	}

}
