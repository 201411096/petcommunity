package com.mycompany.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.AnimalVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.service.AnimalService;
import com.mycompany.util.FileUpload;

@Controller
public class AnimalController {

	@Autowired
	private AnimalService animalService;

	@RequestMapping(value = "animalinsert.do", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public ModelAndView animalinsert(AnimalVO vo, HttpServletRequest request, MultipartHttpServletRequest mtfRequest)
			throws IOException {
		/*
		 * System.out.println(vo.getAnimalBirthday()+vo.getAnimalGender()+vo.
		 * getAnimalFeature()+vo.getAnimalName());
		 */

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

		ModelAndView mv = new ModelAndView();
		int result = animalService.animalinsert(vo, mvo);

		FileUpload.makeDirectory(request.getSession().getServletContext().getRealPath("resources/imgs") + "/animal/");
		FileUpload.uploadFiles(mtfRequest, request.getSession().getServletContext().getRealPath("resources/imgs")
				+ "/animal/" + vo.getAnimalId() + "/");

		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("animalresult");

			return mv;
		} else {
			mv.addObject("result", result);
			mv.setViewName("mypageAnimal");
			return mv;
		}
	}

	@RequestMapping(value = "mypageselect.do")
	public ModelAndView animalSelect(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

		List<AnimalVO> list = animalService.animalSelect(mvo);
		
		
		for (AnimalVO i : list) {

			String directoryPath = req.getSession().getServletContext().getRealPath("resources/imgs")
					+ "/animal/" + i.getAnimalId();
		
			File dir = new File(directoryPath);
			File fileList[] = dir.listFiles();
		
			if (fileList != null) {
				for (File file : fileList) {
					i.setImgAnimal(file.getName());
				}
			}
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("animalList", list);
		mv.setViewName("mypage");
		return mv;

	}

	// 반려동물 정보 삭제
	@RequestMapping(value = "animalDelete.do")
	public String animalDelete(AnimalVO vo) {
		animalService.animalDelete(vo);
		return "redirect:/mypageselect.do";
	}

	// 반려동물 정보 수정
	@RequestMapping(value = "animalUpdate.do")
	public String animalUpdate(AnimalVO vo) {

		animalService.animalUpdate(vo);
		return "redirect:/mypageselect.do";

	}

}
