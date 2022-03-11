package com.abc.domain;

import lombok.Getter;

import java.util.Arrays;
import java.util.Date;

/**
 * 
 * @author Decade
 *
 */

public class Comic extends ValueObject{
	
	private String comic_pinyin;
	private String comic_name;
	private int comic_number;
	private byte[] comic_pic;
	private String comic_introduce;
	private String comic_type1;  //动漫来自哪个国家
	private String comic_type2;  //动漫类型：科幻、搞笑
	private String comic_time;
	private String comic_platform;  //授权平台
	private String comic_aplatform;  //授权平台网站网址
	private String comic_bplatform;  //网页观看网址

	public String getComic_pinyin() {
		return comic_pinyin;
	}

	public void setComic_pinyin(String comic_pinyin) {
		this.comic_pinyin = comic_pinyin;
	}

	public String getComic_name() {
		return comic_name;
	}

	public void setComic_name(String comic_name) {
		this.comic_name = comic_name;
	}

	public int getComic_number() {
		return comic_number;
	}

	public void setComic_number(int comic_number) {
		this.comic_number = comic_number;
	}

	public byte[] getComic_pic() {
		return comic_pic;
	}

	public void setComic_pic(byte[] comic_pic) {
		this.comic_pic = comic_pic;
	}

	public String getComic_introduce() {
		return comic_introduce;
	}

	public void setComic_introduce(String comic_introduce) {
		this.comic_introduce = comic_introduce;
	}

	public String getComic_type1() {
		return comic_type1;
	}

	public void setComic_type1(String comic_type1) {
		this.comic_type1 = comic_type1;
	}

	public String getComic_type2() {
		return comic_type2;
	}

	public void setComic_type2(String comic_type2) {
		this.comic_type2 = comic_type2;
	}

	public String getComic_time() {
		return comic_time;
	}

	public void setComic_time(String comic_time) {
		this.comic_time = comic_time;
	}

	public String getComic_platform() {
		return comic_platform;
	}

	public void setComic_platform(String comic_platform) {
		this.comic_platform = comic_platform;
	}

	public String getComic_aplatform() {
		return comic_aplatform;
	}

	public void setComic_aplatform(String comic_aplatform) {
		this.comic_aplatform = comic_aplatform;
	}

	public String getComic_bplatform() {
		return comic_bplatform;
	}

	public void setComic_bplatform(String comic_bplatform) {
		this.comic_bplatform = comic_bplatform;
	}

	@Override
	public String toString() {
		return "Comic{" +
				"comic_pinyin='" + comic_pinyin + '\'' +
				", comic_name='" + comic_name + '\'' +
				", comic_number=" + comic_number +
				", comic_pic=" + Arrays.toString(comic_pic) +
				", comic_introduce='" + comic_introduce + '\'' +
				", comic_type1='" + comic_type1 + '\'' +
				", comic_type2='" + comic_type2 + '\'' +
				", comic_time='" + comic_time + '\'' +
				", comic_platform='" + comic_platform + '\'' +
				", comic_aplatform='" + comic_aplatform + '\'' +
				", comic_bplatform='" + comic_bplatform + '\'' +
				'}';
	}
}
