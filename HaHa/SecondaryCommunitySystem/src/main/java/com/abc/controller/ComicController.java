/**
 * 
 */
package com.abc.controller;

import com.abc.dao.AdminDao;
import com.abc.dao.AdminDaoJDBCImpl;
import com.abc.domain.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.abc.dao.ComicDao;
import com.abc.dao.ComicDaoJDBCImpl;
import com.abc.domain.Comic;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * @author Decade
 *
 */
@Controller
public class ComicController {

	@GetMapping("/comics/input")
	private String toInput() throws Exception{

		return "comic/input_comic";
	}

	@PostMapping("/comics")
	public String createComic(Comic comic, MultipartFile comicpic) throws Exception{

		comic.setComic_pic(comicpic.getBytes());
		ComicDao comicDao = new ComicDaoJDBCImpl();
		comicDao.addComic(comic);
		return "redirect:/comics";
	}
	
	@GetMapping("/comics")
	public String loadComics(Model model) throws Exception{
		
		ComicDao comicDao = new ComicDaoJDBCImpl();
		model.addAttribute("comicList", comicDao.loadComics());
		
		return "comic/list_comic";
		
	}
	
	@GetMapping("/comics/{comic_name}")
	public String preUpdate(@PathVariable String comic_name, Model model) throws Exception{
		
		ComicDao comicDao = new ComicDaoJDBCImpl();
		Comic comic = comicDao.getComicByName(comic_name);
		
		model.addAttribute("comic", comic);
		
		return "comic/update_comic";
		
	}
	
	@PostMapping("/comics/{comic_name}")
	public String updateComic(Comic comic,MultipartFile comicpic,@PathVariable String comic_name) throws Exception{

		comic.setComic_name(comic_name);
		comic.setComic_pic(comicpic.getBytes());
		ComicDao comicDao = new ComicDaoJDBCImpl();
		comicDao.updateComic(comic);
        return "redirect:/comics";
	}
	
	@DeleteMapping("/comics/{comic_name}")
	public String removeComic(@PathVariable String comic_name) throws Exception{

		ComicDao comicDao = new ComicDaoJDBCImpl();
		comicDao.delComic(comic_name);
		 
		return "redirect:/comics";
		
	}

	@GetMapping("/comics/{comic_name}/comicpic")
	public String getComicPic(@PathVariable String comic_name, HttpServletResponse response, HttpServletRequest request) throws Exception{

		ComicDao comicDao = new ComicDaoJDBCImpl();
		byte[] picData = comicDao.getPicByName(comic_name);

		if(picData==null || picData.length==0){
			String imgPath = request.getRealPath("/static/pic/default.jpg");
			System.out.println(imgPath);
			FileInputStream fis = new FileInputStream(imgPath);
			picData = new byte[fis.available()];
			fis.read(picData);
			fis.close();
		}

		OutputStream oos = response.getOutputStream();
		response.setContentType("image/jpeg");
		oos.write(picData);
		oos.flush();
		oos.close();

		return null;

	}

	@GetMapping("/user_comic")
	public String loadUserComics(Model model) throws Exception{

		ComicDao comicDao = new ComicDaoJDBCImpl();
		model.addAttribute("comicList", comicDao.loadComics());

		return "user/comic_user";

	}

	@GetMapping("/user_comic/{comic_name}")
	public String getComics(@PathVariable String comic_name,Model model,Model model1) throws Exception{

		ComicDao comicDao = new ComicDaoJDBCImpl();
		Comic comic = comicDao.getComicByName(comic_name);
		model.addAttribute("comic", comic);

		model1.addAttribute("comicList", comicDao.loadComics());

		return "user/collect_user";

	}
	
}
