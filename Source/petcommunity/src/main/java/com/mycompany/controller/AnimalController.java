package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.AnimalVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	private AnimalService animalService;
	
	
	@RequestMapping(value="animalinsert.do")
	public ModelAndView animalinsert(AnimalVO vo,HttpServletRequest req) {
		/*
		 * System.out.println(vo.getAnimalBirthday()+vo.getAnimalGender()+vo.
		 * getAnimalFeature()+vo.getAnimalName());
		 */
		 
		HttpSession session = req.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("memberVO");
		
		ModelAndView mv = new ModelAndView();
		int result=animalService.animalinsert(vo,mvo); 
		
		if(result > 0) {
		mv.addObject("result",result);
		mv.setViewName("animalresult");
		return mv;
		}
		else {
			mv.addObject("result",result);
			mv.setViewName("mypageAnimal");
			return mv;
		}
	}
	
	@RequestMapping(value="mypageselect.do")
	public ModelAndView animalSelect(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("memberVO");
		
		List<AnimalVO> list=animalService.animalSelect(mvo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("animalList", list);
		mv.setViewName("mypage");
		return mv;
		
	}
	
	
	//반려동물 정보 삭제 
	@RequestMapping(value="animalDelete.do")
	public String animalDelete(AnimalVO vo) {
		animalService.animalDelete(vo);
		return "redirect:/mypageselect.do";
	}
	

/*	//반려동물 정보 수정
	@RequestMapping(value="updateAnimal.do")
	public String animalUpdate(AnimalVO vo) {
		
		 * System.out.println(vo.getAnimalBirthday()+vo.getAnimalFeature()+vo.
		 * getAnimalGender()+ vo.getAnimalId()+vo.getAnimalName());
		 
		return null;
		
	}*/
	
}
