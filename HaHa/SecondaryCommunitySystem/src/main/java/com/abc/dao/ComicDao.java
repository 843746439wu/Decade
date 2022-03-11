/**
 * 
 */
package com.abc.dao;

import java.util.List;

import com.abc.domain.Comic;
import com.abc.utils.Page;

/**
 * @author Decade
 *
 */
public interface ComicDao {

	void addComic(Comic comic);
    List<Comic> loadComics();
    void delComic(String comic_name);
    Comic getComicByName(String comic_name);
    void updateComic(Comic comic);
    byte[] getPicByName(String comic_name);

}
