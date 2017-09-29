package com.situ.mall.pojo;

public class Slideshow {

	private Integer id;
	private String uri;
	private Integer status;
	private String link;
	
	public Slideshow(String uri, Integer status, String link) {
		super();
		this.uri = uri;
		this.status = status;
		this.link = link;
	}
	public Slideshow() {
		super();
	}
	public Slideshow(Integer id, String uri, Integer status, String link) {
		super();
		this.id = id;
		this.uri = uri;
		this.status = status;
		this.link = link;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "SlideShow [id=" + id + ", uri=" + uri + ", status=" + status + ", link=" + link + "]";
	}
	
}
