package com.pae.maja.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pae.maja.forb.dao.ForbService;
import com.pae.maja.forb.model.Forb;

@Controller
public class ForbController {
	private static final Logger logger = LoggerFactory.getLogger(ForbController.class);

	@Autowired
	private ForbService service;
	
	
	@RequestMapping(value = "getforb.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Forb getforb(Model model,int pseq,int id) throws Exception {
		Forb forb = new Forb();
		Forb forb2 = new Forb();
        logger.info("qseq---------------------------------!"+pseq);
        forb.setShopseq(pseq);
        forb.setIdseq(id);
		forb2 = service.getForb(forb);

        logger.info("frbs---------------------------------!"+forb);
		return forb2;
	}
	
	@RequestMapping(value = "addforb.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void addforb(Model model,int pseq,int idseq, int forbs) throws Exception {
		Forb forb = new Forb();
		forb.setIdseq(idseq);
		forb.setShopseq(pseq);
		forb.setForbs(forbs);
		service.addForb(forb);
		return;
	}
	
	@RequestMapping(value = "deleteforb.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void deleteforb(Model model,int pseq,int idseq) throws Exception {
		Forb forb = new Forb();
		forb.setIdseq(idseq);
		forb.setShopseq(pseq);
		service.deleteForb(forb);
		return;
	}
	
	@RequestMapping(value = "modifyforb.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void modifyforb(Model model,int pseq,int idseq, int forbs) throws Exception {
		Forb forb = new Forb();
		forb.setIdseq(idseq);
		forb.setShopseq(pseq);
		forb.setForbs(forbs);
		service.modifyForb(forb);
		return;
	}

}
