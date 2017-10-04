package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Slideshow;

public interface ISlideshowService {

	List<Slideshow> findSlideshow();

	List<Slideshow> findSlideshowOnstatus();

	boolean updateSlideshowStatus(Slideshow slideshow);

	boolean addSlideshow(Slideshow slideshow);

	boolean deleteSlideshow(Integer id);

	Slideshow findSlideshowById(Integer id);

	boolean updateSlideshow(Slideshow slideshow);

}
