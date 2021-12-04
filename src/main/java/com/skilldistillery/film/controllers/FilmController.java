package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO dao;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("message", "I'm ALIVE!");
		return "home";
	}

	@PostMapping("/search")
	public String search(Model model, @RequestParam(name = "id", required = false, defaultValue = "-1") int id,
			@RequestParam(name = "keyword", required = false) String keyword) throws SQLException {
		if (id > 0) {
			Film film = dao.getFilmById(id);
			model.addAttribute("result", film);

			if (film == null) {
				model.addAttribute("message", String.format("Film with id `%d` not found.", id));
			}
		} else if (keyword != null) {
			List<Film> films = dao.getFilmByKeyword(keyword);
			model.addAttribute("results", films);

			if (films != null) {
				model.addAttribute("message", String.format("There were %d results found.", films.size()));
			} else {
				model.addAttribute("message", "There were no results found.");
			}
		} else {
			model.addAttribute("message", "Invalid search");
		}
		return "home";
	}

}
