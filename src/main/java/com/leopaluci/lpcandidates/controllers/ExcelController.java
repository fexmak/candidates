package com.leopaluci.lpcandidates.controllers;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.leopaluci.lpcandidates.bo.Quota;
import com.leopaluci.lpcandidates.bo.ServiceOrder;
import com.leopaluci.lpcandidates.services.EventService;
import com.leopaluci.lpcandidates.services.QuotaService;
import com.leopaluci.lpcandidates.services.ServiceOrderService;
import com.leopaluci.lpcandidates.services.TimelineService;




@RequestMapping("/excel")
@Controller
public class ExcelController {
	
	@Autowired
	QuotaService quotaService;
	@Autowired
	TimelineService timelineService;// testing purposes
	@Autowired
	EventService eventService;// testing purposes
	@Autowired
	ServiceOrderService serviceOrderService;
	
	
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String details() {

		
			return null;	
	}

	/**
	 * Upload single file using Spring Controller
	 */
	
	
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFile(@RequestParam("file") MultipartFile file) {

		String fileName = file.getOriginalFilename();
        System.out.println(file.getOriginalFilename());
        System.out.println(file.getContentType());
   

		
		if (!file.isEmpty()){
			if(fileName.endsWith(".xls") || fileName.endsWith(".xlsx")){
			try {
				
				
				
				byte [] byteArr = file.getBytes();
				InputStream inputStream = new ByteArrayInputStream(byteArr);	
				
				Workbook workbook = WorkbookFactory.create(inputStream);
				Sheet firstSheet = workbook.getSheetAt(0);
				Iterator<Row> iterator = firstSheet.iterator();

				while (iterator.hasNext()) {
					Row nextRow = iterator.next();
					Iterator<Cell> cellIterator = nextRow.cellIterator();
					ServiceOrder serviceOrder = new ServiceOrder();
					Quota quota = new Quota();

					while (cellIterator.hasNext()) {
						Cell nextCell = cellIterator.next();
						int columnIndex = nextCell.getColumnIndex();

						switch (columnIndex) {
						case 0:
							serviceOrder.setServiceOrderId((long)

							nextCell.getNumericCellValue());
							break;
						case 1:
							serviceOrder.setProjectManager

							(nextCell.getStringCellValue());
							break;
						case 2:
							serviceOrder.setRecruiter(nextCell.getStringCellValue());
							break;
						case 3:
							quota.setJobCode((int) nextCell.getNumericCellValue());
							break;
						case 4:
							quota.setJobTitle(nextCell.getStringCellValue());
							break;
						case 5:
							quota.setJobGrade(nextCell.getStringCellValue());
							break;
						}

					}

					serviceOrderService.save(serviceOrder);
					quota.setServiceOrder(serviceOrder);
					quotaService.save(quota);
				}

				workbook.close();
				inputStream.close();
				
				
				
				
				return "You successfully uploaded file=" + fileName;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "You failed to upload " + fileName ;
			}
		} else {
			return "File type not supported";
		}
	}else{
		
		return "You failed to upload " + fileName
		+ " because the file was empty.";
	}
	}
	
	@ControllerAdvice
	public class MyErrorController extends ResponseEntityExceptionHandler {


	@ExceptionHandler(MultipartException.class)
	@ResponseBody
	String handleFileException(HttpServletRequest request, Throwable ex) {
	    
	    return "You have exceeded the maximun size allowed (5MB)!";
	  }
	}

	
}