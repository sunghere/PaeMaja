package com.pae.maja.forb.dao;

import com.pae.maja.forb.model.Forb;

public interface ForbService {
	void addForb(Forb forb);
	void getForb(int pseq);
	void modifyForb(Forb forb);
}