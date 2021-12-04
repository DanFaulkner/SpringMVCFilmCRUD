package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO dao;

	@GetMapping({ "/", "/index" })
	public String index(Model model) {
		model.addAttribute("message", "I'm ALIVE!");
		return "home";
	}

	@GetMapping("searchById")
	public String searchById(Model model, @RequestParam("id") int id) throws SQLException {
		Film film = dao.getFilmById(id);
		model.addAttribute("result", film);
		return "result";
	}

	@GetMapping("searchByKeyword")
	public String searchByKeyword(Model model, @RequestParam("keyword") String keyword) throws SQLException {
		List<Film> films = dao.getFilmByKeyword(keyword);
		model.addAttribute("results", films);
		return "result";
	}

}
