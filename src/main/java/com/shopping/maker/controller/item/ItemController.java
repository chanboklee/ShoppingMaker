package com.shopping.maker.controller.item;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		
		try {
			
			Map<String, List<MenuVO>> result = menuRepositoryImpl.findAllMenuList();
			model.addAttribute("category", result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
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
