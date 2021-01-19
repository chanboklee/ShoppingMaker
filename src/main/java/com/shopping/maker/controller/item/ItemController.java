package com.shopping.maker.controller.item;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.maker.service.menu.MenuRepositoryImpl;
import com.shopping.maker.vo.MenuVO;

@Controller
public class ItemController {
	
	@Autowired
	private MenuRepositoryImpl menuRepositoryImpl;
	
	
	@RequestMapping("/addItemList.do")
	public String itemList(Model model) throws Exception{
		
		List<MenuVO> mainCategory = new ArrayList<>();
		List<MenuVO> middleCategory = new ArrayList<>();
		
		try {
			
			List<MenuVO> result = menuRepositoryImpl.findAllMenuList();

			
			for(int i=0; i<result.size(); i++) {
				System.out.println("menuNm="+result.get(i).getMenuNm()+", collapseYn="+result.get(i).getCollapseYn());
			}
			
			  for(int i=0; i<result.size(); i++) {
				  if(result.get(i).getCollapseYn().equals("Y")) {
					  System.out.println("대분류 타겠지"); 
					  mainCategory.add(new MenuVO(result.get(i).getMenuNm(), result.get(i).getCollapseYn()));
				  }else {
					  System.out.println("중분류 타겠지");
				  } 
			  }
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("middleCategory", middleCategory);
		
		return "addItemList";
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
