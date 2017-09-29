package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.SlideshowDao;
import com.situ.mall.pojo.Slideshow;

@Service
public class SlideshowServiceImpl implements ISlideshowService{
	
	@Autowired
	private SlideshowDao slideshowDao;

	@Override
	public List<Slideshow> findSlideshow() {
		// TODO Auto-generated method stub
		return slideshowDao.findSlideshow();
	}
	
}
