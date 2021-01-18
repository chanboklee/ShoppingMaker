package com.shopping.maker.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.io.Files;
import com.shopping.maker.entity.Member;
import com.shopping.maker.service.MemberRepositoryImpl;
import com.shopping.maker.vo.MemberModifyVO;
import com.shopping.maker.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberRepositoryImpl memberRepositoryImpl;

	@RequestMapping("/")
	public String main(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession(true);
		
		if(session.getAttribute("userSession") != null) {
			MemberVO userSession = (MemberVO) session.getAttribute("userSession");
			
			model.addAttribute("userVo", userSession);
			System.out.println("userSession = "+userSession);
		}
				
		return "main";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest req, Model model) throws Exception{
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("userSession");
		
		return "main";
	}
	
	@RequestMapping("/join.do")
	public String join(HttpServletRequest req, Model model) throws Exception{
		return "join";
	}
	
	@RequestMapping("/memberJoin.do")
	@ResponseBody
	public Map<String, String> memberJoin(@Valid Member member, HttpServletRequest req, Model model) throws Exception{
		
		System.out.println("member = "+member);
		
		String msg = "";
		String location = "";
		Map<String, String> map = new HashMap<>();
		
		try {
			Optional<Member> result = memberRepositoryImpl.saveMember(member);
			if(result!=null) {
				msg = "Welcome To ShopStyle!";
				location = "/login.do";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			msg = e.getMessage()+"다음과 같은 에러로 회원가입에 실패하셨습니다.";
		}
		
		map.put("msg", msg);
		map.put("location", location);
		
		return map;
	}
	
	@RequestMapping("/memberLogin.do")
	@ResponseBody
	public Map<String, String> memberLogin(@Valid MemberVO memberVo, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession(true);
		Map<String, String> map = new HashMap<String, String>();
		
		String msg = "";
		String location = "";
		
		try {

			boolean result = memberRepositoryImpl.loginMember(memberVo);
			if(result) {
				session.setAttribute("userSession", memberVo);
				msg = memberVo.getLoginId()+"님 ShoppingMaker에 오신 것을 환영합니다.";
				location = "/";
			}else {
				session.setAttribute("userSession", null);
				msg = "아이디나 비밀번호를 다시 확인해주세요.";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		map.put("msg", msg);
		map.put("location", location);
		
		return map;
	}
	
	@RequestMapping("/modify.do")
	public String modifyUser() {
		return "modifyUser";
	}
	
	@RequestMapping("/memberModify.do")
	@ResponseBody
	public Map<String, String> memberModify(@Valid MemberModifyVO memberModifyVo) throws Exception{
		
		Map<String, String> map = new HashMap<>();
		
		try {
			
			memberRepositoryImpl.modifyMember(memberModifyVo);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
						
		return map;
	}
	
	@RequestMapping("/regItems.do")
	public String regItems() {
		return "registerItems";
	}
	
	
	@RequestMapping("/itemUpload.do")
	public String itemUpload(@RequestParam MultipartFile files) throws Exception{
	
		String sourceFileName = files.getOriginalFilename();
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
		String fileUrl = "D:\\pjt_tool\\AttachFile";
		File destinationFile;
		String destinationFileName;
		try {
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);	
			} while (destinationFile.exists());
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "";
	}
	
}
