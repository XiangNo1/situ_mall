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

	@Override
	public List<Slideshow> findSlideshowOnstatus() {
		// TODO Auto-generated method stub
		return slideshowDao.findSlideshowOnstatus();
	}

	@Override
	public boolean updateSlideshowStatus(Slideshow slideshow) {
		// TODO Auto-generated method stub
		int i = slideshowDao.updateSlideshowStatus(slideshow);
		return i > 0?true:false;
	}

	@Override
	public boolean addSlideshow(Slideshow slideshow) {
		// TODO Auto-generated method stub
		int i = slideshowDao.addSlideshow(slideshow);
		return i>0?true:false;
		
		
	}

	@Override
	public boolean deleteSlideshow(Integer id) {
		// TODO Auto-generated method stub
		int i = slideshowDao.deleteSlideshow(id);
		return i > 0?true:false;
	}

	@Override
	public Slideshow findSlideshowById(Integer id) {
		// TODO Auto-generated method stub
		return slideshowDao.findSlideshowById(id);
	}

	@Override
	public boolean updateSlideshow(Slideshow slideshow) {
		// TODO Auto-generated method stub
		int i = slideshowDao.updateSlideshow(slideshow);
		return i > 0?true : false;
	}
	
}
