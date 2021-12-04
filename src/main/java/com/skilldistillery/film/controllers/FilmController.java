package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO dao;

	@GetMapping("/")
	public String index(Model model) {
		return "home";
	}

	@GetMapping("/search")
	public String search(Model model, @RequestParam(name = "id", required = false, defaultValue = "-1") int id,
			@RequestParam(name = "keyword", required = false) String keyword) {
		try {
			if (id > 0) {
				Film film = dao.getFilmById(id);
				model.addAttribute("result", film);

				if (film == null) {
					model.addAttribute("warning", String.format("Film with id `%d` not found.", id));
				}
			} else if (keyword != null) {
				List<Film> films = dao.getFilmByKeyword(keyword);
				model.addAttribute("results", films);

				if (films != null) {
					model.addAttribute("success", String.format("There were %d results found.", films.size()));
				} else {
					model.addAttribute("warning", "There were no results found.");
				}
			} else {
				model.addAttribute("error", "Invalid search");
			}
		} catch (Exception e) {
			model.addAttribute("error", "Oops! Something went wrong.");
			e.printStackTrace();
		}
		return "home";
	}

	@PostMapping("/create")
	public String create(Film film, RedirectAttributes redir) {
		try {
			if (dao.createFilm(film)) {
				// dao.createFilm should populate film.id for us
				redir.addFlashAttribute("success", "Film successfully created!");
				return "redirect:/search?id=" + film.getId();
			} else {
				throw new Exception("Failed to create film.");
			}
		} catch (Exception e) {
			redir.addFlashAttribute("error", e.getMessage() + ": " + film.toString());
			e.printStackTrace();
		}
		return "redirect:/";
	}

}
