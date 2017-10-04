package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Slideshow;

public interface SlideshowDao {

	List<Slideshow> findSlideshow();

	List<Slideshow> findSlideshowOnstatus();

	int updateSlideshowStatus(Slideshow slideshow);

	int addSlideshow(Slideshow slideshow);

	int deleteSlideshow(Integer id);

	Slideshow findSlideshowById(Integer id);

	int updateSlideshow(Slideshow slideshow);

}
