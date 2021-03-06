package com.pae.maja.forb.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pae.maja.forb.model.Forb;
@Service
public class ForbServiceImpl implements ForbService {

	@Autowired
	private ForbDAO forbDAO;
	
	@Override
	@Transactional
	public void addForb(Forb forb) {
		forbDAO.addForb(forb);
	}

	@Override
	@Transactional(readOnly=true)
	public Forb getForb(Forb forb) {
		return forbDAO.getForb(forb);
	}

	@Override
	@Transactional
	public void modifyForb(Forb forb) {
		forbDAO.modifyForb(forb);
	}

	@Override
	public void deleteForb(Forb forb) {
		forbDAO.deleteForb(forb);		
	}

	@Override
	public void infoChange(Forb forb) {
		forbDAO.infoChange(forb);
	}

}
